import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/global_variables.dart';
import 'package:shoes_shopping_app/product_data.dart';
import 'package:shoes_shopping_app/product_detail_page.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});
  @override
  State<ShoppingPage> createState() => ShoppingpageState();
}

class ShoppingpageState extends State<ShoppingPage> {
  final List<String> filters = ['All', 'Nike', 'Bata', 'Adidas'];
  late String seletedfilter = filters[0];

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(165, 165, 165, 1)),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(40)),
    );
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Shoes\nCollection',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      focusedBorder: border,
                      enabledBorder: border,
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {});
                        seletedfilter = filter;
                      },
                      child: Chip(
                        backgroundColor:
                            seletedfilter == filter
                                ? Theme.of(context).colorScheme.primary
                                : Color.fromRGBO(245, 247, 249, 1),
                        label: Text(filter.toString()),
                        padding: EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 13,
                        ),
                        labelStyle: TextStyle(fontSize: 16),
                        side: const BorderSide(
                          color: Color.fromRGBO(245, 247, 249, 1),
                        ),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final productV = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProductDetailPage(product: productV);
                          },
                        ),
                      );
                    },
                    child: ProductData(
                      title: productV['title'].toString(),
                      price: productV['price'] as double,
                      image: productV['imageUrl'].toString(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
