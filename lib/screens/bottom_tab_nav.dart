import 'package:flutter/material.dart';
import 'home.dart';
import 'all_pets.dart';
// import 'notification.dart';
import 'profile.dart';
import 'animated_cat.dart';

class BottomTabNavigation extends StatefulWidget {
  @override
  _BottomTabNavigationState createState() => _BottomTabNavigationState();
}

class _BottomTabNavigationState extends State<BottomTabNavigation> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    AllPets(),
    // PetNotification(),
    AnimatedCat(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, "/add_pet"),
        tooltip: 'Add Pets',
        child: Icon(
          Icons.add,
        ),
        elevation: 12.0,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: width * 0.14,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.home,
                    size: 36,
                    color: _selectedIndex == 0 ? Colors.blue : Colors.black,
                  ),
                  onPressed: () => _onItemTapped(0),
                ),
                IconButton(
                  icon: Icon(
                    Icons.pets,
                    size: 36,
                    color: _selectedIndex == 1 ? Colors.blue : Colors.black,
                  ),
                  onPressed: () => _onItemTapped(1),
                ),
                SizedBox(
                  width: 36,
                ),
                IconButton(
                  icon: Icon(
                    Icons.notification_important,
                    size: 36,
                    color: _selectedIndex == 2 ? Colors.blue : Colors.black,
                  ),
                  onPressed: () => _onItemTapped(2),
                ),
                IconButton(
                  icon: Icon(
                    Icons.person,
                    size: 36,
                    color: _selectedIndex == 3 ? Colors.blue : Colors.black,
                  ),
                  onPressed: () => _onItemTapped(3),
                ),
              ],
            ),
          ),
        ),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     // BottomNavigationBarItem(
      //     //   icon: Icon(Icons.bar_chart_outlined),
      //     //   label: 'Stats',
      //     // ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.pets),
      //       label: 'All Pets',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.notification_important_outlined),
      //       label: 'Notification',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.verified_user),
      //       label: 'Profile',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.amber[800],
      //   onTap: _onItemTapped,
      // ),
    );
  }
}
