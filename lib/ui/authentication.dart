import 'package:crypto_wallet/net/flutterfire.dart';
import 'package:crypto_wallet/ui/home_view.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
TextEditingController _emailfield = TextEditingController();
TextEditingController _passwordfield = TextEditingController();

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
        child: Column(
          
          children: [
            SizedBox(height:10),
            logo(),
            SizedBox(height:30),
            TextFormField(
              controller: _emailfield,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Email",
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
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _passwordfield,
              obscureText: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Password",
                suffixIcon: Icon(Icons.vpn_key, color: Colors.deepPurple),
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
            ),
            SizedBox(height: 15),
            new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
            Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: 45.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: const Color(0xfff7f0ff),

              ),
              child: MaterialButton(
              textColor: Colors.black,
              onPressed: () async {
                 bool shouldNavigate = await signIn(_emailfield.text,_passwordfield.text);
                if(shouldNavigate){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => HomeView(),
                  )
                  );
                }
              },
              child: Text('Login', style: new TextStyle(fontSize: 24.0,),),
            ),
            ),
            SizedBox(width:10),
            Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: 45.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: const Color(0xfff7f0ff),

              ),
              child: MaterialButton(
              
              onPressed: () async {
                bool shouldNavigate = await register(_emailfield.text,_passwordfield.text);
                if(shouldNavigate){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => HomeView(),
                  )
                  );
                }
              },
              child: Text('Register', style: new TextStyle(fontSize: 24.0)),
            )
            ),
            ])
          ],
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