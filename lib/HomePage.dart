import 'package:flutter/material.dart';

class HomePage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() 
  {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold
    (
      backgroundColor: const Color(0xfffbf9ff),
      resizeToAvoidBottomInset: false,
      appBar: new AppBar
      (
        title: new Text("Home", style: TextStyle(color: Colors.black ,fontFamily: 'HelveticaBold')),
        backgroundColor: const Color(0xfffbf9ff),
        elevation: 0,
      ),
      body: new Container
      (

      ),
    bottomNavigationBar: new BottomAppBar
    (
      color: const Color(0xfff7f0ff),

      child: new Container
      (
        margin: const EdgeInsets.only(left: 50, right: 50),
        child: new Row
        (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>
          [
            new IconButton
            (
            icon: Icon(Icons.home_rounded),
            color: Colors.deepPurple,
            iconSize: 30,
            ),
            new IconButton
            (
            icon: Icon(Icons.home_rounded),
            color: Colors.deepPurple,
            iconSize: 30,
            ),
            new IconButton
            (
            icon: Icon(Icons.home_rounded),
            color: Colors.deepPurple,
            iconSize: 30,
            ),
          ],
        ),
      ),
    ),
    );
  }
}