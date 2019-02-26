import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ReportState();
  }
}

class _ReportState extends State<ReportPage> {
  Widget firstContent(){
    return new Center(
      child: new Container(

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffb74d),
      appBar: AppBar(
        backgroundColor: const Color(0xFFff9800),
        title: Text('Report'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: new SingleChildScrollView(
        child: new Container(
          child: Column(
              children: [

              ]
          ),
        ),
      ),
    );
  }
}