
import 'package:flutter/material.dart';
import 'package:fancy_drawer/fancy_drawer.dart';

class DrawerCustom extends StatefulWidget {
  const DrawerCustom({Key? key}) : super(key: key);

  @override
  _DrawerCustomState createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom>
    with SingleTickerProviderStateMixin {
  late FancyDrawerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = FancyDrawerController(
        vsync: this, duration: Duration(milliseconds: 300))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FancyDrawerWrapper(
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.yellow,
                title: Text('Fancy Drawer',
                style: TextStyle(
                  color: Color.fromRGBO(52, 1, 74, 1)
                ),),
                leading: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    _controller.toggle();
                  },
                )),
            backgroundColor: Color.fromRGBO(13, 76, 86, 1),
          ),
          controller: _controller,
          itemGap: 20,
          cornerRadius: 10,
          backgroundColor: Color.fromRGBO(67, 14, 96, 1),
          drawerPadding: EdgeInsets.all(40),
          hideOnContentTap: true,
          drawerItems: [
            Text(
              "Go to home",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.black,
                letterSpacing: 4
              ),
            ),
            Text(
              "About us",
              style: TextStyle(
                fontSize: 19,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.black,
                  letterSpacing: 4
              ),
            ),
            Text(
              "Our products",
              style: TextStyle(
                fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.black,
                  letterSpacing: 4
              ),
            ),
            Text(
              "Support us",
              style: TextStyle(
                fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.black,
                  letterSpacing: 4
              ),
            ),
            Text(
              "Log out",
              style: TextStyle(
                fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.black,
                  letterSpacing: 3
              ),
            ),
          ]),
    );
  }
}

