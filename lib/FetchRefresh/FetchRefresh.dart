import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class FetchRefresh extends StatefulWidget {
  const FetchRefresh({Key? key}) : super(key: key);

  @override
  _FetchRefreshState createState() => _FetchRefreshState();
}

class _FetchRefreshState extends State<FetchRefresh> {

  List _todos = [];

  Future<void> _loadData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/todos');
    try {
      final http.Response response = await http.get(url);
      final _loadedTodos = json.decode(response.body);
      setState(() {
        _todos = _loadedTodos;
      });
    } catch (err) {
      throw err;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch and Refresh'),
        centerTitle: true,
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: RefreshIndicator(
        onRefresh: _loadData,
        child: ListView.builder(
            itemCount: _todos.length,
            itemBuilder: (BuildContext ctx, index){
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                child: ListTile(
                    leading: Text(_todos[index]['id'].toString()),
                    title: Text(_todos[index]['title']),
                    trailing: _todos[index]['completed'] ? Icon(Icons.check, color: Colors.green,) :
                    Icon(Icons.cancel_presentation, color: Colors.red,)
                ),
              );
            }),
      ),
    );
  }
}