import 'package:botomyfluttertask/screens/authentication_screen.dart';
import 'package:botomyfluttertask/screens/cartpage.dart';
import 'package:botomyfluttertask/screens/homepage.dart';
import 'package:botomyfluttertask/sevive/providerclass.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => TaskProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:   Authentication(),
      ),
    );
  }
}
