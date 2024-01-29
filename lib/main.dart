import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/appbar_provider.dart';
import 'package:myapp/home.dart';
import 'package:provider/provider.dart';
import 'package:myapp/splash_screen.dart';
void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const HomeScreen(),
    const SplashScreen(),
  ];

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<AppProvider>(
      create: (context) => AppProvider(),
      builder: (context, _) {
        final appProvider = Provider.of<AppProvider>(context);
        return MaterialApp(
          darkTheme: ThemeData.dark(),
          title: 'My Flutter App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.white30,
          ),
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Jr img Scan',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
              backgroundColor: appProvider.appColor,
            ),
            body: _children[_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: onTabTapped,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.orange),
                  label: 'Accueil',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.exit_to_app, color: Colors.blue),
                  label: 'exit',
                ),
              ],
            ),
          ),
        );
      });

 void onTabTapped(int index) {
    if (index == 1) {
      exit(0);
    }
  }
}
