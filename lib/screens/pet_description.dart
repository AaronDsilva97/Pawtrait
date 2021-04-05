import 'package:flutter/material.dart';
import 'package:pawtrait/screens/appoinment_card.dart';
import 'package:provider/provider.dart';

import '../widgets/appointment_chip.dart';
import 'package:pawtrait/widgets/pet_description_card.dart';

import '../model/pet.dart';
import '../constants/appointment_filter.dart';
import '../provider/foster.dart';

class PetDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pet pet = ModalRoute.of(context).settings.arguments;
    // Provider.of<FosterProvider>(
    //   context,
    //   listen: false,
    // ).changeSearchString(pet.name);
    final fosterList = Provider.of<FosterProvider>(context).searchAppointments;

    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Image.network(
                    pet.photoUrl == null
                        ? "https://picsum.photos/id/237/200/300"
                        : pet.photoUrl,
                    height: width / 1.6,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          pet.name,
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 40,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            PetDescriptionCard(
                              value: "4 years old",
                              unit: "Age",
                            ),
                            PetDescriptionCard(
                              value: "Grey",
                              unit: "Color",
                            ),
                            PetDescriptionCard(
                              value: "4 kg",
                              unit: "Weight",
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Card(
                      elevation: 12.0,
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Appointment",
                          style: TextStyle(
                            fontFamily: "Lato",
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  AppointmentChip(
                    appointmentFilterType: appointmentFilterType,
                    width: width,
                    onChanged: (value) => Provider.of<FosterProvider>(
                      context,
                      listen: false,
                    ).filterbyDay(value),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return AppointmentCard(
                    appointment: fosterList[index],
                  );
                },
                childCount: fosterList.length,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Center(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushNamed(
                          context, "/add_appointment",
                          arguments: pet),
                      child: Text("Add Appoinment"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
