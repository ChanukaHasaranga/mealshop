import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:mealshop/cartmodel.dart';
import 'package:mealshop/login.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 runApp(ChangeNotifierProvider(
  create: (context) =>CartModel(),
  
  child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MealApp",
      home: const login(),
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}
