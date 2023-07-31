import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Layouts Home',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.cloud_queue))],
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildJournalHeaderImage(),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildJournalEntry(),
                  SizedBox(height: 20),
                  _buildJournalWeather(),
                  SizedBox(height: 20),
                  _buildJournalTags(),
                  SizedBox(height: 20),
                  _buildJournalFooterImages(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildJournalHeaderImage() {
    return Image(
      image: AssetImage('assets/images/wallpaper.jpg'),
      fit: BoxFit.cover,
    );
  }

  _buildJournalEntry() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Cumpleaños',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
        SizedBox(height: 15),
        Text(
          'It’s going to be a great birthday. We are going out for dinner at my favorite place, then watch a movie after we go to the gelateria for ice cream and espresso',
          style: TextStyle(color: Colors.black54),
        ),
      ],
    );
  }

  _buildJournalWeather() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.wb_sunny,
          color: Color.fromARGB(255, 255, 209, 59),
          size: 40,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '81° Clear',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 196, 0),
              ),
            ),
            SizedBox(height: 5),
            Text(
              '4500 San Alpho Drive, Dallas, TX United States',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        )
      ],
    );
  }

  _buildJournalTags() {
    return Wrap(
      spacing: 8,
      children: List.generate(7, (index) {
        return Chip(
          label: Text(
            'Gift ${index + 1}',
            style: TextStyle(
                fontSize: 15, color: Color.fromARGB(255, 0, 138, 126)),
          ),
          avatar: Icon(
            Icons.card_giftcard,
            color: Color.fromARGB(255, 43, 191, 211),
            size: 20,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(color: Color.fromARGB(255, 152, 218, 230))),
          backgroundColor: Color.fromARGB(255, 235, 252, 255),
        );
      }),
    );
  }

  Row _buildJournalFooterImages() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/salmon.jpg'),
          radius: 40.0,
        ),
        SizedBox(width: 20),
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/esparragos.jpg'),
          radius: 40.0,
        ),
        SizedBox(width: 20),
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/fresas.jpg'),
          radius: 40.0,
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Icon(Icons.cake),
            Icon(Icons.star_border),
            Icon(Icons.music_note),
//Icon(Icons.movie),
          ],
        ),
      ],
    );
  }
}
