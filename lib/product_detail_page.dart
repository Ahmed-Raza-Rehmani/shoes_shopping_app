import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shopping_app/cart_provider.dart';
import 'package:shoes_shopping_app/global_variables.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  int selectedsize = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Details', style: Theme.of(context).textTheme.bodyLarge),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              widget.product['title'].toString(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Spacer(flex: 1),
            Image.asset(widget.product['imageUrl'].toString(), height: 250),
            Spacer(flex: 2),
            Container(
              height: 200,
              color: Color.fromRGBO(216, 240, 253, 1),
              child: Column(
                children: [
                  Text(
                    '\$22.4',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['sizes'] as List<int>).length,
                      itemBuilder: (context, index) {
                        final sizeV =
                            (widget.product['sizes'] as List<int>)[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {});
                              selectedsize = sizeV;
                            },
                            child: Chip(
                              backgroundColor:
                                  selectedsize == sizeV
                                      ? Theme.of(context).colorScheme.primary
                                      : Colors.white,
                              label: Text(sizeV.toString()),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 8,
                    ),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Provider.of<CartProvider>(
                          context,
                          listen: false,
                        ).addProduct({
                          'id': widget.product['id'],
                          'title': widget.product['title'],
                          'price': widget.product['price'],
                          'imageUrl': widget.product['imageUrl'],
                          'company': widget.product['company'],
                          'size': selectedsize,
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        minimumSize: Size(double.infinity, 44),
                      ),
                      icon: Icon(Icons.shopping_cart, color: Colors.black),

                      label: Text(
                        'Add To Cart',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
