import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orientación App'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(children: [
            OrientationLayoutIconsWidget(),
            Divider(),
            OrientationLayoutWidget(),
            Divider(),
            GridViewWidget(),
            Divider(),
            GridViewWidget2()
          ]),
        ),
      ),
    );
  }
}

class GridViewWidget2 extends StatelessWidget {
  const GridViewWidget2({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation _orientation = MediaQuery.of(context).orientation;

    return GridView.count(
        crossAxisCount: _orientation == Orientation.portrait ? 2 : 4,
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio:  _orientation == Orientation.portrait ? 0.6 : 2.5,
        shrinkWrap: true,
        
        children: List.generate(_orientation == Orientation.portrait ? 2 : 4, (index) {

            return _orientation == Orientation.portrait 

            ? Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              color: Colors.teal[300],
              child: Text('Modo retrato $index \n (GridView) \n (List.generate)', textAlign: TextAlign.center),
            )
            
            : Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              color: Color.fromARGB(255, 77, 247, 128),
              child: Text('Modo paisaje $index \n (GridView) \n (List.generate)', textAlign: TextAlign.center),
            );
          }
        ),
      );
    
}
}

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    Key? key
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    Orientation _orientation = MediaQuery.of(context).orientation;
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: _orientation == Orientation.portrait ? 2 : 4,
      childAspectRatio: 5.0,
      children: List.generate(8, (int index) {
        return Text(
          "Grid $index",
          textAlign: TextAlign.center,
        );
      }),
    );
  }
}

class OrientationLayoutWidget extends StatelessWidget {
  const OrientationLayoutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Orientation _orientation = MediaQuery.of(context).orientation;

    return _orientation == Orientation.portrait
        ? portraitList()
        : landscapeList();
  }

  Container landscapeList() {
    List<Widget> items = [];

    for (var i = 0; i < 4; i++) {
      items.add(
        Container(
          alignment: Alignment.center,
          color: Color.fromARGB(255, 199, 164, 255),
          width: 200,
          height: 100,
          margin: const EdgeInsets.all(10),
          child: Text('Modo paisaje $i \n (Empty list filled with for)', textAlign: TextAlign.center,),
        ),
      );
    }

    return Container(
      child: Row(
        children: items,
      ),
    );
  }

  Row portraitList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          color: Colors.pink[100],
          width: 100,
          height: 200,
          child: Text('Modo retrato \n (Created maunally)', textAlign: TextAlign.center,),
        ),
        Padding(padding: EdgeInsets.all(10)),
        Container(
          alignment: Alignment.center,
          color: Colors.pink[100],
          width: 100,
          height: 200,
          child: Text('Modo retrato \n (Created maunally)', textAlign: TextAlign.center,),
        ),
      ],
    );
  }
}

class OrientationLayoutIconsWidget extends StatelessWidget {
  const OrientationLayoutIconsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation _orientation = MediaQuery.of(context).orientation;

    return _orientation == Orientation.portrait
        ? const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.school,
                size: 48,
              )
            ],
          )
        : const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.school,
                size: 48,
              ),
              Icon(Icons.brush, size: 48)
            ],
          );
  }
}
