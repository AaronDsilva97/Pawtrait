import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddAppointment extends StatefulWidget {
  static const routeName = "/add_appointment";

  @override
  _AddAppointmentState createState() => _AddAppointmentState();
}

class _AddAppointmentState extends State<AddAppointment> {
  final _formKey = GlobalKey<FormState>();

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  _selectDate(BuildContext context, bool value) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: value ? startDate : endDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );

    if (picked != null) {
      setState(() {
        if (value) {
          startDate = picked;
        } else {
          if (picked.isBefore(startDate)) {
            return;
          }
          endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final Pet pet = ModalRoute.of(context).settings.arguments;
    // print(pet);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text("Add Appointment"),
              // Text(pet.name),
              ElevatedButton(
                onPressed: () => _selectDate(context, true),
                child: Text("Select Start Date"),
              ),
              ElevatedButton(
                onPressed: () => _selectDate(context, false),
                child: Text("Select End Date"),
              ),
              Text(
                "Start Date " + DateFormat.yMMMMd().format(startDate),
              ),
              Text(
                "End Date " + DateFormat.yMMMd().format(endDate),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
