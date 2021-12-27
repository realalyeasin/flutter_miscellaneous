import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWrapper extends StatefulWidget {

  const TextWrapper({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  _TextWrapperState createState() => _TextWrapperState();
}

class _TextWrapperState extends State<TextWrapper>
  with TickerProviderStateMixin
  {
    bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          AnimatedSize(
            duration: Duration(milliseconds: 300),
            child: ConstrainedBox(
              constraints: isExpanded ? BoxConstraints() : BoxConstraints(maxHeight: 70),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.text,
                  style: TextStyle(fontSize: 14),
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
          ),
          isExpanded ? OutlineButton.icon(
              icon: Icon(Icons.arrow_upward),
              label: Text('Read Less'),
              onPressed: ()=> setState(() => isExpanded = false ))
              : TextButton.icon(onPressed: () => setState(() => isExpanded = true),
              icon: Icon(Icons.arrow_downward),
              label: Text('Read More'))
        ]
      ),
    );
  }
}
