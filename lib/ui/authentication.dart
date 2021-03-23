import 'package:hephaestapp/net/flutterfire.dart';
import 'package:hephaestapp/ui/home_view.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final formKey = new GlobalKey<FormState>();
String _emailfield = "";
String _passwordfield = "";

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffbf9ff),
      resizeToAvoidBottomInset: false,
      appBar: new AppBar
        (
          title: new Text("Hephaestapp", style: TextStyle(color: Colors.black ,fontFamily: 'HelveticaBold')),
          backgroundColor: const Color(0xfffbf9ff),
          elevation: 0,
        ),
      body: Container(
        margin: EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: const Color(0xfffbf9ff),
        ),
        child: Form(
          key: formKey,
        child: Column(
          
          children: [
            SizedBox(height:10),
            logo(),
            SizedBox(height:30),
            TextFormField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(Icons.email_rounded, color: Colors.deepPurple),
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
              validator: (value)
        {
            return value.isEmpty ? 'Email is Required.' : null;
        },
        onSaved: (value)
        {
          return _emailfield = value;
        }
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(Icons.vpn_key, color: Colors.deepPurple),
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
              validator: (value)
        {
            return value.isEmpty ? 'Password is Required.' : null;
        },
        onSaved: (value)
        {
          return _passwordfield = value;
        }
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: 45.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: const Color(0xfff7f0ff),

              ),
              child: MaterialButton(
              textColor: Colors.black,
              onPressed: () {
                final form = formKey.currentState;
                 if(form.validate())
                  {
                  form.save();
                  signIn(_emailfield,_passwordfield);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => HomeView(),
                  ));
                  }
                },

              child: Text('Login', style: new TextStyle(fontSize: 24.0,),),
            ),
            ),
            SizedBox(height:10),
            Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: 45.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: const Color(0xfff7f0ff),

              ),
              child: MaterialButton(
              
              onPressed: () {
                final form = formKey.currentState;
                 if(form.validate())
                  {
                  form.save();
                  register(_emailfield,_passwordfield);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => HomeView(),
                  ));
                  }
                },
              child: Text('Register', style: new TextStyle(fontSize: 24.0)),
            )
            ),
            ]),
        ),
        ),
      );
  }
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
        radius: 110.0,
      ),
    );
  }
