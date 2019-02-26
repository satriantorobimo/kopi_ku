import 'package:flutter/material.dart';
import 'package:kopi_ku/pages/home-2.dart';
import 'package:kopi_ku/pages/report.dart';
import 'package:kopi_ku/pages/transaction.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomePage>  with SingleTickerProviderStateMixin{
  TabController controller;
  int _key = 0;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = new TabController(length: 3, vsync: this);
    controller.addListener(() {
      setState(() {
        print("Tes");
        _key = controller.index;
      });
    });
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new TabBarView(
        // Add tabs as widgets
        children: <Widget>[new Home2Page(), new TransactionPage(), new ReportPage()],
        // set the controller
        controller: controller,
      ),
      bottomNavigationBar: new Material(
        // set the tab bar as the child of bottom navigation bar
        color: _key == 0 ? const Color(0xFF66bb6a) : _key == 1 ? const Color(0xFFd32f2f) :  const Color(0xFFff9800),
        child: new TabBar(
          indicatorColor: const Color(0xFF66bb6a),
          tabs: <Tab>[
            new Tab(
              icon: new Icon(Icons.home,color: Colors.white)
            ),
            new Tab(
              icon: new Icon(Icons.attach_money,color: Colors.white)
            ),
            new Tab(
              icon: new Icon(Icons.content_paste,color: Colors.white)
            ),
          ],
          // setup the controller
          controller: controller,
        ),
      ),
    );
  }
}