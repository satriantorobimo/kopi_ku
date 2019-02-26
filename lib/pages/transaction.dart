import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class TransactionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TransactionState();
  }
}

class _TransactionState extends State<TransactionPage> {
  var items = List<String>();
  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  TextEditingController editingController = TextEditingController();
  bool _isSearching = false;
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  List<String> added = [];
  String currentText = "";

  List<String> suggestions = [
    "Apple",
    "Armidillo",
    "Actual",
    "Actuary",
    "America",
    "Argentina",
    "Australia",
    "Antarctica",
    "Blueberry",
    "Cheese",
    "Danish",
    "Eclair",
    "Fudge",
    "Granola",
    "Hazelnut",
    "Ice Cream",
    "Jely",
    "Kiwi Fruit",
    "Lamb",
    "Macadamia",
    "Nachos",
    "Oatmeal",
    "Palm Oil",
    "Quail",
    "Rabbit",
    "Salad",
    "T-Bone Steak",
    "Urid Dal",
    "Vanilla",
    "Waffles",
    "Yam",
    "Zest"
  ];

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        new IconButton(
          icon: const Icon(Icons.clear,color: Colors.white,),
          onPressed: () {
            if (editingController == null || editingController.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }
    return <Widget>[
      new IconButton(
        icon: const Icon(Icons.search,color: Colors.white,),
        onPressed: _startSearch,
      ),
    ];
  }

  void _startSearch() {
    ModalRoute
        .of(context)
        .addLocalHistoryEntry(new LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    print("close search box");
    setState(() {
      editingController.clear();
      // updateSearchQuery("Search query");
    });
  }

  Widget _buildTitle(){
    return new Text(
        'Transaction'
    );
  }

  Future <Null> _searchData() async{

  }


  Widget firstContent(){
    return new Center(
      child: new Container(

      ),
    );
  }

  Widget _buildSearchField(){
    return new SimpleAutoCompleteTextField(
      key: key,
      suggestions: suggestions,
      textChanged: (text) => currentText = text,
      textSubmitted: (text) => setState(() {
        added.add(text);
        currentText = text;
      }),
      decoration: const InputDecoration(
        hintText: 'Search Product Name',
        border: InputBorder.none,
        hintStyle: const TextStyle(color: Colors.white30),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 13.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: const Color(0xFFef5350),
      appBar: AppBar(
        backgroundColor: const Color(0xFFd32f2f),
        title: _isSearching ? _buildSearchField() : _buildTitle(),
        actions: _buildActions(),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: new SingleChildScrollView(
        child: new Container(
          child: Column(
              children: [
                SizedBox(height: 15.0),
                new Text(currentText)
              ]
          ),
        ),
      ),
    );
  }
}