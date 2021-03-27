import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart';
import 'categoryClass.dart';
import 'categoryList.dart';
class Categories6 extends StatefulWidget {
 _Categories6State createState() => _Categories6State();
}

class _Categories6State extends State<Categories6> {
  @override
  Widget build(BuildContext context) {

    List searchResponse = null;
    Map mapResponse = null;
    Response searchCourse;
    String name = 'Office Productivity';
    return GestureDetector(
      onTap: () async{
      var url = Uri.parse('https://www.udemy.com/api-2.0/courses/?category=${name}');
      const String Client_id = '8A5zSXdl0Zqw9msZT8zjIunfJnxm8NMHB8jkxY84';
      const String Client_Secret = 'QjjfkknVPfRBWJnJDMiCwEswkIevljW4JlendE1gv3nJbBjYDsXPV79Prz4dR7B58KYb5rDUicbCksxAP2NSZrpui4qlDyPas1K93R3D5Jfd7OT5B4eml1g8T7O8F3oH';
      String auth = base64.encode(utf8.encode('$Client_id:$Client_Secret'));
      searchCourse = await http.get(url ,headers: {"Authorization": "Basic " + auth});
      if(searchCourse.statusCode==200){
      setState(() {
      mapResponse = json.decode(searchCourse.body);
      searchResponse = mapResponse['results'];
      print(searchResponse);
      Category instance = Category(searchResponse: searchResponse);
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CatList(searchResponse: searchResponse,),
                      ),
                        );
      });
      }
      else 
      {
        print(searchCourse.statusCode);
      }
      },
      child: Card(
          clipBehavior: Clip.antiAlias,
          color:const Color(0xFFBB80FF),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(name,
                  style: TextStyle(fontFamily: 'Helvetica', fontSize: 20), textAlign: TextAlign.center),
            ],
          )),
    );
  }
}