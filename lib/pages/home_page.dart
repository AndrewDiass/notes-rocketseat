import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = <String>[
    "Primeiro item",
    "Segundo item",
    "Terceiro item",
  ];

  _deleteAndEditNote(int index) async {
    var response = await Navigator.pushNamed(context, "/create-note",
        arguments: notes[index]);
    if (response != null) {
      var description = response as String;
      if (response.isEmpty) {
        notes.removeAt(index);
      } else {
        notes[index] = description;
      }
      setState(() {});
    }
  }

  _createNote() async {
    final description = await Navigator.pushNamed(context, "/create-note");
    if (description != null) {
      setState(() {
        notes.add(description as String);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        centerTitle: true,
      ),
      body: SafeArea(
        bottom: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  for (var i = 0; i < notes.length; i++)
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        child: CardWidget(
                          note: notes[i],
                          onTap: () => _deleteAndEditNote(i),
                        )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: MediaQuery.of(context).size.width - 20,
              height: 40,
              child: ElevatedButton(
                onPressed: _createNote,
                child: Text("Criar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String note;
  final VoidCallback onTap;

  CardWidget({
    Key? key,
    required this.note,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF8C5DFB),
      child: ListTile(
        title: Text(
          note,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        onTap: onTap,
      ),
    );
  }
}
