import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/cart_provider.dart';
import 'package:shoes_shopping_app/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        theme: ThemeData(
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            titleMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            bodyLarge: TextStyle(fontSize: 25),
            bodyMedium: TextStyle(fontSize: 20),
            bodySmall: TextStyle(fontSize: 18),
          ),
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(254, 206, 1, 1),
            primary: const Color.fromRGBO(254, 206, 1, 1),
          ),
        ),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
