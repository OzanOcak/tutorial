import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       title: 'my bs app',
       theme:ThemeData(primarySwatch: Colors.green),
       home:HomeScreen(title: 'home page'),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String title;      //stateless widgets are immutable thus all the data should be final 
  HomeScreen({Key key,this.title}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("my lil app")),
      body:Center(
        child: ListView(
          children: <Widget>[
            Text(
              "Smiley face!",
              textAlign:TextAlign.center,
              style:TextStyle(
                fontWeight:FontWeight.bold,
                color:Colors.black,
                fontSize:28.0
              ),
            ),
            Image.asset("assets/img/smiley.png"),
            Icon(Icons.android)     
          ],
        ),
      ),
    );
  }
}
