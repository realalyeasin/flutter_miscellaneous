import 'dart:math';

import 'package:flutter/material.dart';

class FilterSearch extends StatefulWidget {
  const FilterSearch({Key? key}) : super(key: key);


  @override
  _FilterSearchState createState() => _FilterSearchState();
}
class Word{
  final String? name;
  final String? mean;
  Word(this.name, this.mean);
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
    {'id' : 1, 'name' : 'Abate', 'mean' : 'v. to diminish in intensity'},
    {'id' : 2, 'name' : 'Aberrant', 'mean' : 'adj. diverging from the standard type'},
    {'id' : 3, 'name' : 'Abjure', 'mean' : 'v. to reject or renounce'},
    {'id' : 4, 'name' : 'Abscond', 'mean' : 'v. to leave secretly, evading detection'},
    {'id' : 5, 'name' : 'Abstain', 'mean' : 'v. to voluntarily refrain from doing something'},
    {'id' : 6, 'name' : 'Acumen', 'mean' : 'n. keen judgment and perception'},
    {'id' : 7, 'name' : 'Admonish', 'mean' : 'v. scold or to advise firmly'},
    {'id' : 8, 'name' : 'Adulterate', 'mean' : 'v. to contaminate or make impure by introducing inferior elements'},
    {'id' : 9, 'name' : 'Advocate', 'mean' : 'v. to recommend, support, or advise'},
    {'id' : 10, 'name' : 'Aesthetic', 'mean' : 'adj. concerned with the nature of beauty and art'},
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
      backgroundColor: Colors.orange.shade200,
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
                labelText: 'Search', labelStyle: TextStyle(color: Colors.white,  letterSpacing: 3, fontWeight: FontWeight.bold, fontSize: 19),
                suffixIcon: Icon(Icons.search, color: Colors.white,),
                icon: IconButton(icon: Icon(Icons.list_alt, color: Colors.white, size: 35,), onPressed: () {  },)
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
                    leading: Icon(Icons.stacked_line_chart, color: Colors.blue),
                    title: Text(_foundWords[index]['name'], style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1, fontSize: 18),),
                    subtitle: Text(_foundWords[index]['mean'], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, letterSpacing: 1),),
                    trailing: IconButton(icon: Icon(Icons.call_made_outlined, color: Colors.black,), onPressed: () {  },),
                  ),

                )) : Text('Nothing Found'))
          ],
        ),
      )
    );
  }
}
