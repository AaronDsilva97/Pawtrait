import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/foster.dart';
import '../provider/foster.dart';

class AppointmentCard extends StatelessWidget {
  final Foster appointment;

  AppointmentCard({@required this.appointment});
  @override
  Widget build(BuildContext context) {
    if (appointment == null) {
      return Center(
        child: Text("No Appointment"),
      );
    }
    return InkWell(
      onTap: () {
        Provider.of<FosterProvider>(
          context,
          listen: false,
        ).changeSearchString(appointment.pet.name);
        Navigator.pushNamed(
          context,
          "/pet_description",
          arguments: appointment.pet,
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 10.0,
        ),
        elevation: 12.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  appointment.pet.photoUrl,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          appointment.pet.name,
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 30,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          appointment.pet.age.toInt().toString() + " years",
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 12,
                            color: const Color(0xff000000),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    Icon(
                      appointment.pet.gender == "male"
                          ? Icons.wc
                          : Icons.wc_outlined,
                      size: 24,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    DateFormat.MMMEd().format(appointment.startDate) +
                        " - " +
                        DateFormat.yMMMEd().format(
                          appointment.endDate,
                        ),
                  ),
                ),
                Text(
                  appointment.user.firstName + " " + appointment.user.lastName,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
