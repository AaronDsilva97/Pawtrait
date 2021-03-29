import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/pet_type.dart';
import '../provider/pet.dart';

class FilterPet extends StatefulWidget {
  @override
  _FilterPetState createState() => _FilterPetState();
}

class _FilterPetState extends State<FilterPet> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: width * 0.30,
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: petType.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Provider.of<PetProvider>(
                context,
                listen: false,
              ).filterPets(
                petType[index],
              );

              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                bottom: 10.0,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 5.0,
              ),
              decoration: BoxDecoration(
                color:
                    _selectedIndex == index ? Colors.white : Colors.grey[300],
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                boxShadow: [
                  _selectedIndex == index
                      ? BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(6, 6),
                        )
                      : BoxShadow(
                          color: Colors.grey,
                        ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.pets,
                    size: width * 0.16,
                    color: _selectedIndex == index ? Colors.black : Colors.grey,
                  ),
                  Text(
                    petType[index],
                    style: TextStyle(
                      color:
                          _selectedIndex == index ? Colors.black : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
