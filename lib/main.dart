import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'StateManagement/provider/movie_provider.dart';
import 'homePage.dart';

void main() {
  runApp(ChangeNotifierProvider<MovieProvider>(
      child: MyApp(), create: (_) => MovieProvider()));
}

class MyApp extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alert Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: navigatorKey,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            PopupMenuButton(
                color: Colors.lightBlueAccent.shade100,
                onSelected: (int menu) {
                  if (menu == 1) {
                    print(
                        'ok'); //navigatorKey.currentState.push(MaterialPageRoute())
                  }
                },
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
        body: HomePage(),
      ),
    );
  }
}
