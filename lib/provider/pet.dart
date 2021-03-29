import 'dart:collection';

import 'package:flutter/material.dart';

import '../model/pet.dart';

class PetProvider with ChangeNotifier {
  List<Pet> _petList = [
    Pet(
      id: 0,
      name: "Coco",
      age: 5,
      type: "Dog",
      birthDate: DateTime.now(),
      photoUrl: "https://picsum.photos/id/237/200/300",
    ),
    Pet(
      id: 1,
      name: "Coco",
      age: 5,
      type: "Dog",
      birthDate: DateTime.now(),
      photoUrl: "https://picsum.photos/id/237/200/300",
    ),
    Pet(
      id: 2,
      name: "Coco",
      age: 5,
      type: "Dog",
      birthDate: DateTime.now(),
    ),
    Pet(
      id: 3,
      name: "Coco",
      age: 5,
      type: "Dog",
      birthDate: DateTime.now(),
    ),
    Pet(
      id: 4,
      name: "Coco",
      age: 5,
      type: "Dog",
      birthDate: DateTime.now(),
      photoUrl: "https://picsum.photos/id/237/200/300",
    ),
    Pet(
      id: 5,
      name: "Coco",
      age: 5,
      type: "Cat",
      birthDate: DateTime.now(),
    ),
  ];

  List<Pet> get pets {
    return [..._petList];
  }

  String _searchString = "";
  String _filterType = "";

  UnmodifiableListView<Pet> get searchPets => _filterType.isEmpty
      ? UnmodifiableListView(_petList)
      : UnmodifiableListView(
          _petList.where(
            (pet) {
              if (_filterType == pet.type ||
                  _filterType.isEmpty ||
                  _filterType == "All") {
                if (pet.name.contains(_searchString) || _searchString == "") {
                  return true;
                }
              }
              return false;
            },
          ),
        );

  void changeSearchString(String searchString) {
    _searchString = searchString;
    notifyListeners();
  }

  void filterPets(String filterType) {
    _filterType = filterType;
    // print(_filterType);
    notifyListeners();
  }

  void addPets({
    @required id,
    @required name,
    @required age,
    gender,
    breed,
    photoUrl,
    @required type,
    description,
  }) {
    _petList.add(Pet(
      id: 0,
      name: name,
      age: age,
      type: type,
      birthDate: DateTime.now(),
      breed: "",
      gender: gender,
      description: "",
      photoUrl:
          photoUrl == null ? "https://picsum.photos/id/237/200/300" : photoUrl,
    ));
    notifyListeners();
  }
}
