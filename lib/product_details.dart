import 'package:flutter/material.dart';

class Product_details extends StatefulWidget {

  final product_details_name;
  final product_details_oldprice;
  final product_details_price;
  final product_details_picture;

  Product_details({
    this.product_details_name,
    this.product_details_picture,
    this.product_details_oldprice,
    this.product_details_price

  });




  @override
  _Product_detailsState createState() => _Product_detailsState();
}

class _Product_detailsState extends State<Product_details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: Text("Back to Shopping"),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: null),
        ],
      ),

      //-----------------------------------------------------------Received passed data from Home page -------------------------
      body: ListView(
        children: <Widget>[
          new Container(
            height: 200.0,
              child: GridTile(
                  child: Container(
                color:Colors.white,
                child: Image.asset(widget.product_details_picture, fit: BoxFit.fitHeight,),
              ),
                footer: new Container(

                  color:Colors.white,
                  child: ListTile(
                    leading: new Text(widget.product_details_name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),

                    title: Row(
                      children: <Widget>[
                        Expanded(child: Text(
                          "\$${widget.product_details_oldprice}",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.lineThrough),
                        ),
                        ),

                        Expanded(child: Text("\$${widget.product_details_price}",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, color: Colors.red)),
                        ),
                      ],
                    ),
                  ),

                ),
              ),
          ),

          //-----------------------------------------------------------------------------------------------------------


          //----------------------------------Buttons size , color , Qty-------------------------------------------------

          Row(
            children: <Widget>[
              Expanded(child: MaterialButton(onPressed: (){

                showDialog(context: context,
                builder: (context){
                  return new AlertDialog(
                  title: new Text("Size"),
                  content: new Text("Choose the size"),
                  actions: <Widget>[
                    new MaterialButton(onPressed:(){
                      Navigator.of(context).pop(context);
                  },

                  child: new Text("close"),

                  )
                  ],

                  );
                }
                );
              },
              color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,

                child: Row(
                  children: <Widget>[
                    Expanded(child: new Text("size")),
                    Expanded(child: new Icon(Icons.arrow_drop_down))
                  ],
                ),

              )),
              Expanded(child: MaterialButton(onPressed: (){

                showDialog(context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text("Color"),
                        content: new Text("Choose the color"),
                        actions: <Widget>[
                          new MaterialButton(onPressed:(){
                            Navigator.of(context).pop(context);
                          },

                            child: new Text("close"),

                          )
                        ],

                      );
                    }
                );
              },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,

                child: Row(
                  children: <Widget>[
                    Expanded(child: new Text("Color")),
                    Expanded(child: new Icon(Icons.arrow_drop_down))
                  ],
                ),

              )),
              Expanded(child: MaterialButton(onPressed: (){

                showDialog(context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text("Quantity"),
                        content: new Text("Choose the Quantity  "),
                        actions: <Widget>[
                          new MaterialButton(onPressed:(){
                            Navigator.of(context).pop(context);
                          },

                            child: new Text("close"),

                          )
                        ],

                      );
                    }
                );
              },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,

                child: Row(
                  children: <Widget>[
                    Expanded(child: new Text("Qty")),
                    Expanded(child: new Icon(Icons.arrow_drop_down))
                  ],
                ),

              ))
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: MaterialButton(
                onPressed: (){},
                color: Colors.pink,
                textColor: Colors.white,
                elevation: 0.2,
                child: new Text("Buy now")

              )
              ),
              new IconButton(icon: Icon(Icons.add_shopping_cart) ,color: Colors.pink, onPressed: (){}),
              new IconButton(icon: Icon(Icons.favorite_border) ,color: Colors.pink, onPressed: (){})

            ],
          ),

          //-----------------------------------------------------------------------------------------------------

            Divider(),
          //-------------------------------------------- Product Description ----------------------------------------------
            new ListTile(
              title: new Text("Product Details"),
              subtitle: new Text("s;fjlsjeflejfknkshfksfhhsfjkshlshfkfhls"),

            ),
          Divider(),





        ],
      ),
    );
  }
}

