import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shopping_app/cart_provider.dart';
import 'package:shoes_shopping_app/global_variables.dart';

class AddToCartPage extends StatelessWidget {
  const AddToCartPage({super.key});
  @override
  Widget build(BuildContext context) {
    final cartListD = context.watch<CartProvider>().productL;
    return ListView.builder(
      itemCount: cartListD.length,
      itemBuilder: (context, index) {
        final cartItem = cartListD[index];
        return ListTile(
          title: Text(cartItem['title'].toString()),

          subtitle: Text(cartItem['size'].toString()),
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(cartItem['imageUrl'].toString()),
          ),
        );
      },
    );
  }
}
