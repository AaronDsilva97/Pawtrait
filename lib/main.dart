import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './screens/loading.dart';
import './screens/something_went_wrong.dart';
import './screens/landing_page.dart';
import './screens/home.dart';
import './screens/add_pet.dart';
import './screens/all_pets.dart';
import './screens/bottom_tab_nav.dart';
import './screens/pet_description.dart';
import './screens/add_appointment.dart';

import './provider/pet.dart';
import './provider/foster.dart';
import './provider/auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initilization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initilization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return SomethingWentWrong();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: [
              Provider<AuthProvider>(
                create: (_) => AuthProvider(
                  firebaseAuth: FirebaseAuth.instance,
                ),
              ),
              StreamProvider(
                create: (context) => context.read<AuthProvider>().authState,
                initialData: null,
              ),
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
        return Loading();
      },
    );
  }
}
