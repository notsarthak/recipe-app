import "package:flutter/material.dart";

class MainDrawer extends StatelessWidget {
  Widget listTileBuilder(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: "RobotoCondensed",
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(20),
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          listTileBuilder(Icons.restaurant, "Meals"),
          listTileBuilder(Icons.filter_alt_sharp, "Filters"),
        ],
      ),
    );
  }
}
