import 'package:flutter/material.dart';

class LoginSignUpPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _LoginSignUpPageState();

}

class _LoginSignUpPageState extends State<LoginSignUpPage>{
  bool _isLoading = false;
  final myControllerUserame = TextEditingController();
  final myControllerPassword = TextEditingController();

  _gotoLogin() async{
    setState(() {
      _isLoading = true;
    });
    _isLoading = false;
  }

  Widget login(){
    return new Center(
      child: new Container(
          padding: EdgeInsets.all(20.0),
          child: new Column(
            children: <Widget>[
              SizedBox(height: 85.0),
              new Container(
                  width: 190.0,
                  height: 190.0,
                  decoration: new BoxDecoration(
                      border: new Border.all(
                          width: 5,
                          color: const Color(0xFF69f0ae)
                      ),
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/imgs/logo.jpg')
                      )
                  )),
              SizedBox(height: 45.0),
              // [Name]
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'User Id',
                ),
                controller: myControllerUserame,
              ),
              // spacer
              SizedBox(height: 15.0),
              // [Password]
              TextField(
                controller: myControllerPassword,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              //spacer
              SizedBox(height: 35.0),
              //button login
              _isLoading == true ? const LinearProgressIndicator(backgroundColor: Color(0xFFFE3562)) : new ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity,minHeight: 55.0),
                child: new RaisedButton(
                  onPressed: _gotoLogin,
                  color: const Color(0xFFff9800),
                  textColor: Colors.white,
                  child: Text("Login"),
                ),
              ),
              //spacer
              SizedBox(height: 15.0),
              Container(
                child: Text("Forgot your password? Go here!",style: TextStyle(color: Colors.white),),
              )
            ],
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFF66bb6a),
      body: new SingleChildScrollView(
        child: new Container(
          child: Column(
              children: [
                login(),
              ]
          ),
        ),
      ),
    );
  }
}