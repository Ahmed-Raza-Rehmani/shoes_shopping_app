import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shopping_app/cart_provider.dart';

class AddToCartPage extends StatelessWidget {
  const AddToCartPage({super.key});
  @override
  Widget build(BuildContext context) {
    final ProductC = context.watch<CartProvider>().productL;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cart', style: Theme.of(context).textTheme.titleLarge),
      ),

      body: ListView.builder(
        itemCount: ProductC.length,
        itemBuilder: (context, index) {
          final cartItem = ProductC[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(cartItem['imageUrl'].toString()),
            ),
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.titleMedium,
            ),

            subtitle: Text(
              ('size  ${cartItem['size']}').toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            trailing: IconButton(
              onPressed: () {
                Provider.of<CartProvider>(
                  context,
                  listen: false,
                ).removeProduct(cartItem);
              },
              icon: const Icon(Icons.delete),
            ),
          );
        },
      ),
    );
  }
}
