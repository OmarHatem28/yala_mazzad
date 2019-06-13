import 'package:flutter/material.dart';
import 'package:yala_mazad/product_details.dart';

class SingleProduct extends StatelessWidget {
  final productName;
  final productPicture;
  final productOldPrice;
  final productPrice;

  SingleProduct(
      {this.productName,
      this.productPicture,
      this.productOldPrice,
      this.productPrice});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: buildProduct(context),
      onTap: () => Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => ProductDetails(
                    //navigate to detailed page with passing data
                    productDetailsName: productName,
                    productDetailsPicture: productPicture,
                    productDetailsOldPrice: productOldPrice,
                    productDetailsNewPrice: productPrice,
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
                    productPicture,
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
                title: Text(
                  productName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text("\$$productPrice",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.w800, color: Colors.red)),
                    ),
                    Expanded(
                      child: Text(
                        "\$$productOldPrice",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
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
