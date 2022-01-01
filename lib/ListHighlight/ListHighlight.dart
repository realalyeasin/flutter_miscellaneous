import 'package:flutter/material.dart';

class ListHighlight extends StatefulWidget {
  const ListHighlight({Key? key}) : super(key: key);

  @override
  _ListHighlightState createState() => _ListHighlightState();
}

class _ListHighlightState extends State<ListHighlight> {
  int index = 1;
  final List<Map> data = List.generate(100, (index) => {'id' : index, 'name' : 'Item $index', 'isSelected' : false});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('List Highlight'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: data.length,
            itemBuilder: (BuildContext ctx, index){
            return Card(
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              color: data[index]['isSelected'] == true ? Colors.deepOrange : Colors.white,
              child: ListTile(
                onTap: (){
                  setState(() {
                    data[index]['isSelected'] = !data[index]['isSelected'];
                  });
                },
                leading: CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: Text(data[index]['id'].toString(),
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                ),
                title: Text(data[index]['name']),
              ),
            );
            }),
      ),
    );
  }
}
