import 'dart:math';

import 'package:flutter/material.dart';

class ChipData{
  final String id;
  final String name;

  ChipData({ required this.id, required this.name});
}

class ChipItem extends StatefulWidget {
  const ChipItem({Key? key}) : super(key: key);

  @override
  _ChipItemState createState() => _ChipItemState();
}

class _ChipItemState extends State<ChipItem> {

  final c = [
    Colors.teal,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.white
  ];

  final List<ChipData> _allChips = [];
  final TextEditingController _textEditingController = TextEditingController();

  void _addNewChip() async {
    await showDialog(
        context: context,
        builder: (_){
          return AlertDialog(
            title: Text('Add an item'),
            content: TextField(
              controller: _textEditingController,
            ),
            actions: [
              ElevatedButton(onPressed: (){
                setState(() {
                  _allChips.add(ChipData(
                      id: DateTime.now().toString(),
                      name: _textEditingController.text));
                });
                _textEditingController.text='';
                Navigator.of(context).pop();
              }, child: Text('Submit'))
            ],
          );
        });
  }
  void _deleteChip(String id){
    setState(() {
      _allChips.removeWhere((element) => element.id==id);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: Text('Chip Item',
        style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Wrap(
          spacing: 10,
          children: _allChips.map((e) => Chip(
            key: ValueKey(e.id),
            label: Text(e.name),
            backgroundColor: c[Random().nextInt(4)],
            deleteIconColor: Colors.red,
            onDeleted: () => _deleteChip(e.id),
          )).toList()
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewChip,
        child: Icon(Icons.add),
      ),
    );
  }
}
