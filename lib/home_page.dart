import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List myTiles = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
  ];

  // reodrder method
  void updatedTiles(int oldIndex, int newIndex) {
    setState(() {
      // adjust tiles for moving them down the list
      if (oldIndex < newIndex) {
        newIndex--;
      }

      // getting the tile that we are moving
      final tile = myTiles.removeAt(oldIndex);

      // place the tile on the new position
      myTiles.insert(newIndex, tile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 247, 111, 90),
        title: const Text('Drag & Drop List'),
      ),
      body: ReorderableListView(
        children: [
          for (final tile in myTiles)
            Padding(
              key: ValueKey(tile),
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 247, 111, 90),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  textColor: Colors.white,
                  title: Text(tile.toString()),
                ),
              ),
            ),
        ],
        onReorder: (oldIndex, newIndex) {
          updatedTiles(oldIndex, newIndex);
        },
      ),
    );
  }
}
