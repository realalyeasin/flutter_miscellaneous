import 'package:flutter/material.dart';

import 'model/xpansionModel.dart';

class Expansion extends StatelessWidget {
  const Expansion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ItemModel> itemData = <ItemModel>[
      ItemModel(
        headerItem: 'Android',
        description: "Android is a mobile operating system based on a modified version of the Linux kernel and other open source software, designed primarily for touchscreen mobile devices such as smartphones and tablets. ... Some well known derivatives include Android TV for televisions and Wear OS for wearables, both developed by Google.",
        ),
    ];
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 34, 74, 1),
      body: Container(
        child: ListView.builder(
            itemCount: itemData.length,
            itemBuilder: (BuildContext context, int index){
          return ExpansionPanelList(
            animationDuration: Duration(milliseconds: 1000),
            dividerColor: Colors.yellow,
            elevation: 1,
            children: [
              ExpansionPanel(body: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipOval(
                      child: CircleAvatar(
                        child: Icon(Icons.android, color: Colors.green,),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Text(
                      itemData[index].description,
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 1
                      ),
                    )
                  ],
                ),
              ),
                headerBuilder: (BuildContext context, bool isExpanded){
                return Container(
                  child: Text(
                    itemData[index].headerItem,
                  ),
                );
                },
                isExpanded: itemData[index].expanded,
              )
            ],
            expansionCallback: (index, isExpanded)=>
              setState(() {
                isExpanded = !itemData[index].expanded;

              })


          );
        }),
      )
    );
  }

  void setState(Null Function() param0) {}
  
}
