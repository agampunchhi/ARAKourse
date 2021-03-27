import 'package:flutter/material.dart';
import 'package:hephaestapp/ui/favourites.dart';
import 'searchPage.dart';

class Home extends StatefulWidget {
 @override
 State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    SearchView(),
    SearchView(),
    Favourites(),

  ];

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: _children[_currentIndex], // new
     bottomNavigationBar: BottomNavigationBar(
       unselectedItemColor: Colors.black,
       backgroundColor: const Color(0xFFBB80FF),
       fixedColor: Colors.yellow,
       onTap: onTabTapped, // new
       currentIndex: _currentIndex, // new
       items: [
         new BottomNavigationBarItem(
           icon: Icon(Icons.home_outlined),
           activeIcon: Icon(Icons.home_rounded),
           title: Text('Home', style: TextStyle(fontSize: 16, fontFamily: 'HelveticaBold'),),
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.category_outlined),
           activeIcon: Icon(Icons.category_rounded),
           title: Text('Category',  style: TextStyle(fontSize: 16, fontFamily: 'HelveticaBold'),),
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.person_outline_rounded),
           activeIcon: Icon(Icons.person),
           title: Text('Profile',  style: TextStyle(fontSize: 16, fontFamily: 'HelveticaBold'),),
         )
       ],
     ),
   );
 }
void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }

}

