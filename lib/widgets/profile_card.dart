import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:pawtrait/widgets/text_field_profile.dart';
import 'icon_tag.dart';
import '../provider/auth.dart';

class ProfileCard extends StatefulWidget {
  final double width;
  ProfileCard({
    @required this.width,
  });

  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _email = "";
  String _phoneNumber = "";
  bool editMode = false;
  DateTime birthDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: birthDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        birthDate = picked;
      });
    }
  }

  onSaved() {}

  @override
  Widget build(BuildContext context) {
    _name = Provider.of<AuthProvider>(context, listen: false)
            .firebaseAuth
            .currentUser
            .displayName ??
        "";
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: widget.width * 0.05),
        child: Container(
          width: widget.width * 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Profile",
                      style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      icon: editMode ? Icon(Icons.edit) : Icon(Icons.save),
                      onPressed: () {
                        setState(() {
                          editMode = !editMode;
                          if (editMode) {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              Provider.of<AuthProvider>(
                                context,
                                listen: false,
                              ).updateDisplayName(_name);
                            }
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              editMode
                  ? IconTag(
                      width: widget.width,
                      value: _name,
                      icon: Icons.person,
                    )
                  : ProfileTextField(
                      width: widget.width,
                      icon: Icons.person,
                      hintText: _name,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Name cannot be empty";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _name = value;
                        });
                      },
                    ),
              editMode
                  ? IconTag(
                      width: widget.width,
                      value: DateFormat.yMMMMd().format(birthDate),
                      icon: Icons.view_day,
                    )
                  : InkWell(
                      onTap: () => _selectDate(context),
                      child: IconTag(
                        width: widget.width,
                        value: DateFormat.yMMMMd().format(birthDate),
                        icon: Icons.view_day,
                      ),
                    ),
              editMode
                  ? IconTag(
                      width: widget.width,
                      value: _email,
                      icon: Icons.email,
                    )
                  : ProfileTextField(
                      width: widget.width,
                      icon: Icons.person,
                      hintText: _email,
                      onSaved: (value) {
                        setState(() {
                          _email = value;
                        });
                      },
                    ),
              editMode
                  ? IconTag(
                      width: widget.width,
                      value: _phoneNumber,
                      icon: Icons.phone_android,
                    )
                  : ProfileTextField(
                      width: widget.width,
                      icon: Icons.person,
                      hintText: _phoneNumber,
                      onSaved: (value) {
                        setState(() {
                          _phoneNumber = value;
                        });
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
