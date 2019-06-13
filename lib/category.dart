import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:yala_mazad/Product.dart';

class Category extends StatefulWidget {
  final String title;

  const Category({Key key, this.title}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: buildSwiper(),
            flex: 2,
          ),
          Expanded(
            child: buildSubcategories(),
            flex: 1,
          ),
          Expanded(
            child: Container(
              child: Product(),
            ),
            flex: 4,
          )
        ],
      ),
    );
  }

  Widget buildSubcategories() {
    return Container(
//      height: MediaQuery.of(context).size.height / 8,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          buildSingleSubcategory(
            imgLocation: "img/cats/tshirt.png",
            imgCaption: "T shirt",
          ),
          buildSingleSubcategory(
            imgLocation: "img/cats/shoe.png",
            imgCaption: "Shoes",
          ),
          buildSingleSubcategory(
            imgLocation: "img/cats/jeans.png",
            imgCaption: "Jeans",
          ),
          buildSingleSubcategory(
            imgLocation: "img/cats/informal.png",
            imgCaption: "Informal",
          ),
          buildSingleSubcategory(
            imgLocation: "img/cats/formal.png",
            imgCaption: "Formal",
          ),
          buildSingleSubcategory(
            imgLocation: "img/cats/dress.png",
            imgCaption: "Dress",
          ),
          buildSingleSubcategory(
            imgLocation: "img/cats/accessories.png",
            imgCaption: "Accessories",
          ),
        ],
      ),
    );
  }

  Widget buildSingleSubcategory({String imgLocation, String imgCaption}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        splashColor: Colors.lightBlueAccent,
        onTap: () {},
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Column(
            children: <Widget>[
              Image.asset(
                imgLocation,
                scale: 3.5,
              ),
              Text(
                imgCaption,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSwiper() {
    List<String> imgs = [
      'img/c1.jpg',
      'img/m1.jpeg',
      'img/m2.jpg',
      'img/w1.jpeg',
      'img/w3.jpeg',
      'img/w4.jpeg',
    ];

    return Swiper(
      outer: false,
      itemBuilder: (context, i) {
        return Image.asset(imgs[i], fit: BoxFit.cover,);
      },
      autoplay: true,
      duration: 300,
      pagination: new SwiperPagination(margin: new EdgeInsets.all(5.0)),
      itemCount: imgs.length,
    );
  }

  Widget buildImgCarousel() {
    return Container(
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('img/c1.jpg'),
          AssetImage('img/m1.jpeg'),
          AssetImage('img/m2.jpg'),
          AssetImage('img/w1.jpeg'),
          AssetImage('img/w3.jpeg'),
          AssetImage('img/w4.jpeg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 5.0,
        indicatorBgPadding: 2.0,
        // dotColor: Colors.blue,
      ),
    );
  }
}
