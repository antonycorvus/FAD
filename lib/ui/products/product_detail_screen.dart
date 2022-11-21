import 'package:flutter/material.dart';
import '../../models/product.dart';

class ProductDetailScreen extends StatelessWidget{
  static const routeName = '/product-detail';
  const ProductDetailScreen(
    this.product, {
      super.key,
    }
  );

  final Product product;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 6),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Giá thành: \$${product.price}",
              style: const TextStyle(
                color: Color.fromARGB(255, 240, 40, 40),
                fontSize: 26,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal:35, vertical: 10),
              width: double.infinity,
              child: Text(
                product.description,
                textAlign: TextAlign.left,
                softWrap: true,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontFamily: "Times New Roman",
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
