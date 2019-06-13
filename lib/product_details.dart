import 'package:flutter/material.dart';
import 'package:yala_mazad/models/single_product.dart';

class ProductDetails extends StatefulWidget {
  final productDetailsName;
  final productDetailsOldPrice;
  final productDetailsNewPrice;
  final productDetailsPicture;

  ProductDetails(
      {this.productDetailsName,
      this.productDetailsPicture,
      this.productDetailsOldPrice,
      this.productDetailsNewPrice});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Back to Shopping"),
      ),
      body: ListView(
        children: <Widget>[
          buildProduct(),
          buildChoicesRow(),
          buildBuyRow(),
          Divider(),
          buildDescription(),
          Divider(),
        ],
      ),
    );
  }

  // TODO: Change text UI
  Widget buildProduct() {
    return Container(
      height: 200.0,
      child: GridTile(
        child: Container(
          color: Colors.white,
          child: Image.asset(
            widget.productDetailsPicture,
            fit: BoxFit.fitHeight,
          ),
        ),
        footer: Container(
          color: Colors.white,
          child: ListTile(
            leading: Text(widget.productDetailsName,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
            title: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "\$${widget.productDetailsOldPrice}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.lineThrough),
                  ),
                ),
                Expanded(
                  child: Text("\$${widget.productDetailsNewPrice}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          fontWeight: FontWeight.w800, color: Colors.red)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildChoicesRow() {
    return Container(
      color: Color(0xffe5e3e3),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: buildChoiceButton("Size"),
              margin: EdgeInsets.all(5),
            ),
            flex: 3,
          ),
          Expanded(
              child: Container(
                child: buildChoiceButton("Color"),
                margin: EdgeInsets.all(5),
              ),
              flex: 3),
          Expanded(
            child: Container(
              child: buildChoiceButton("Quantity"),
              margin: EdgeInsets.all(5),
            ),
            flex: 4,
          ),
        ],
      ),
    );
  }

  Widget buildChoiceButton(String text) {
    return MaterialButton(
      color: Colors.white,
      textColor: Colors.grey,
      elevation: 0.2,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            flex: 2,
          ),
          Expanded(child: Icon(Icons.arrow_drop_down))
        ],
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(text),
                content: Text("Choose the $text"),
                actions: <Widget>[
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop(context);
                    },
                    child: Text("close"),
                  )
                ],
              );
            });
      },
    );
  }

  Widget buildBuyRow() {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Row(
        children: <Widget>[
          Expanded(
              child: MaterialButton(
                  onPressed: () {},
                  color: Colors.pink,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: Text("Buy now"))),
          IconButton(
              icon: Icon(Icons.add_shopping_cart),
              color: Colors.pink,
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.favorite_border),
              color: Colors.pink,
              onPressed: () {})
        ],
      ),
    );
  }

  Widget buildDescription() {
    return ListTile(
      title: Text("${widget.productDetailsName} Details"),
      subtitle: Text(
          "A very valuable item that will surly stun anyone who look at it, Give it a try. The sure thing is that you won't regret it."),
    );
  }
}
