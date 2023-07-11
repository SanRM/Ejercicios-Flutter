import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar de la aplicación'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const ImagesAndIconWidget(),
                Divider(),
                const BoxDecoratorWidget(),
                Divider(),
                InputDecoratorsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InputDecoratorsWidget extends StatelessWidget {
  const InputDecoratorsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,

      style: TextStyle(
        color: Colors.blueAccent[200],
        fontSize: 20,
      ),
      decoration: InputDecoration(
        labelText: 'Text input',
        labelStyle: TextStyle(color: Color.fromARGB(255, 155, 155, 155)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        icon: Icon(Icons.list),
        suffix: Text('suffix')
      ),
    );
  }
}

class BoxDecoratorWidget extends StatelessWidget {
  const BoxDecoratorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(255, 252, 51, 61),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(115, 255, 124, 124),
            blurRadius: 10,
            offset: Offset(0, 10),
          )
        ]
      ),
    );
  }
}

class ImagesAndIconWidget extends StatelessWidget {
  const ImagesAndIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Texto',
          style: TextStyle(fontSize: MediaQuery.of(context).size.width / 18,),
        ),
        Image.network(
          'https://th.bing.com/th/id/R.ddccad74402b3a9b48a2b7c296536508?rik=wFwsJkUFv33fGQ&riu=http%3a%2f%2fwww.pngall.com%2fwp-content%2fuploads%2f4%2fCyberpunk-2077-Logo.png&ehk=Y74H5oQIwFnZ8VFoZbbL0bRwalgMPsI61KR2Dy%2bdDP4%3d&risl=&pid=ImgRaw&r=0',
          width: MediaQuery.of(context).size.width / 4,
        ),
        Icon(
          Icons.brush,
          color: Color.fromARGB(255, 0, 205, 212),
          size: MediaQuery.of(context).size.width / 10,
        ),
        Image(
          image: AssetImage('assets/images/Flutter_logo.png'),
          width: MediaQuery.of(context).size.width / 4,
        )
      ],
    );
  }
}
