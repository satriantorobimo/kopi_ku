import 'package:flutter/material.dart';

class Home2Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home2State();
  }
}

class _Home2State extends State<Home2Page> {

  Widget firstContent(){
    return new Center(
      child: new Container(
        child: Text("Welcome to My Coffee!",style: TextStyle(fontSize: 22,color: Colors.white)),
      ),
    );
  }

  Widget secondContent(){
    return new Center(
      child: new Container(
        child: Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: const Color(0xFFd32f2f)),
            child: makeListTile,
          ),
        ),
      ),
    );
  }

  final makeListTile = ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      title: Text(
        "Kopi Gayo Arabica",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
          Text(" Out of stock", style: TextStyle(color: Colors.white))
        ],
      ),
      trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0)
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF81c784),
      appBar: AppBar(
        backgroundColor: const Color(0xFF66bb6a),
        title: Text('Home'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app,color: Colors.white,),
            onPressed: () {},
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: new SingleChildScrollView(
        child: new Container(
          child: Column(
              children: [
                SizedBox(height: 15.0),
                firstContent(),
                SizedBox(height: 15.0),
                secondContent(),
                secondContent(),
                secondContent(),
                secondContent(),
              ]
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        heroTag: "AddData",
        backgroundColor: const Color(0xFFff9800),
        mini: true,
        elevation: 10.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
  }
}