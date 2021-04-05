import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/pet.dart';
import '../provider/foster.dart';

class AddAppointment extends StatefulWidget {
  static const routeName = "/add_appointment";
  @override
  _AddAppointmentState createState() => _AddAppointmentState();
}

class _AddAppointmentState extends State<AddAppointment> {
  final _formKey = GlobalKey<FormState>();

  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

  _selectDate(
    BuildContext context,
  ) async {
    final DateTimeRange picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );

    if (picked != null) {
      setState(() {
        _startDate = picked.start;
        _endDate = picked.end;
      });
    }
  }

  _fixAppointment(Pet pet) {
    Navigator.pop(context);
    Provider.of<FosterProvider>(
      context,
      listen: false,
    ).addFoster(
      pet: pet,
      startDate: _startDate,
      endDate: _endDate,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Pet pet = ModalRoute.of(context).settings.arguments;
    final width = MediaQuery.of(context).size.width;
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
              Text("Check in time"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Start Date " + DateFormat.yMMMMd().format(_startDate),
                  ),
                  Text(
                    "End Date " + DateFormat.yMMMd().format(_endDate),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: Text("Select Date"),
              ),
              Text("Take Notes"),
              SizedBox(
                height: 200,
                width: width * 0.9,
                child: TextFormField(
                  minLines: null,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'description',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => _fixAppointment(pet),
                child: Text(
                  "Fix Appointment",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
