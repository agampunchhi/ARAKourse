import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart';

class SearchView extends StatefulWidget {
  SearchView({Key key}) : super(key: key);
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final formKey = GlobalKey<FormState>();
  String searchTerm;
  Map mapResponse = null;
  List searchResponse = null;
  Map mapResponse1 = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f0ff),
      body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: 
        [
          SizedBox(height: MediaQuery.of(context).size.height / 12),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.1,
          child: Form(
            key: formKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:
            [
              SizedBox(
              width: 250,
              child: TextFormField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Search Courses",
                prefixIcon: Icon(Icons.search_sharp, color: Colors.deepPurple),
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
                  return value.isEmpty ? 'No search term provided!' : null;
                },
                onSaved: (value)
                {
                  return searchTerm = value;
                } ,
              
            ),
              ),
              SizedBox(width: 8),
              Container(
              width: MediaQuery.of(context).size.width / 4.5,
              height: MediaQuery.of(context).size.height / 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color(0xFFBB80FF),

              ),
              child: MaterialButton(
              textColor: Colors.purple,
              onPressed: () async {
                final form = formKey.currentState;
                if(form.validate())
                {
                form.save();
                Response searchCourse;
                var url = Uri.parse('https://www.udemy.com/api-2.0/courses/?search=${searchTerm}');
                const String Client_id = '8A5zSXdl0Zqw9msZT8zjIunfJnxm8NMHB8jkxY84';
                const String Client_Secret = 'QjjfkknVPfRBWJnJDMiCwEswkIevljW4JlendE1gv3nJbBjYDsXPV79Prz4dR7B58KYb5rDUicbCksxAP2NSZrpui4qlDyPas1K93R3D5Jfd7OT5B4eml1g8T7O8F3oH';
                String auth = base64.encode(utf8.encode('$Client_id:$Client_Secret'));
                searchCourse = await http.get(url ,headers: {"Authorization": "Basic " + auth});
                if(searchCourse.statusCode==200){
                    setState(() {
                mapResponse = json.decode(searchCourse.body);
                searchResponse = mapResponse['results'];
                print(searchResponse);
                });
                }
                }
                },
              child: Text('Search', style: new TextStyle(fontSize: 16.0, color: Colors.black),)
            ),
            ),
            ]
            ),
            ),
          ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context,index) {
                return Container(
                  decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.purple[100],
                      ),
                  
                  margin: EdgeInsets.only(top: 7, bottom: 7, left: 10, right: 10),
                  child: Column(
                    children: [
                    SizedBox(height: 10),
                    SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: Text(searchResponse[index]['title'], textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:
                      [
                        GestureDetector(
                        onTap: () async{
                        Response searchCourse1;
                        var url = Uri.parse('https://www.udemy.com/api-2.0/courses/${searchResponse[index]['id']}');
                        const String Client_id = '8A5zSXdl0Zqw9msZT8zjIunfJnxm8NMHB8jkxY84';
                        const String Client_Secret = 'QjjfkknVPfRBWJnJDMiCwEswkIevljW4JlendE1gv3nJbBjYDsXPV79Prz4dR7B58KYb5rDUicbCksxAP2NSZrpui4qlDyPas1K93R3D5Jfd7OT5B4eml1g8T7O8F3oH';
                        String auth = base64.encode(utf8.encode('$Client_id:$Client_Secret'));
                        searchCourse1 = await http.get(url ,headers: {"Authorization": "Basic " + auth});
                        if(searchCourse1.statusCode==200){
                            setState(() {
                              mapResponse1 = json.decode(searchCourse1.body);
                              print(mapResponse1);
                        });
                        }
                        else 
                        {
                          print(searchCourse1.statusCode);
                        }

                       },
                    child:Text('Price: ₹'+'${searchResponse[index]['price_detail']['amount']}', textAlign: TextAlign.left, style: TextStyle(fontSize: 16)),
                        ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: 30.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: Color(0xFFD4AFFF),

                      ),
                    ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                  ),
                );
              },
              itemCount: searchResponse==null ? 0 : searchResponse.length
              )
        ],

      ),
      )
    );
  }
}