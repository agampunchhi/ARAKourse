import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hephaestapp/net/flutterfire.dart';

class Favourites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFBB80FF),
        title: Text('Favourites', style: TextStyle(color: Colors.yellow, fontFamily: 'HelveticaBold', fontSize: 24),),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFE6D0FF),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser.uid).collection('Courses').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData){
              return Center(
               child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: snapshot.data.docs.map((document){
                return Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: const Color(0xFFBB80FF),),
                  margin: EdgeInsets.only(top: 7, bottom: 7, left: 10, right: 10),
                  child: Column(
                    children:
                    [
                    SizedBox(height: 5),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    SizedBox(width: 5),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: Text('${document.id}', style: TextStyle(fontSize: 20,), textAlign: TextAlign.center,),
                      ),
                    SizedBox(width: 5),
                    SizedBox(child:
                      IconButton(
                      iconSize: 20,
                      icon:Icon(
                      Icons.highlight_remove_rounded,
                      ),
                      onPressed: () async{
                        await removeCourse(document.id);
                      },
                    ),
                    ),
                    SizedBox(width: 5),
                  ],
                  ),
                    SizedBox(height: 5),
                    ],
                    ),
                  );
              }
              ).toList(),
            );
          },
        ),
      ),
    );
  }
}