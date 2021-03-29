import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:pawtrait/widgets/profile_card.dart';
import '../provider/auth.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              PhysicalModel(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(
                  Radius.circular(width * 0.3 / 1.6),
                ),
                elevation: 12.0,
                child: InkWell(
                  onTap: getImage,
                  child: CircleAvatar(
                    radius: width * 0.3 / 1.6,
                    backgroundImage: _image == null
                        ? NetworkImage(
                            "https://picsum.photos/seed/picsum/200/600")
                        : FileImage(_image),
                  ),
                ),
              ),
              ProfileCard(
                width: width,
              ),
              ElevatedButton(
                onPressed: () =>
                    Provider.of<AuthProvider>(context, listen: false).signOut(),
                child: Text("Sign Out"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
