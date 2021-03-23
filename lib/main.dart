import 'package:flutter/material.dart';

import './screens/landing_page.dart';
import './screens/home.dart';
import './screens/auth.dart';
import './screens/add_pet.dart';
import './screens/all_pets.dart';
import './screens/bottom_tab_nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => LandingPage(),
        "/auth": (context) => Auth(),
        "/home": (context) => Home(),
        "/bottom_tab": (context) => BottomTabNavigation(),
        "/add_pet": (context) => AddPet(),
        "/all_pet": (context) => AllPets(),
      },
    );
  }
}
