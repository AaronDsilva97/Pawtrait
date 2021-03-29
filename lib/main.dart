import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/landing_page.dart';
import './screens/home.dart';
import './screens/auth.dart';
import './screens/add_pet.dart';
import './screens/all_pets.dart';
import './screens/bottom_tab_nav.dart';
import './screens/pet_description.dart';
import './screens/add_appointment.dart';

import './provider/pet.dart';
import './provider/foster.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PetProvider>(
          create: (_) => PetProvider(),
        ),
        ChangeNotifierProvider<FosterProvider>(
          create: (_) => FosterProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Pawtrait',
        debugShowCheckedModeBanner: false,
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
          "/pet_description": (context) => PetDescription(),
          AddAppointment.routeName: (context) => AddAppointment(),
        },
      ),
    );
  }
}
