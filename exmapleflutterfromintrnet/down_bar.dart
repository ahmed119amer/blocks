import 'package:flutter/material.dart';

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyNavigationBar(),
    );
  }
}

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar({Key? key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;




  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Flutter BottomNavigationBar Example'),
          backgroundColor: Colors.green),
      body: Center(
        child: e.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.transparent,
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 35,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
    List e = [
      textstring('ahmed'),
    TextVoid('ahmed'),
    Column(
      children: const [Text('ahmed'), Text('sajad')],
    ),
    Container(
      height: 100,
      width: 100,
      color: Colors.blue,
    ),

    const Text(
      'ahmed',
      style: TextStyle(fontSize: 25),
    )
  ];
}
  Widget TextVoid(String name){
    return Text(name);
  }
class textstring extends StatelessWidget {
  String name;

   textstring(this.name,{ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(name
      
    );
  }
}