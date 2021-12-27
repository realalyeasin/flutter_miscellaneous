import 'package:flutter/material.dart';
import 'package:important_widgets/StateManagement/provider/movie_provider.dart';
import 'package:provider/provider.dart';
import 'my_list_screen.dart';

class SMHomeScreen extends StatefulWidget {
  const SMHomeScreen({Key? key}) : super(key: key);

  @override
  _SMHomeScreenState createState() => _SMHomeScreenState();
}

class _SMHomeScreenState extends State<SMHomeScreen> {
  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().movies;
    var myList = context.watch<MovieProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('State Management'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.blue, Colors.black],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyListScreen()));
                },
                label: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Go to my list (${myList.length})', style: TextStyle(fontSize: 20, color: Colors.white, letterSpacing: 2),),
                ),
                icon: Icon(
                  Icons.favorite,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: movies.length,
                      itemBuilder: (BuildContext context, index) {
                        final currentMovie = movies[index];
                        return Card(
                          key: ValueKey(currentMovie.title),
                          color: Colors.green.shade200,
                          elevation: 4,
                          child: ListTile(
                            title: Text(currentMovie.title),
                            subtitle:
                                Text(currentMovie.runtime ?? 'No Information'),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: myList.contains(currentMovie)
                                    ? Colors.red
                                    : Colors.white,
                                size: 26,
                              ),
                              onPressed: () {
                                if (!myList.contains(currentMovie)) {
                                  context
                                      .read<MovieProvider>()
                                      .addToList(currentMovie);
                                } else {
                                  context
                                      .read<MovieProvider>()
                                      .removeFromList(currentMovie);
                                }
                              },
                            ),
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
