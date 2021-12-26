import 'package:flutter/material.dart';

import 'ImagePicker/imagePicker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Future showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          final TextEditingController _textEditingController =
              TextEditingController();
          bool isChecked = false;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.amberAccent[100],
              content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _textEditingController,
                      validator: (value) {
                        return value!.isNotEmpty ? null : 'Invalid Field';
                      },
                      decoration: InputDecoration(hintText: 'First Name'),
                    ),
                    TextFormField(
                      controller: _textEditingController,
                      validator: (value) {
                        return value!.isNotEmpty ? null : 'Invalid Field';
                      },
                      decoration: InputDecoration(hintText: 'Last Name'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Select Box'),
                        Checkbox(
                            value: isChecked,
                            onChanged: (checked) {
                              setState(() {
                                isChecked = checked!;
                              });
                            })
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Yes'))
              ],
            );
          });
        });
  }

  Future<void> showRegisterDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          final TextEditingController _textEditingController =
              TextEditingController();
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.amberAccent[100],
              content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _textEditingController,
                      validator: (value) {
                        return value!.length == 11
                            ? null
                            : 'Please Enter Valid Number';
                      },
                      decoration: InputDecoration(hintText: ('Enter Number')),
                      keyboardType: TextInputType.phone,
                    ),
                    TextFormField(
                      controller: _textEditingController,
                      validator: (value) {
                        return value!.isNotEmpty
                            ? null
                            : 'Please Enter Valid Email';
                      },
                      decoration: InputDecoration(hintText: ('Enter Email')),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      controller: _textEditingController,
                      validator: (value) {
                        return value!.length >= 5
                            ? null
                            : 'Please Enter Valid Location';
                      },
                      decoration: InputDecoration(hintText: ('Enter Location')),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Submit'))
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Flutter Miscellaneous',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueAccent, Colors.black]
          ),

        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FlatButton(
                    color: Colors.black,
                    onPressed: () async {
                      await showInformationDialog(context);
                    },
                    child: Text(
                      'Add Name',
                      style: TextStyle(
                          letterSpacing: 2, fontSize: 13, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(

                    children: [
                      FlatButton(
                          onPressed: () async {
                            await showRegisterDialog(context);
                          },
                          color: Colors.black,
                          highlightColor: Colors.lightGreenAccent,
                          child: Text(
                            'Register with mail',
                            style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 2,
                                fontSize: 13),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      FlatButton(
                          onPressed: () async {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DatePickerDialog(
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1995),
                                      lastDate: DateTime(2022),
                                    )));
                          },
                          color: Colors.black,
                          highlightColor: Colors.lightGreenAccent,
                          child: Text(
                            'Calender',
                            style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 2,
                                fontSize: 13),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      FlatButton(
                          color: Colors.black,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => IImagePicker()));
                          },
                          child: Text(
                            'Image Picker',
                            style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 2,
                                fontSize: 13,
                                backgroundColor: Colors.black),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
