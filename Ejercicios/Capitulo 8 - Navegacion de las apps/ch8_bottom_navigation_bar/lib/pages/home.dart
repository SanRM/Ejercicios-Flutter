import 'package:flutter/material.dart';
import 'birthdays.dart';
import 'reminders.dart';
import 'gratitude.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List _listPages = [];
  Widget? _currentPage;
  Color? colorSelected;

  void _changePage(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
      _currentPage = _listPages[selectedIndex];
    });
  }

  @override
  void initState() {
    super.initState();

    _currentPage = Birthdays();

    _listPages.add(Birthdays());
    _listPages.add(Gratitude());
    _listPages.add(Reminders());
  }

  Color? selectColor() {
    setState(() {
      switch (_currentPage) {
        case Birthdays():
          colorSelected = const Color.fromARGB(255, 255, 213, 97);
          break;

        case Gratitude():
          colorSelected = const Color.fromARGB(255, 74, 211, 211);
          break;

        case Reminders():
          colorSelected = const Color.fromARGB(255, 247, 100, 119);
          break;

        default:
          colorSelected = Colors.grey;
      }
    });

    return colorSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('$_currentPage page'),
          centerTitle: true,
          backgroundColor: selectColor()),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _currentPage,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (selectedIndex) => _changePage(selectedIndex),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.cake), label: 'Birthdays'),
          BottomNavigationBarItem(icon: Icon(Icons.sentiment_satisfied), label: 'Gratitude'),
          BottomNavigationBarItem(icon: Icon(Icons.access_alarm), label: 'Reminders')
        ],
      ),
    );
  }
}
