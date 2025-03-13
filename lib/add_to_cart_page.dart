import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/global_variables.dart';

class AddToCartPage extends StatelessWidget {
  const AddToCartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cart.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(cart['title'].toString()),

          subtitle: Text(cart['size'].toString()),
          leading: CircleAvatar(
            backgroundImage: AssetImage(cart['imageUrl'].toString()),
          ),
        );
      },
    );
  }
}
