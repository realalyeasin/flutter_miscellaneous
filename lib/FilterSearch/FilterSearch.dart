import 'dart:math';

import 'package:flutter/material.dart';

class FilterSearch extends StatefulWidget {
  const FilterSearch({Key? key}) : super(key: key);

  @override
  _FilterSearchState createState() => _FilterSearchState();
}

class _FilterSearchState extends State<FilterSearch> {

  final c = [
    Colors.teal,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.black,
    Colors.white
  ];
  final List<Map<String, dynamic>> _allWords = [
    {'id' : 1, 'name' : 'Apaling', 'mean' : 'Fear'},
    {'id' : 2, 'name' : 'Indulgent', 'mean' : 'Lenient'},
    {'id' : 3, 'name' : 'Degenerate', 'mean' : 'Degrade'},
    {'id' : 4, 'name' : 'Persist', 'mean' : 'Persevere'},
    {'id' : 5, 'name' : 'Anathema', 'mean' : 'Evil/Cursed'},
    {'id' : 6, 'name' : 'Flourish', 'mean' : 'Grow vigorously'},
    {'id' : 7, 'name' : 'Redundancy', 'mean' : 'Layoff'},
    {'id' : 8, 'name' : 'Complacence', 'mean' : 'Self-Satisfaction'},
    {'id' : 9, 'name' : 'Blatant', 'mean' : 'Unpleasantly'},
    {'id' : 10, 'name' : 'Pungent', 'mean' : 'Rancid'},
  ];

  List<Map<String, dynamic>> _foundWords = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _foundWords = _allWords;
  }
  void _runFilter(String enterKey){
    List<Map<String, dynamic>> results = [];
    if(enterKey.isEmpty){
      results = _allWords;
    } else {
      results = _allWords.where((word) => word['name'].toLowerCase().contains(enterKey.toLowerCase())).toList();
    }

  setState(() {
    _foundWords = results;
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent.shade200,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('GRE Important Vocabs',
        style: TextStyle(
          color: Colors.amberAccent
        ),),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => _runFilter(value),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: 'Search', labelStyle: TextStyle(color: Colors.white, letterSpacing: 3, fontWeight: FontWeight.w600, fontSize: 19),
                suffixIcon: Icon(Icons.search, color: Colors.white,),
                icon: IconButton(icon: Icon(Icons.list_alt, color: Colors.black, size: 35,), onPressed: () {  },)
              ),
            ),
            SizedBox(height: 5,),
            Expanded(child: _foundWords.isNotEmpty ? ListView.builder(
                itemCount: _foundWords.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(_foundWords[index]['id']),
                  color: Colors.amberAccent,
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Icon(Icons.circle, color: c[Random().nextInt(4)],),
                    title: Text(_foundWords[index]['name']),
                    subtitle: Text(_foundWords[index]['mean']),
                  ),

                )) : Text('Nothing Found'))
          ],
        ),
      )
    );
  }
}
