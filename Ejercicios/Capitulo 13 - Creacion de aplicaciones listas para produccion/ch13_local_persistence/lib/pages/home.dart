import 'package:flutter/material.dart';
import 'package:ch13_local_persistence/pages/edit_entry.dart';
import 'package:ch13_local_persistence/classes/database.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Database? _database;

  Future<List<Journal>?> _loadJournals() async {
    await DatabaseFileRoutines().readJournals().then((journalsJson) {
      _database = DatabaseFileRoutines().databaseFromJson(journalsJson);
      _database!.journal!.sort((comp1, comp2) => comp2.date!.compareTo(comp1.date!));
    });
    return _database?.journal;
  }

  void _addOrEditJournal({bool? add, int? index, Journal? journal}) async {
    JournalEdit _journalEdit = JournalEdit(action: '', journal: journal);
    _journalEdit = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditEntry(
          add: add,
          index: index,
          journalEdit: _journalEdit,
        ),
        fullscreenDialog: true,
      ),
    );
    switch (_journalEdit.action) {
      case 'Save':
        if (add == 'Save') {
          setState(() {
            _database?.journal?.add(_journalEdit.journal!);
          });
        } else {
          setState(() {
            _database!.journal?[index!] = _journalEdit.journal!;
          });
        }
        DatabaseFileRoutines().writeJournals(DatabaseFileRoutines().databaseToJson(_database!));
        break;
      case 'Cancel':
        break;
      default:
        break;
    }
  }

  Widget _buildListViewSeparated(AsyncSnapshot snapshot) {
    return ListView.separated(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        String _titleDate = DateFormat.yMMMd().format(DateTime.parse(snapshot.data[index].date));
        String _subtitle = snapshot.data[index].mood + "\n" + snapshot.data[index].note;
        return Dismissible(
          key: Key(snapshot.data[index].id),
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 16.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          secondaryBackground: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          child: ListTile(
            leading: Column(
              children: <Widget>[
                Text(
                  DateFormat.d().format(DateTime.parse(snapshot.data[index].date)),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  DateFormat.E().format(DateTime.parse(snapshot.data[index].date)),
                ),
              ],
            ),
            title: Text(
              _titleDate,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(_subtitle),
            onTap: () {
              _addOrEditJournal(
                add: false,
                index: index,
                journal: snapshot.data[index],
              );
            },
          ),
          onDismissed: (direction) {
            setState(() {
              _database?.journal?.removeAt(index);
            });
            DatabaseFileRoutines().writeJournals(DatabaseFileRoutines().databaseToJson(_database!));
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.grey,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Journal Entries'),
      ),
      body: FutureBuilder(
        future: _loadJournals(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return _buildListViewSeparated(snapshot);
          } else {
            return Center(child: Text('No journal entries found.'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addOrEditJournal(add: true);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
