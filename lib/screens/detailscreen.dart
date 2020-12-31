import 'package:flutter/material.dart';
import 'package:streaming_anime/style/style.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("One Piece"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Stack(
                  overflow: Overflow.visible,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 4,
                      child: Image.network(
                        "",
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: MediaQuery.of(context).size.height / 4.6,
                      child: RaisedButton(
                        elevation: 5,
                        color: buttonColor,
                        onPressed: () {},
                        shape: CircleBorder(),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 30,
                            )),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Text('Rilis : 1 januari 2021',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.normal)),
                SizedBox(height: 20),
                Text('Durasi : 1 jam',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.normal)),
                SizedBox(height: 40),
                Text("Sinopsis",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Text("Anime ini berceritakan one piece",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.normal)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
