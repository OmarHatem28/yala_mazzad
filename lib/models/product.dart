import 'package:flutter/material.dart';
import 'package:yala_mazad/models/single_product.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  var productList = [
    {
      "name": "Women Bag",
      "picture": "img/products/womenbag.png",
      "old price": 120,
      "price": 85.99
    },
    {
      "name": "Blazzer1",
      "picture": "img/products/blazer1.jpeg",
      "old price": 120,
      "price": 85
    },
    {
      "name": "Blazzer2",
      "picture": "img/products/blazer2.jpeg",
      "old price": 120,
      "price": 85
    },
    {
      "name": "Red Dress",
      "picture": "img/products/dress1.jpeg",
      "old price": 120,
      "price": 85
    },
    {
      "name": "Dress",
      "picture": "img/products/dress2.jpeg",
      "old price": 120,
      "price": 85.99
    },
    {
      "name": "Hills",
      "picture": "img/products/hills1.jpeg",
      "old price": 120,
      "price": 85
    },
    {
      "name": "Hills",
      "picture": "img/products/hills2.jpeg",
      "old price": 120,
      "price": 85
    },
    {
      "name": "Panet",
      "picture": "img/products/pants2.jpeg",
      "old price": 120,
      "price": 85
    },
    {
      "name": "SKT",
      "picture": "img/products/skt1.jpeg",
      "old price": 120,
      "price": 85
    },
    {
      "name": "SKT",
      "picture": "img/products/skt1.jpeg",
      "old price": 120,
      "price": 85
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.7),
        itemBuilder: (BuildContext context, int index) {
          return SingleProduct(
            productName: productList[index]['name'],
            productPicture: productList[index]['picture'],
            productOldPrice: productList[index]['old price'],
            productPrice: productList[index]['price'],
          );
        });
  }
}
