import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/auth_form_field.dart';
import '../provider/auth.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final _formKey = GlobalKey<FormState>();

  bool _auth = true;

  String _email = "";
  String _password = "";

  final _emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  _onSubmit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (_auth) {
        Provider.of<AuthProvider>(context, listen: false)
            .signUp(email: _email, password: _password);
      } else {
        Provider.of<AuthProvider>(context, listen: false)
            .signIn(email: _email, password: _password);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
              ),
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    _auth ? "Register" : "Sign In",
                    style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  AuthFormField(
                    hintText: "user@gmail.com",
                    labelText: "Email",
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Email cannot be empty";
                      } else if (!_emailValid.hasMatch(value)) {
                        return "Invalid Email Address";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        _email = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  AuthFormField(
                    hintText: "Password",
                    labelText: "Password",
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Password cannot be empty";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value;
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: _onSubmit,
                    child: Text(
                      _auth ? "Register" : "Sign in",
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _auth = !_auth;
                      });
                    },
                    child: Text(
                      _auth
                          ? "Already a user, Sign in"
                          : "Do not have an account? Register ",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
