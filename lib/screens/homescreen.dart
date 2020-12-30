import 'package:flutter/material.dart';
import 'package:streaming_anime/style/style.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: backgroundColor,
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: buttonColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.white),
                label: "Home",
                backgroundColor: buttonColor),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.white),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border, color: Colors.white),
              label: "Bookmark",
            ),
          ]),
      body: ListTile(
        tileColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        leading: Container(
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.network(
                "",
                height: 90.0,
                width: 100.0,
                fit: BoxFit.cover,
              ),
            )),
        title: Text(
          'Anime One Piece',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}
