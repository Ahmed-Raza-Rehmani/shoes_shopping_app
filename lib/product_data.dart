import 'package:flutter/material.dart';

class ProductData extends StatelessWidget {
  final String title;
  final double price;
  final String image;

  const ProductData({
    super.key,
    required this.title,
    required this.price,
    required this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Color.fromRGBO(216, 240, 253, 1),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: 5),
          Text(price.toString(), style: Theme.of(context).textTheme.titleSmall),
          SizedBox(height: 5),

          Center(child: Image.asset(image, height: 175)),
        ],
      ),
    );
  }
}
