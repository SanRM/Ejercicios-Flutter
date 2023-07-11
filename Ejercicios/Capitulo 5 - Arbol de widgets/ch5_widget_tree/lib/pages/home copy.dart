import "package:flutter/material.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

//2. REFRACTORIZAR CON METODOS

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Tree'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [

                _buildHorizontalRow(),
                Padding(padding: EdgeInsets.all(16)),
                _buildRowAndColumn(),
                _buildRowAndStack(),
                
                Divider(),
                Text('End of the line')

              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildRowAndStack() {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.lightGreen,
          radius: 100,
          child: Stack(
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.yellow,
              ),
              Container(
                height: 60,
                width: 60,
                color: Colors.amber,
              ),
              Container(
                height: 40,
                width: 40,
                color: Colors.brown,
              )
            ],
          ),
        )
      ],
    );
  }

  Row _buildRowAndColumn() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              color: Colors.yellow,
              height: 60,
              width: 60,
            ),
            Padding(padding: EdgeInsets.all(16)),
            Container(
              color: Colors.amber,
              height: 40,
              width: 40,
            ),
            Padding(padding: EdgeInsets.all(16)),
            Container(
              color: Colors.brown,
              height: 20,
              width: 20,
            ),
            Divider(),
          ],
        )
      ],
    );
  }

  Row _buildHorizontalRow() {
    return Row(
      children: [
        Container(
          color: Colors.yellow,
          height: 40,
          width: 40,
        ),
        Padding(padding: EdgeInsets.all(16)),
        Expanded(
          child: Container(color: Colors.amber, height: 40),
        ),
        Padding(padding: EdgeInsets.all(16)),
        Container(
          color: Colors.brown,
          height: 40,
          width: 40,
        ),
      ],
    );
  }
}
