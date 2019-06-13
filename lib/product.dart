import 'package:flutter/material.dart';
import 'package:yala_mazad/product_details.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  var product_list = [
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
      "price": 85
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
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.7),
        itemBuilder: (BuildContext context, int index) {
          return Single_product(
            product_name: product_list[index]['name'],
            product_pic: product_list[index]['picture'],
            old_price: product_list[index]['old price'],
            product_price: product_list[index]['price'],
          );
        });
  }
}

class Single_product extends StatelessWidget {
  final product_name;
  final product_pic;
  final old_price;
  final product_price;

  Single_product(
      {this.product_name,
      this.product_pic,
      this.old_price,
      this.product_price});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: buildProduct(context),
      onTap: () => Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => Product_details(
                //navigate to detailed page with passing data
                product_details_name: product_name,
                product_details_picture: product_pic,
                product_details_oldprice: old_price,
                product_details_price: product_price,
              ))),
    );
  }

  Widget buildProduct(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(10),
      child: Container(
        width: MediaQuery.of(context).size.width / 2.25,
        height: MediaQuery.of(context).size.height / 3,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Image.asset(
                    product_pic,
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width / 2.25,
                    height: MediaQuery.of(context).size.height / 2,
                  ),
                ],
              ),
              flex: 5,
            ),
            Expanded(
              child: ListTile(
                title: Text(product_name),
                subtitle: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text("\$${product_price}",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, color: Colors.red)),
                    ),
                    Expanded(
                      child: Text(
                        "\$${old_price}",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ),
                  ],
                ),
              ),
              flex: 2,
            )
          ],
        ),
      ),
    );
  }

}
