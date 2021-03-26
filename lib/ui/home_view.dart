import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hephaestapp/helper/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:hephaestapp/net/flutterfire.dart';
import 'package:hephaestapp/ui/authentication.dart';


class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  AuthService authMethods = new AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: <Widget>[
          Container (
            height: 60,
            width: MediaQuery.of(context).size.width/2,
            decoration: BoxDecoration(
              color: Colors.green
            ),
            child: Icon(Icons.home),
          ),
           Container (
            height: 60,
            width: MediaQuery.of(context).size.width/2,
            decoration: BoxDecoration(
              color: Colors.blue
            ),
            child: Icon(Icons.home),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder(
          stream: getCurrentUser() ? FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser.uid).collection('Coins').snapshots() : null,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData){
              return Center(
               child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: snapshot.data.docs.map((document){
                return Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    Text('Coin Name: ${document.id}'),
                    Text('Ammount Owned:${document.data()['Amount']}',
                    )
                  ],
                  ) ,
                );
              }).toList(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          authMethods.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => Helper()));
        },
        child: Icon(
          Icons.logout,
          color: Colors.white,
          ),
          backgroundColor: Colors.blue,
      ),
    );
  }
}