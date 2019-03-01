import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ReportPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ReportState();
  }
}

class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = new charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha);
}


class _ReportState extends State<ReportPage> {
  int _counter = 35;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget firstContent(){
    return new Center(
      child: new Container(
        child: Text("Weekly",style: TextStyle(fontSize: 20,color: Colors.white)),
      ),
    );
  }

  Widget secondContent(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          child: new RaisedButton(
            child: const Text('Daily',style: TextStyle(color: Colors.white)),
            color: const Color(0xFF66bb6a),
            elevation: 4.0,
            splashColor: Colors.blueGrey,
            onPressed: () {
              // Perform some action
            },
          ),
        ),
        Container(
          child: new RaisedButton(
            child: const Text('Weekly',style: TextStyle(color: Colors.white)),
            color: const Color(0xFFd32f2f),
            elevation: 4.0,
            splashColor: Colors.blueGrey,
            onPressed: () {
              // Perform some action
            },
          ),
        ),
        Container(
          child: new RaisedButton(
            child: const Text('Monthly',style: TextStyle(color: Colors.white)),
            color: const Color(0xFF66bb6a),
            elevation: 4.0,
            splashColor: Colors.blueGrey,
            onPressed: () {
              // Perform some action
            },
          ),
        )
      ],
    );
  }

  Widget thirdContent(){
    return new Center(
      child: new Container(
        child: Text("Best Seller Item",style: TextStyle(fontSize: 16,color: Colors.white)),
      ),
    );
  }

  Widget fourthContent(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 65.0,
          width: 115.0,
          decoration: BoxDecoration(
              color: const Color(0xFF66bb6a),
          ),
          child: ListTile(
            title: Text('125',style: TextStyle(fontSize: 22.0,color: Colors.white)),
            subtitle: Text('Avocado Coffee', style: TextStyle(fontSize: 12.0,color: Colors.white)),
          ),
        ),
        Container(
          height: 65.0,
          width: 115.0,
          decoration: BoxDecoration(color: const Color(0xFF66bb6a)),
          child: ListTile(
            title: Text('125',style: TextStyle(fontSize: 22.0,color: Colors.white)),
            subtitle: Text('Avocado Coffee', style: TextStyle(fontSize: 12.0,color: Colors.white)),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var data = [
      new ClicksPerYear('Monday', 12, Colors.red),
      new ClicksPerYear('Tuesday', 42, Colors.yellow),
      new ClicksPerYear('Wednesday', _counter, Colors.green),
    ];

    var series = [
      new charts.Series(
        domainFn: (ClicksPerYear clickData, _) => clickData.year,
        measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
        colorFn: (ClicksPerYear clickData, _) => clickData.color,
        id: 'Clicks',
        data: data,
      ),
    ];

    var chart = new charts.BarChart(
      series,
      animate: true,
    );

    var chartWidget = new Padding(
      padding: new EdgeInsets.all(20.0),
      child: new SizedBox(
        height: 200.0,
        child: chart,
      ),
    );

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
                SizedBox(height: 10.0),
                firstContent(),
                chartWidget,
                secondContent(),
                SizedBox(height: 12.0),
                thirdContent(),
                SizedBox(height: 15.0),
                fourthContent()
              ]
          ),
        ),
      ),
    );
  }
}