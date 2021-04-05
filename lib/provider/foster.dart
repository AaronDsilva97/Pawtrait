import 'dart:collection';
import 'package:flutter/material.dart';

import '../model/user.dart';
import '../model/foster.dart';
import '../model/pet.dart';

class FosterProvider with ChangeNotifier {
  List<Foster> _fosterList = [
    Foster(
      pet: Pet(
        id: 0,
        name: "Coco",
        age: 5,
        type: "Dog",
        birthDate: DateTime.now(),
        photoUrl: "https://picsum.photos/id/237/200/300",
      ),
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      user: User(
        firstName: "Aaron",
        lastName: "Dsilva",
      ),
    ),
    Foster(
      pet: Pet(
        id: 0,
        name: "Popo",
        age: 5,
        type: "Dog",
        birthDate: DateTime.now(),
        photoUrl: "https://picsum.photos/id/237/200/300",
      ),
      startDate: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day + 1,
      ),
      endDate: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day + 1,
      ),
      user: User(
        firstName: "Aaron",
        lastName: "Dsilva",
      ),
    ),
    Foster(
      pet: Pet(
        id: 0,
        name: "Momo",
        age: 5,
        type: "Cat",
        birthDate: DateTime.now(),
        photoUrl: "https://picsum.photos/id/237/200/300",
      ),
      startDate: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day - 1,
      ),
      endDate: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day - 1,
      ),
      user: User(
        firstName: "Aaron",
        lastName: "Dsilva",
      ),
    )
  ];

  List<Foster> get fosterList {
    return [..._fosterList];
  }

  String _searchString = "";
  String _filterbyDay = "Today";
  DateTime now = DateTime.now();

  UnmodifiableListView<Foster> get searchAppointments => UnmodifiableListView(
        _fosterList.where(
          (foster) {
            if (_filterbyDay == "Today" && foster.startDate.day == now.day) {
              if (foster.pet.name.contains(_searchString) ||
                  _searchString == "") {
                return true;
              }
            } else if (_filterbyDay == "Upcoming" &&
                foster.startDate.isAfter(now)) {
              if (foster.pet.name.contains(_searchString) ||
                  _searchString == "") {
                return true;
              }
            } else if (_filterbyDay == "Recent" &&
                foster.startDate.isBefore(now)) {
              if (foster.pet.name.contains(_searchString) ||
                  _searchString == "") {
                return true;
              }
            }
            return false;
          },
        ),
      );

  void filterbyDay(String value) {
    _filterbyDay = value;
    notifyListeners();
  }

  void changeSearchString(String searchString) {
    _searchString = searchString;
    notifyListeners();
  }

  void addFoster({
    @required Pet pet,
    @required DateTime startDate,
    @required DateTime endDate,
  }) {
    _fosterList.add(
      Foster(
        pet: pet,
        startDate: startDate,
        endDate: endDate,
        user: User(
          firstName: "Aaron",
          lastName: "Dsilva",
        ),
      ),
    );
    notifyListeners();
  }
}
