import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.name, required this.description});
  final String name;
  final String description;

  String getName(){
    return name;
  }
  

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
           ListTile(
            leading: Icon(Icons.local_pizza_outlined),
            title: Text(name),
            subtitle: Text(description),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(onPressed: null, child: Text("Read more")),
              IconButton(onPressed: null, icon: Icon(Icons.favorite_border)),
            ],
          ),
        ],
      ),
    );
  }
}
