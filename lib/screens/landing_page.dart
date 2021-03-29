import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';
import 'bottom_tab_nav.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      return BottomTabNavigation();
    } else {
      return Auth();
    }
  }
}
