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

  void _talkAndroid(BuildContext context){
    showDialog(context: context,builder: (BuildContext context) {
      return AlertDialog(
         title:  Text("Message"), 
         content:  Text("Hello this is Mr. Android"), 
         actions: <Widget>[
                   FlatButton(
                     child:  Text("Close"), 
                     onPressed: () {   
                        Navigator.of(context).pop();  
                     }, 
                   ), 
         ],
      );
    }); 
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("my lil app")),
      body:Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            MyTitle(),
            Image.asset("assets/img/smiley.png"),
            GestureDetector(
              onTap: (){_talkAndroid(context);},
              child: Icon(Icons.android,color:Colors.green)),
            MyContainers()   
          ],
        ),
      ),
    );
  }
}

class MyTitle extends StatelessWidget {
  //MyTitle({Key key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border:Border(
               top: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
               left: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
               right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
               bottom: BorderSide(width: 1.0, color: Color(0xFFFF000000))
        ),
        color:Colors.yellow,
      ),
      child:Text(
              "Smiley face!",
              textAlign:TextAlign.center,
              style:TextStyle(
                fontWeight:FontWeight.bold,
                color:Colors.black,
                fontSize:28.0
              ),
      ),
    );
  }
}


class MyContainers extends StatelessWidget {
  //MyTitle({Key key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true, 
      padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
      children: <Widget>[
          ColorBox(
                  name: "Red", 
                  facts: "heat, activity, passion, sexuality, anger, love and joy.", 
                  frequencyBottom: 620,
                  frequencyUp: 720,
                  image: "red.png"
          ),
          ColorBox(
                  name: "Orange", 
                  facts: "amusement, extroverts, warmth, fire, energy, activity, danger, taste and aroma, the autumn.", 
                  frequencyBottom: 585,
                  frequencyUp: 620,
                  image: "orange.png"
          ), 
          ColorBox(
                  name: "Yellow", 
                  facts: "gentleness, humor, and spontaneity, happiness, glory, harmony and wisdom.", 
                  frequencyBottom: 570,
                  frequencyUp: 590,
                  image: "yellow.png"
          ), 
          ColorBox(
                  name: "Green", 
                  facts: " nature, life, health, youth, spring, hope, fertility, hapiness.", 
                  frequencyBottom: 495,
                  frequencyUp: 570,
                  image: "green.png"
          ), 
          ColorBox(
                  name: "Blue", 
                  facts: "intelligence, knowledge, calm and concentration.", 
                  frequencyBottom: 450,
                  frequencyUp: 495,
                  image: "red.png"
          ), 
          ColorBox(
                  name: "Violet", 
                  facts: "extravagance, individualism, unconventional, artificial and ambiguity.", 
                  frequencyBottom: 380,
                  frequencyUp: 450,
                  image: "violet.png"
          ), 
      ],
      
    );
  }
}

class ColorBox extends StatelessWidget {
  final String name;
  final String facts;
  final String image;
  final int frequencyUp;
  final int frequencyBottom;

  ColorBox({this.name,this.facts,this.image,this.frequencyUp,this.frequencyBottom});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.0),
      height:120,
      child:Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset("assets/img/"+image),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5), 
                child: Column(
                  children: <Widget>[
                    Text("${this.name} is associated with ${this.facts}"),
                    Text("wavelength of ${this.name} is between ${this.frequencyBottom.toString()} and ${this.frequencyUp.toString()}")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
