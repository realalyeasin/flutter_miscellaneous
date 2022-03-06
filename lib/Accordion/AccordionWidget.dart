import 'package:flutter/material.dart';
class AccordionWidget extends StatefulWidget {
  final String title, content;
  const AccordionWidget({Key? key, required this.title, required this.content}) : super(key: key);

  @override
  _AccordionWidgetState createState() => _AccordionWidgetState();
}

class _AccordionWidgetState extends State<AccordionWidget> {
  bool _showContent = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text(widget.title),
            trailing: IconButton(
              icon: Icon(
                _showContent ? Icons.arrow_drop_up : Icons.arrow_drop_down),
              onPressed: (){
                setState(() {
                  _showContent = !_showContent;
                });
              },
            ),
          ),
          _showContent ? Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Text(widget.content),
          ) :Container()
        ],
      ),
    );
  }
}
