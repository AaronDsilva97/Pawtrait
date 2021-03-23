import 'package:flutter/material.dart';

final data = [
  {
    "id": 1,
    "name": "Coco",
    "image": "https://picsum.photos/id/237/200/300",
  },
  {
    "id": 2,
    "name": "Coco",
    "image": "https://picsum.photos/id/237/200/300",
  },
  {
    "id": 3,
    "name": "Coco",
    "image": "https://picsum.photos/id/237/200/300",
  },
  {
    "id": 4,
    "name": "Coco",
    "image": "https://picsum.photos/id/237/200/300",
  },
  {
    "id": 5,
    "name": "Coco",
    "image": "https://picsum.photos/id/237/200/300",
  },
  {
    "id": 6,
    "name": "Coco",
    "image": "https://picsum.photos/id/237/200/300",
  },
  {
    "id": 7,
    "name": "Coco",
    "image": "https://picsum.photos/id/237/200/300",
  },
  {
    "id": 8,
    "name": "Coco",
    "image": "https://picsum.photos/id/237/200/300",
  },
];

class AllPets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search here",
                labelText: "Pet Search",
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, "/add_pet"),
            child: Text("Add Pets"),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      (orientation == Orientation.portrait) ? 2 : 3),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: GridTile(
                    footer: Text(data[index]['name']),
                    child: Image.network(
                      data[index]['image'],
                      fit: BoxFit.cover,
                    ), //just for testing, will fill with image later
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
