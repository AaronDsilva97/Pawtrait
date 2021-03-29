import 'package:flutter/material.dart';
import 'package:pawtrait/constants/pet_type.dart';
import 'package:provider/provider.dart';

import '../provider/pet.dart';
import '../widgets/search.dart';
import '../widgets/pet_card.dart';
import '../widgets/filter_pet.dart';

class AllPets extends StatefulWidget {
  @override
  _AllPetsState createState() => _AllPetsState();
}

class _AllPetsState extends State<AllPets> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final data = Provider.of<PetProvider>(context).searchPets;

    searchFilter(context, value) {
      Provider.of<PetProvider>(context, listen: false)
          .changeSearchString(value);
    }

    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 5.0,
                ),
                Search(
                  onChanged: (value) {
                    searchFilter(context, value);
                  },
                ),
                FilterPet(),
              ],
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return PetCard(
                  width: width,
                  photoUrl: data[index].photoUrl,
                  name: data[index].name,
                );
              },
              childCount: data.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // childAspectRatio: width / (width * 1.6),
              crossAxisSpacing: width * 0.01,
              mainAxisSpacing: width * 0.01 * 1.6,
              mainAxisExtent: width * 0.42 * 1.6,
            ),
          )
        ],
      ),
    );
  }
}

// return InkWell(
//                   onTap: () => Navigator.pushNamed(
//                     context,
//                     "/pet_description",
//                     arguments: data[index],
//                   ),
