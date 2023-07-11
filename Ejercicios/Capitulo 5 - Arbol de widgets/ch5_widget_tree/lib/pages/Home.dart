import "package:flutter/material.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

//1. ------------------------
//2. REFRACTORIZAR CON CLASES
//1. ------------------------

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Tree'),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                
                RowWidget(),

                Padding(padding: EdgeInsets.all(16)),

                RowAndColumnWidget(),

                Divider(),

                RowAndStackWidget(),

                Divider(),

                Text('End of the line')

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RowAndColumnWidget extends StatelessWidget {
  const RowAndColumnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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

          ],
        )
      ],
    );
  }
}

class RowAndStackWidget extends StatelessWidget {
  const RowAndStackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
}

class RowWidget extends StatelessWidget {
  const RowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: Colors.yellow,
          height: 40,
          width: 40,
        ),
      
        Padding(padding: EdgeInsets.all(16)),
      
        Expanded(
          child: Container(
            color: Colors.amber,
            height: 40
          ),
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