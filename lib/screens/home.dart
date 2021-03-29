import 'package:flutter/material.dart';
import 'package:pawtrait/screens/appoinment_card.dart';
import 'package:provider/provider.dart';

import '../widgets/user_header.dart';
import '../widgets/search.dart';
import '../provider/foster.dart';
import '../widgets/appointment_chip.dart';
import '../constants/appointment_filter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
                  UserHeader(
                    user: "Aaron Dsilva",
                    profileImage: "https://picsum.photos/200/300",
                  ),
                  Search(
                    hintText: "Search Appointments",
                    onChanged: (value) {
                      Provider.of<FosterProvider>(
                        context,
                        listen: false,
                      ).changeSearchString(value);
                    },
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
          ],
        ),
      ),
    );
  }
}
