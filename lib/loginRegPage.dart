
import 'package:flutter/material.dart';

class LoginRegPage extends StatefulWidget
{

  State<StatefulWidget> createState()
  {
    return _LoginRegState();
  }
}

enum FormType
{
  login,
  register
}

class _LoginRegState extends State<LoginRegPage>
{

  final formKey = new GlobalKey<FormState>();
  FormType _formType = FormType.login;
  String _email = "";
  String _password = "";
  //METHODS
  bool validateAndSave()
  {
    final form = formKey.currentState;
    if(form.validate())
    {
      form.save();
      return true;
    }
    else
    {
      return false;
    }
  }
  
  void moveToReg()
  {
    formKey.currentState.reset();
    setState(() 
    {
      _formType = FormType.register;
    });
  }
   void moveToLogin()
  {
    formKey.currentState.reset();
    setState(() 
    {
      _formType = FormType.login;
    });
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

          key: formKey,
            child: new Column
            (
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
        validator: (value)
        {
            return value.isEmpty ? 'Email is Required.' : null;
        },
        onSaved: (value)
        {
          return _email = value;
        }
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
        obscureText: true,
        validator: (value)
        {
            return value.isEmpty ? 'Password is Required.' : null;
        },
        onSaved: (value)
        {
          return _password = value;
        }
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
        radius: 100.0,
      ),
    );
  }


  List<Widget> createButtons()
  {
    if(_formType == FormType.login)
    {
    return 
    [
      ButtonTheme
      (
        height: 40,
        minWidth: 60,
        padding: EdgeInsets.symmetric
        (
            vertical: 10,
            horizontal: MediaQuery.of(context).size.width / 6,
        ),
      child: new RaisedButton
      (
        child: new Text("Login", style: new TextStyle(fontSize: 24.0,),),
        textColor: Colors.black,
        color: const Color(0xfff7f0ff),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 0,
        onPressed: validateAndSave,
      ),
      ),
      new FlatButton
      (
        padding: EdgeInsets.all(20.0),
        child: new Text("Don't have an account? Create one now.", style: new TextStyle(fontSize: 16.0)),
        textColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),

        onPressed: moveToReg,
      ),
    ];
    }
    else
    {
      return 
    [
      ButtonTheme
      (
        height: 40,
        minWidth: 60,
        padding: EdgeInsets.symmetric
        (
            vertical: 10,
            horizontal: MediaQuery.of(context).size.width / 6,
        ),
      child: new RaisedButton
      (
        child: new Text("Create Account", style: new TextStyle(fontSize: 24.0,),),
        textColor: Colors.black,
        color: const Color(0xfff7f0ff),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 0,
        onPressed: validateAndSave,
      ),
      ),
      new FlatButton
      (
        padding: EdgeInsets.all(20.0),
        child: new Text("Already have an account? Login now.", style: new TextStyle(fontSize: 16.0)),
        textColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),

        onPressed: moveToLogin,
      ),
    ];
    }
  }

}