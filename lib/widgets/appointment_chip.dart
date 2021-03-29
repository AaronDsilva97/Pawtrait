import 'package:flutter/material.dart';

class AppointmentChip extends StatefulWidget {
  final List<String> appointmentFilterType;
  final double width;
  AppointmentChip({
    @required this.appointmentFilterType,
    @required this.width,
  });

  @override
  _AppointmentChipState createState() => _AppointmentChipState();
}

class _AppointmentChipState extends State<AppointmentChip> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widget.width * 0.1 / 1.6,
      ),
      child: Wrap(
          spacing: widget.width * 0.1 / 1.6,
          children: List<Widget>.generate(
            widget.appointmentFilterType.length,
            (index) => InkWell(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Chip(
                label: Text(
                  widget.appointmentFilterType[index],
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 20,
                    color: _selectedIndex == index
                        ? Color(0xff000000)
                        : Colors.grey,
                  ),
                  textAlign: TextAlign.left,
                ),
                elevation: _selectedIndex == index ? 12.0 : 0.0,
                backgroundColor:
                    _selectedIndex == index ? Colors.white : Colors.grey[300],
              ),
            ),
          )),
    );
  }
}
