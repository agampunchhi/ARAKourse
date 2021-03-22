import 'package:flutter/material.dart';

class AddView extends StatefulWidget {
  @override
  _AddViewState createState() => _AddViewState();
}


class _AddViewState extends State<AddView> {
List<String> coins = [
'bitcoin',
'tether',
'ether',
];

String dropdownvalue = 'bitcoin';
TextEditingController _ammountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          DropdownButton(
            value: dropdownvalue,
            onChanged: (String value) {
              setState(() {
                dropdownvalue = value;
              });
            },
            items: coins.map<DropdownMenuItem<String>>((String value){
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            child: TextFormField(
              controller: _ammountController,
              decoration: InputDecoration(
                labelText: 'Coin Amount',
                ),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,

              ),
              child: MaterialButton(
              onPressed: () async {
                
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            )
            ),
        ],
      ),
    );
  }
}