import 'package:flutter/material.dart';
import 'package:third_exam/ui/Navigation_bar/navigation_bar.dart';
import 'package:third_exam/ui/route.dart';
import 'package:third_exam/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Imtixon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NavBar(),
      initialRoute: tabsRoute,
      onGenerateRoute: MyRouter.generateRoute,
    );
  }
}

