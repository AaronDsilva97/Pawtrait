import 'package:flutter/material.dart';

Future<bool> checkIfAUthenticated() async {
  await Future.delayed(
    Duration(seconds: 1),
  );
  return true;
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    checkIfAUthenticated().then((success) => {
          if (success)
            {
              Navigator.pushReplacementNamed(context, "/bottom_tab"),
            }
          else
            {
              Navigator.pushReplacementNamed(context, "/auth"),
            }
        });
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
