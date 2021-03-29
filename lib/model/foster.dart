import 'package:flutter/cupertino.dart';

import './pet.dart';
import "./user.dart";

class Foster {
  final Pet pet;
  final User user;
  final DateTime startDate;
  final DateTime endDate;

  Foster({
    @required this.pet,
    @required this.startDate,
    @required this.endDate,
    @required this.user,
  });
}
