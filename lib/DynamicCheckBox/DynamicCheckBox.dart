import 'package:flutter/material.dart';

class DynamicCheckBox extends StatefulWidget {
  const DynamicCheckBox({Key? key}) : super(key: key);

  @override
  _DynamicCheckBoxState createState() => _DynamicCheckBoxState();
}

class _DynamicCheckBoxState extends State<DynamicCheckBox> {

  List<Map> availableHobbies = [
    {'name' : 'Football', 'isChecked': false},
    {'name' : 'Watching Movie', 'isChecked': false},
    {'name' : 'Music', 'isChecked': false},
    {'name' : 'Photography', 'isChecked': false},
    {'name' : 'Traveling', 'isChecked': false},
    {'name' : 'Cooking', 'isChecked': false},
    {'name' : 'Reading', 'isChecked': false},
    {'name' : 'Football', 'isChecked': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('CheckBox',style: TextStyle(fontSize: 20, color: Colors.white, letterSpacing: 2),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Choose your hobbies :',
              style: TextStyle(fontSize: 20, color: Colors.white, letterSpacing: 1, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Divider(color: Colors.white,),
              SizedBox(height: 10,),
              Column(
                children: availableHobbies.map((hobby) {
                  return CheckboxListTile(
                      value: hobby['isChecked'],
                      title: Text(hobby['name'],style: TextStyle(fontSize: 20, color: Colors.white, letterSpacing: 1, fontWeight: FontWeight.bold),),
                      onChanged: (newValue){
                        setState(() {
                          hobby['isChecked'] = newValue;
                        });
                      });
                }).toList(),
              ),
              SizedBox(height: 8,),
              Divider(color: Colors.white,),
              SizedBox(height: 8,),
              Wrap(
                children:
                  availableHobbies.map((e) {
                    if (e['isChecked'] == true) {
                      return Card(
                        elevation: 3,
                        color: Colors.green,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(e['name'],style: TextStyle(fontSize: 18, color: Colors.white, letterSpacing: 1, fontWeight: FontWeight.bold),),
                        ),
                      );
                    }
                    return Container();
                  }).toList()
              )
            ],
          ),
        ),
      ),
    );
  }
}
