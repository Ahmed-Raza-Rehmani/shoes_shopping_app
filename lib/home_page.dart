import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/add_to_cart_page.dart';
import 'package:shoes_shopping_app/shopping_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  List<Widget> pages = const [ShoppingPage(), AddToCartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentPage, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        currentIndex: currentPage,
        onTap: (value) {
          currentPage = value;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(label: '', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: '', icon: Icon(Icons.shopping_cart)),
        ],
      ),
    );
  }
}
