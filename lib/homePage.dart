import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:important_widgets/DrawerCustom/DrawerCustom.dart';
import 'package:important_widgets/TextWrapper/TWHomePage.dart';
import 'Accordion/Accordion.dart';
import 'ChipItem/ChipItem.dart';
import 'DynamicCheckBox/DynamicCheckBox.dart';
import 'EmailFieldValidation/EmailFieldValidation.dart';
import 'FetchRefresh/FetchRefresh.dart';
import 'FilterSearch/FilterSearch.dart';
import 'ImagePicker/imagePicker.dart';
import 'ListHighlight/ListHighlight.dart';
import 'PopUpMenu/PopUp1.dart';
import 'Rating/ProductRating.dart';
import 'SQFLiteNotes/SQFLNotesHomePage.dart';
import 'SliverBar/SliverBar.dart';
import 'StateManagement/screens/home_screen.dart';
import 'Stepper/StepByStep.dart';
import 'SwipeRemove/SwipeRemove.dart';
import 'WeatherAPI.dart';
import 'Widgets/SearchPage.dart';
import 'Widgets/clip.dart';
import 'Xpansion/Xpansion.dart';


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
              backgroundColor: Colors.blueAccent[100],
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
              backgroundColor: Colors.blueAccent[100],
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

      drawer: DrawerCustom(),
      backgroundColor: Colors.lightGreenAccent[100],
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(7, 43, 19, 1),
        title: Text(
          'Flutter Miscellaneous',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SearchPage())),
              icon: Icon(Icons.search)),
          PopupMenuButton(
              color: Colors.lightBlueAccent.shade100,
              itemBuilder: (BuildContext ctx) => [
                    PopupMenuItem(
                      child: Text('Option 1'),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Text('Option 2'),
                      value: 2,
                    ),
                    PopupMenuItem(
                      child: Text('Option 3'),
                      value: 3,
                    ),
                    PopupMenuItem(
                      child: Text('Option 4'),
                      value: 4,
                    ),
                  ])
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blueAccent, Colors.black]),
        ),
        child: PageView(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        children: [
                          FlatButton(
                            color: Colors.black,
                            onPressed: () async {
                              await showInformationDialog(context);
                            },
                            child: Text(
                              'Add Name',
                              style: TextStyle(
                                  letterSpacing: 2,
                                  fontSize: 13,
                                  color: Colors.white),
                            ),
                          ),
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
                  ),
                  Positioned(
                    top: 210,
                    child: Row(
                      children: [
                        ClipPath(
                          clipper: MyClipper(),
                          child: Container(
                            width: 120,
                            height: 40,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [Colors.deepPurple, Colors.purple]),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(1),
                                    spreadRadius: 5,
                                    blurRadius: 5,
                                    offset: Offset(1, 4),
                                  )
                                ]),
                            child: Stack(children: [
                              Positioned(
                                  top: 11,
                                  left: 5,
                                  child: Text(
                                    'ClipBehavior',
                                    style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ]),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ClipPath(
                          clipper: MyClipper(),
                          child: Container(
                            width: 178,
                            height: 40,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [Colors.purple, Colors.pinkAccent]),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(1),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(0, 1),
                                  )
                                ]),
                            child: Stack(children: [
                              Positioned(
                                  top: -5,
                                  left: 1,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SMHomeScreen()));
                                    },
                                    child: Text(
                                      'State Management',
                                      style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  )),
                            ]),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      left: 300,
                      top: 20,
                      child: Container(
                        width: 40,
                        height: 180,
                        color: Colors.white54,
                        child: FlatButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => TWHomePage()));
                            },
                            child: Text(
                              'TextWrapper',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      )),
                  Positioned(
                    top: 262,
                    left: 5,
                    child: Row(
                      children: [
                        Container(
                          width: 70,
                          color: Colors.white54,
                          child: FlatButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SQFLNotesHomePage()));
                              },
                              child: Text(
                                'SQFL Notes',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      top: 262,
                      left: 94,
                      child: Container(
                        width: 85,
                        color: Colors.white54,
                        child: FlatButton(
                          child: Text('Stepper',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => StepByStep()));
                          },
                        ),
                      )),
                  Positioned(
                      top: 262,
                      left: 198,
                      child: Container(
                        width: 85,
                        color: Colors.white54,
                        child: FlatButton(
                          child: Text('Rating',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProductRating()));
                          },
                        ),
                      )),
                  Positioned(
                    top: 262,
                    left: 299,
                    child: Badge(
                      position: BadgePosition.topEnd(top: -10, end: -12),
                      badgeColor: Colors.deepOrange,
                      badgeContent: Container(
                        alignment: Alignment.center,
                        child: Text('12'),
                      ),
                      child: Container(
                        width: 69,
                        height: 48,
                        color: Colors.white54,
                        child: Center(
                          child: Text('Badge',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 318,
                      child: Card(
                        color: Colors.white,
                        child: FlatButton(
                          child: Text('Highlight',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 15,
                                  letterSpacing: 1)),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ListHighlight()));
                          },
                        ),
                      )),
                  Positioned(
                      top: 318,
                      left: 129,
                      child: Container(
                        height: 56,
                        width: 120,
                        child: Card(
                          shadowColor: Colors.black,
                          elevation: 5,
                          borderOnForeground: true,
                          color: Colors.white,
                          child: FlatButton(
                            child: Text('Dynamic CheckBox',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 15,
                                    letterSpacing: 1)),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DynamicCheckBox()));
                            },
                          ),
                        ),
                      )),
                  Positioned(
                      top: 318,
                      left: 262,
                      child: Container(
                        height: 56,
                        width: 110,
                        child: Card(
                          shadowColor: Colors.black,
                          elevation: 5,
                          borderOnForeground: true,
                          color: Colors.white,
                          child: FlatButton(
                            child: Text('Swipe Remove',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 15,
                                    letterSpacing: 1)),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SwipeRemove()));
                            },
                          ),
                        ),
                      )),
                  Positioned(
                    top: 385,
                    left: 3,
                    child: Container(
                      width: 70,
                      height: 30,
                      color: Colors.black,
                      child: Center(
                          child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FilterSearch()));
                        },
                        child: Text(
                          'Filter',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1),
                        ),
                      )),
                    ),
                  ),
                  Positioned(
                    top: 385,
                    left: 80,
                    child: Container(
                      width: 120,
                      height: 30,
                      color: Colors.lightBlueAccent,
                      child: Center(
                          child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ChipItem()));
                        },
                        child: Text(
                          'Chip Item',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      )),
                    ),
                  ),
                  Positioned(
                    top: 385,
                    left: 208,
                    child: Container(
                      width: 161,
                      height: 50,
                      color: Colors.white,
                      child: Center(
                          child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FetchRefresh()));
                        },
                        child: Text(
                          ' Fetch and  \n'
                          '  Refresh     ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              backgroundColor: Colors.lightBlueAccent.shade100,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2),
                        ),
                      )),
                    ),
                  ),
                  Positioned(
                    top: 425,
                    left: 5,
                    child: Container(
                      width: 94,
                      height: 50,
                      color: Colors.white,
                      child: Center(
                          child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SliverBar()));
                        },
                        child: Text(
                          'Sliver Bar',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              backgroundColor: Colors.lightBlueAccent.shade100,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2),
                        ),
                      )),
                    ),
                  ),
                  Positioned(
                    top: 425,
                    left: 107,
                    child: Container(
                      width: 94,
                      height: 50,
                      color: Colors.white,
                      child: Center(
                          child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => WeatherAPI()));
                        },
                        child: Text(
                          'WeatherAPI',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              backgroundColor: Colors.lightBlueAccent.shade100,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2),
                        ),
                      )),
                    ),
                  ),
                  Positioned(
                    top: 442,
                    left: 208,
                    child: Container(
                      width: 124,
                      height: 33,
                      color: Color.fromRGBO(185, 22, 103, 1),
                      child: Center(
                          child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Expansion()));
                        },
                        child: Text(
                          'Xpansion',
                          style: TextStyle(
                              color: Color.fromRGBO(204, 255, 62, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2),
                        ),
                      )),
                    ),
                  ),
                  Positioned(
                    top: 442,
                    left: 338,
                    child: Container(
                      width: 32,
                      height: 100,
                      color: Color.fromRGBO(204, 255, 62, 1),
                      child: Center(
                          child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EmailFieldValidation()));
                        },
                        child: Text(
                          'LOCATION',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2),
                        ),
                      )),
                    ),
                  ),
                  Positioned(
                    top: 483,
                    left: 252,
                    child: Container(
                      width: 80,
                      height: 50,
                      color: Color.fromRGBO(204, 255, 62, 1),
                      child: Center(
                          child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DrawerCustom()));
                        },
                        child: Text(
                          'Custom Drawer',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      )),
                    ),
                  ),
                  Positioned(
                    top: 546,
                    left: 252,
                    child: Container(
                      width: 118,
                      height: 50,
                      color: Color.fromRGBO(204, 255, 62, 1),
                      child: Center(
                          child: FlatButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Accordion()));
                            },
                            child: Text(
                              'Accordion',
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 14,
                                  backgroundColor: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2),
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
