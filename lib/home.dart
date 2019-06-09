import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List colors = [Colors.red, Colors.green, Colors.yellow, Colors.blue, Colors.tealAccent, Colors.indigo, Colors.yellow];
    Random random = new Random();

    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),),
      drawer: buildDrawer(),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this would produce 2 rows.
        crossAxisCount: 2,
        // Generate 100 Widgets that display their index in the List
        children: List.generate(100, (index) {
          int rand = random.nextInt(7);
          return Card(
            child: Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline,
              ),
            ),
            elevation: 16,
            color: colors[rand],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            margin: EdgeInsets.all(10),
          );
        }),
      ),
    );
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
                title: new Text('Are you sure?'),
                content: new Text('Do you want to exit an App'),
                actions: <Widget>[
                  new FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: new Text('No'),
                  ),
                  new FlatButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: new Text('Yes'),
                  ),
                ],
              ),
        ) ??
        false;
  }

  Widget buildDrawer() {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
//              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("img/mazzad.png"))),
            accountName: Text("Omar Hatem"),
            accountEmail: Text("Omar@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("img/mazzad.png"),
              radius: 50,
            ),
          ),
          buildSeparators("Categories"),
          buildTile("Art", "/art", Icon(Icons.art_track)),
          buildTile("Furniture", "/furniture", Icon(Icons.home)),
          Divider(),
          buildSeparators("Credentials"),
          buildTile("Login", "/login", Icon(Icons.email)),
          buildTile("SignUp", "/signUp", Icon(Icons.favorite)),
          Divider(),
          buildSeparators("Support"),
          buildTile("Feedback", "/feedback", Icon(Icons.feedback)),
        ],
      ),
    );
  }

  Widget buildSeparators(String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left: 10)),
        Text(
          name,
          style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ],
    );
  }

  Widget buildTile(String name, String path, Icon icon) {
    return ListTile(
      leading: icon,
      title: Text(name),
      onTap: () => Navigator.pushNamed(context, path),
    );
  }
}
