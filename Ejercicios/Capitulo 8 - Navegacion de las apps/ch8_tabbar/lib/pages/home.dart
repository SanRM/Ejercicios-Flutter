import 'package:flutter/material.dart';
import 'birthdays.dart';
import 'gratitude.dart';
import 'reminders.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> pageNames = ['Birthdays', 'Gratitude', 'Reminders'];
  String currentPageName = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_tabChanged);
    currentPageName = pageNames[0]; // Establecer el nombre de la primera página
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _tabChanged() {
    if (_tabController.indexIsChanging) {
      setState(() {
        currentPageName = pageNames[_tabController.index];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentPageName), // Mostrar el nombre de la página actual en la barra de título
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            Birthdays(),
            Gratitude(),
            Reminders(),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: TabBar(
          controller: _tabController,
          labelColor: Color.fromARGB(255, 30, 207, 148),
          unselectedLabelColor: Colors.cyan,
          tabs: const [
            Tab(
              icon: Icon(Icons.cake),
              text: 'Birthdays',
            ),
            Tab(
              icon: Icon(Icons.sentiment_satisfied),
              text: 'Gratitude',
            ),
            Tab(
              icon: Icon(Icons.access_alarm),
              text: 'Reminders',
            ),
          ],
        ),
      ),
    );
  }
}
