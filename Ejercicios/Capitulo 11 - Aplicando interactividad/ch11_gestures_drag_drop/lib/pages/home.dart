import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _gestureDetected;
  Color color = Color.fromARGB(255, 191, 219, 255);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _buildGestureDetector(),
                SizedBox(height: 20),
                Container(
                  color: const Color.fromARGB(255, 243, 243, 243),
                  child: Column(
                    children: [
                      _buildDraggable(),
                      SizedBox(height: 20),
                      _buildDragTarget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildGestureDetector() {
    return GestureDetector(
      onTap: () {
        print('onTap');
        _displayGestureDetected('onTap');
      },

      onDoubleTap: () {
        print('onDoubleTap');
        _displayGestureDetected('onDoubleTap');
      },

      onLongPress: () {
        print('onLongPress');
        _displayGestureDetected('onLongPress');
      },

      onPanUpdate: (details) {
        print('onPanUpdate: $details');
        _displayGestureDetected('onPanUpdate: \n$details');
      },

      // onVerticalDragUpdate: ((DragUpdateDetails details) {
      // print('onVerticalDragUpdate: $details');
      // _displayGestureDetected('onVerticalDragUpdate:\n$details');
      // }),

      // onHorizontalDragUpdate: (DragUpdateDetails details) {
      // print('onHorizontalDragUpdate: $details');
      // _displayGestureDetected('onHorizontalDragUpdate:\n$details');
      // },

      // onHorizontalDragEnd: (DragEndDetails details) {
      //   print('onHorizontalDragEnd: $details');
      //   _displayGestureDetected('onHorizontalDragEnd: \n$details');
      //   if (details.primaryVelocity! < 0) {
      //     print('Dragging Right to Left: ${details.velocity}');
      //   } else if (details.primaryVelocity! > 0) {
      //     print('Dragging Left to Right: ${details.velocity}');
      //   }
      // },

      child: Container(
        color: const Color.fromARGB(255, 175, 230, 255),
        width: double.infinity,
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const Icon(
              Icons.access_alarm,
              size: 98,
            ),
            Text('$_gestureDetected'),
          ],
        ),
      ),
    );
  }

  void _displayGestureDetected(String getsure) {
    setState(() {
      _gestureDetected = getsure;
    });
  }

  Container _buildDraggable() {
    
    return Container(
      padding: const EdgeInsets.all(25),
      color: Color.fromARGB(255, 255, 225, 233),
      width: double.infinity,
      child: Center(
        child: Draggable<String>(
          childWhenDragging: const Column(
            children: [
              Icon(
                Icons.palette,
                color: Color.fromARGB(255, 253, 146, 209),
                size: 98,
              ),
              SizedBox(height: 10),
              Text(
                'Estás arrastrando el pincel',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 98, 145), fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          feedback: const Icon(
            Icons.brush,
            color: Colors.cyan,
            size: 80,
          ),
          
          data: 'Verde',
          child: Column(
            children: [
              const Icon(
                Icons.palette,
                color: Colors.pink,
                size: 98,
              ),
              SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'Arrástrame para seleccionar el pincel',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildDragTarget() {
    return  Center(
        child: 
            DragTarget(
          
            onWillAccept: (data) {
              // Aquí es donde cambiamos el color del contenedor padre si es necesario
              setState(() {
                color = Color.fromARGB(255, 179, 255, 217); // Cambia este color al que desees
              });
              return true;
            },
            onLeave: (data) {
              // Aquí es donde restauramos el color original si el objeto se retira del área de destino.
              setState(() {
                color = Color.fromARGB(255, 191, 219, 255); // Cambia este color al color original deseado
              });
            },
            onAccept:(data) {
                            setState(() {
                color = Color.fromARGB(255, 191, 219, 255); // Cambia este color al que desees
              });
            },
          
            builder: (context, acceptedData, rejectedData) {
              return acceptedData.isEmpty
                  ? Container(
                    padding: EdgeInsets.all(15),
                    width: double.infinity,
                    color: color,
                    child: const Text(
                      textAlign: TextAlign.center,
                        'Arrastra el pincel acá para pintar',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 153, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                  )
                  : Container(
                    padding: EdgeInsets.all(15),
                    width: double.infinity,
                    color: color,
                    child: Text(
                        textAlign: TextAlign.center,
                        'El nuevo color es: $acceptedData',
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 180, 120),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                  );
          },
            )
        );
  }

}
