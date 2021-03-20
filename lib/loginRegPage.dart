
import 'package:flutter/material.dart';

class LoginRegPage extends StatefulWidget
{
  State<StatefulWidget> createState()
  {
    return _LoginRegState();
  }
}

class _LoginRegState extends State<LoginRegPage>
{
  //METHODS
  void validateAndSave()
  {

  }

  void moveToReg()
  {

  }

  //DESIGN for UI
  @override
    Widget build(BuildContext context)
    {
      return new Scaffold
      (
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xfffbf9ff),
        appBar: new AppBar
        (
          title: new Text("Hephaestapp", style: TextStyle(color: Colors.black ,fontFamily: 'HelveticaBold')),
          backgroundColor: const Color(0xfffbf9ff),
          elevation: 0,
        ),

        body: new Container
        (
          margin: EdgeInsets.all(15.0),
          child: SingleChildScrollView
          (
          child: new Form
          (
            child: new Column
            (
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: createInputs() + createButtons(),
            ),
          ),
          )
        ),
      );
    }

  List<Widget> createInputs()
  {
    return 
    [
      SizedBox(
        height:10.0),
      logo(),
      SizedBox(height:20.0),
      new TextFormField
      (
        decoration: new InputDecoration
        (
        hintText: 'Email',
        suffixIcon: Icon(Icons.email_rounded, color: Colors.deepPurple),
        border: OutlineInputBorder
            (
            borderSide: BorderSide(width: 2.0),
            borderRadius: BorderRadius.circular(20),
            ),
        focusedBorder: OutlineInputBorder
            (
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(width: 2.0, color: Colors.deepPurple),
            ),
        ),
        textAlign: TextAlign.center,
      ),
      SizedBox(height:10.0),
      new TextFormField
      (
        decoration: new InputDecoration
          (
          hintText: 'Password',
          suffixIcon: Icon(Icons.vpn_key_rounded, color: Colors.deepPurple,),
          border: OutlineInputBorder
            (
            borderSide: BorderSide(width: 2.0),
            borderRadius: BorderRadius.circular(20),
            ),
          focusedBorder: OutlineInputBorder
            (
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(width: 2.0, color: Colors.deepPurple),
            ),
          ),
        textAlign: TextAlign.center,
      ),
      SizedBox(height:20.0),
    ];
  }
  Widget logo()
  {
    // ignore: missing_required_param
    return new Hero
    (
      tag: 'hero',

      child: new CircleAvatar
      (
        backgroundColor: Colors.transparent,
        child: Image.asset('images/Logo.png'), //ADD APP LOGO HERE *****
        radius: 80.0,
      ),
    );
  }


  List<Widget> createButtons()
  {
    return 
    [
      new RaisedButton
      (
        child: new Text("Login", style: new TextStyle(fontSize: 24.0),),
        textColor: Colors.black,
        color: const Color(0xfff7f0ff),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),

        onPressed: validateAndSave,
      ),
      new FlatButton
      (
        padding: EdgeInsets.all(20.0),
        child: new Text("Don't have an account, no problem! Create one now?", style: new TextStyle(fontSize: 18.0)),
        textColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),

        onPressed: moveToReg,
      )
    ];
  }

}