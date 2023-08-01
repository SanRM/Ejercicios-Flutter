import 'package:ch11_dismissible/pages/Trip.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Trip> _trips = [];

  @override
  void initState() {
    super.initState();
    _trips
      ..add(Trip(id: '0', tripName: 'Rome', tripLocation: 'Italy'))
      ..add(Trip(id: '1', tripName: 'Paris', tripLocation: 'France'))
      ..add(Trip(id: '2', tripName: 'New York', tripLocation: 'USA - New York'))
      ..add(Trip(id: '3', tripName: 'Cancun', tripLocation: 'Mexico'))
      ..add(Trip(id: '4', tripName: 'London', tripLocation: 'England'))
      ..add(Trip(id: '5', tripName: 'Sydney', tripLocation: 'Australia'))
      ..add(Trip(id: '6', tripName: 'Miami', tripLocation: 'USA - Florida'))
      ..add(Trip(id: '7', tripName: 'Rio de Janeiro', tripLocation: 'Brazil'))
      ..add(Trip(id: '8', tripName: 'Cusco', tripLocation: 'Peru'))
      ..add(Trip(id: '9', tripName: 'New Delhi', tripLocation: 'India'))
      ..add(Trip(id: '10', tripName: 'Tokyo', tripLocation: 'Japan'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView.builder(
        itemCount: _trips.length,
        itemBuilder: (context, index) {
          return Dismissible(
            confirmDismiss: (direction) async {

              bool dismiss = await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Confirmar eliminación'),
                    content: Text('¿Estás seguro de que deseas eliminar este elemento?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pop(false); // No descartar el widget
                        },
                        child: Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pop(true); // Descartar el widget
                        },
                        child: Text('Aceptar'),
                      ),
                    ],
                  );
                },
              );

              return dismiss; // Devuelve true o false según la elección del usuario
            },
            key: Key(_trips[index].id.toString()),
            background: _buildCompleteTrip(),
            secondaryBackground: _buildRemoveTrip(),
            onDismissed: (DismissDirection direction) {
              direction == DismissDirection.startToEnd
                  ? _markTripCompleted()
                  : _deleteTrip();
              // Remove item from List
              setState(() {
                _trips.removeAt(index);
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Elemento descartado'), backgroundColor: const Color.fromARGB(255, 0, 0, 0)),
              );

            },
            child: _buildListTile(index),
          );
        },
      ),
    );
  }

  ListTile _buildListTile(int index) {
    return ListTile(
      title: Text('${_trips[index].tripName}'),
      subtitle: Text('${_trips[index].tripLocation}'),
      leading: const Icon(Icons.flight),
      trailing: const Icon(Icons.fastfood),
    );
  }

  Container _buildCompleteTrip() {
    return Container(
      color: Colors.green,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.done,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Container _buildRemoveTrip() {
    return Container(
      color: Colors.red,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  void _markTripCompleted() {
    // Mark trip completed in Database or web service
  }
  void _deleteTrip() {
    // Delete trip from Database or web service
  }
}
