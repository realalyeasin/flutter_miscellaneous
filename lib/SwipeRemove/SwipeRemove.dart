import 'package:flutter/material.dart';

class SwipeRemove extends StatefulWidget {
  const SwipeRemove({Key? key}) : super(key: key);

  @override
  _SwipeRemoveState createState() => _SwipeRemoveState();
}

class _SwipeRemoveState extends State<SwipeRemove> {
  final List myProducts = List.generate(100, (index) {
    return {'id' : index, 'title' : "Product #$index", 'price': index+1};
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Swipe Remove'),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: myProducts.length,
            itemBuilder: (BuildContext ctx, index){
              return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  onDismissed: (_){
                    setState(() {
                      myProducts.removeAt(index);
                    });
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Text(
                          myProducts[index]['id'].toString(),
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(myProducts[index]['title'],style: TextStyle(color: Colors.black, backgroundColor: Colors.white, letterSpacing: 2, fontWeight: FontWeight.w600)),
                      subtitle: Text('\$${myProducts[index]['price'].toString()}' ,style: TextStyle(color: Colors.black, backgroundColor: Colors.white, letterSpacing: 2, fontWeight: FontWeight.w500),
                    ),
                      trailing: Icon(Icons.arrow_back),
                  )),
              background: Container(
                color: Colors.redAccent,
                margin: EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.delete, color: Colors.white,),
                ),
              ),
              );
            }),
      ),
    );
  }
}
