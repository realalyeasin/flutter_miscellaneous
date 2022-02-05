import 'dart:math';

import 'package:flutter/material.dart';

class SliverBar extends StatefulWidget {
  const SliverBar({Key? key}) : super(key: key);

  @override
  _SliverBarState createState() => _SliverBarState();
}

class _SliverBarState extends State<SliverBar> {
  var ii = 0;
  final List _gridItems = List.generate(81, (i) => 'Item $i');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Sliver Bar'),
        backgroundColor: Colors.black26,
        automaticallyImplyLeading: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            backgroundColor: Colors.teal,
            elevation: 1,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                margin: EdgeInsets.all(10),
                color: Colors.lightBlueAccent,
                child: Center(
                  child: Icon(Icons.filter_list_outlined, size: 60, color: Colors.black,),
                ),
              ),
              title: Text('First Sliver', style: TextStyle(color: Colors.black, letterSpacing: 2,fontWeight: FontWeight.bold, fontSize: 15, ),),
              centerTitle: true,
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            childAspectRatio: 1,
            children: [
              Card(
                shadowColor: Colors.white,
                margin: EdgeInsets.all(12),
                color: Colors.orangeAccent,
                child: Container(),
              ),
              Card(
                shadowColor: Colors.white,
                margin: EdgeInsets.all(12),
                color: Colors.orangeAccent,
                child: Container(),
              ),
              Card(
                shadowColor: Colors.white,
                margin: EdgeInsets.all(12),
                color: Colors.orangeAccent,
                child: Container(),
              ),
              Card(
                shadowColor: Colors.white,
                margin: EdgeInsets.all(12),
                color: Colors.orangeAccent,
                child: Container(),
              ),
              Card(
                shadowColor: Colors.white,
                margin: EdgeInsets.all(12),
                color: Colors.orangeAccent,
                child: Container(),
              ),
              Card(
                shadowColor: Colors.white,
                margin: EdgeInsets.all(12),
                color: Colors.orangeAccent,
                child: Container(),
              )
            ],),
          SliverPadding(padding: EdgeInsets.symmetric(vertical: 10)),
          SliverAppBar(
            automaticallyImplyLeading: false,
            elevation: 5,
            pinned: true,
            backgroundColor: Colors.pink,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Container(
                margin: EdgeInsets.all(10.0,),
                color: Colors.yellow,
                child: Icon(Icons.book, color: Colors.black,size: 60,),
              ),
              title: Text('Second Sliver',style: TextStyle(color: Colors.black, letterSpacing: 2,fontWeight: FontWeight.bold, fontSize: 15, )),
            ),
          ),
          SliverPadding(padding: EdgeInsets.symmetric(vertical: 20)),
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                  (context, index){
                    return Card(
                      color: Colors.teal[Random().nextInt(9)*100],
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(_gridItems[index]),
                      ),
                    );
                  },
                childCount: _gridItems.length
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2
              ),
          ),
          SliverPadding(padding: EdgeInsets.symmetric(vertical: 20)),
        ],
      ),
    );
  }
}
