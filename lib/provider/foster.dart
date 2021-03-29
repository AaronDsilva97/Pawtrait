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
        photoUrl: "https://picsum.photos/id/237/200/300",
      ),
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      user: User(
        firstName: "Aaron",
        lastName: "Dsilva",
      ),
    )
  ];

  List<Foster> get fosterList {
    return [..._fosterList];
  }

  void addFoster(
    Pet pet,
    DateTime startDate,
    DateTime endDate,
    User user,
  ) {
    _fosterList.add(Foster(
      pet: pet,
      startDate: startDate,
      endDate: endDate,
      user: user,
    ));
  }
}
