import 'package:flutter/material.dart';
import '../model/pet.dart';

class Story extends StatelessWidget {
  final List<Pet> petList;

  Story({@required this.petList});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: petList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              onTap: () => Navigator.pushNamed(
                context,
                "/pet_description",
                arguments: petList[index],
              ),
              child: Column(
                children: <Widget>[
                  ClipOval(
                    child: Image.network(
                      petList[index].photoUrl == null
                          ? "https://via.placeholder.com/150"
                          : petList[index].photoUrl,
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    petList[index].name,
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
