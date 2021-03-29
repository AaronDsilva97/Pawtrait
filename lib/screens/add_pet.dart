import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../provider/pet.dart';
import '../constants/pet_type.dart';

class AddPet extends StatefulWidget {
  @override
  _AddPetState createState() => _AddPetState();
}

class _AddPetState extends State<AddPet> {
  File _image;
  final _formKey = GlobalKey<FormState>();

  final picker = ImagePicker();

  TextEditingController _name = TextEditingController();
  TextEditingController _age = TextEditingController();
  String _type = petType[0];
  String _gender = gender[0];

  Future _imgFromCamera() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("No image selected");
      }
    });
  }

  Future _imgFromGallery() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("No image selected");
      }
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  onSaved() {
    if (_formKey.currentState.validate()) {
      Provider.of<PetProvider>(context, listen: false).addPets(
        id: 11,
        name: _name.text,
        age: double.parse(_age.text),
        type: _type,
        gender: _gender,
        photoUrl: "https://picsum.photos/id/1003/200/300",
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Awesome " + _name.text + " is added to your list",
          ),
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _name.dispose();
    _age.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () => _showPicker(context),
                child: ClipOval(
                  child: _image == null
                      ? Image.network(
                          "https://via.placeholder.com/200",
                          height: width * 0.6,
                          width: width * 0.6,
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          _image,
                          width: width * 0.6,
                          height: width * 0.6,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Name",
                  labelText: "Pet Name",
                ),
                keyboardType: TextInputType.name,
                controller: _name,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter pet name";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Age",
                  labelText: "Pet Age",
                ),
                keyboardType: TextInputType.number,
                controller: _age,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter pet's age";
                  }
                  return null;
                },
              ),
              DropdownButton(
                value: _type,
                onChanged: (value) {
                  setState(() {
                    _type = value;
                  });
                },
                // icon: Icon(Icons.pets),
                items: petType.map<DropdownMenuItem<String>>(
                  (String e) {
                    return DropdownMenuItem<String>(
                      child: Text(e),
                      value: e,
                    );
                  },
                ).toList(),
              ),
              DropdownButton(
                value: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                },
                // icon: Icon(Icons.pets),
                items: gender.map<DropdownMenuItem<String>>(
                  (String e) {
                    return DropdownMenuItem<String>(
                      child: Text(e),
                      value: e,
                    );
                  },
                ).toList(),
              ),
              ElevatedButton(
                onPressed: () => onSaved(),
                child: Text("Add New Pet"),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
