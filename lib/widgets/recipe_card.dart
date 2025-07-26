import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.local_pizza_outlined),
            title: Text("Name of recipe"),
            subtitle: Text("short description"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(onPressed: null, child: Text("Read more")),
              IconButton(onPressed: null, icon: Icon(Icons.favorite_border)),
            ],
          )
        ],
      ),
    );
  }
}
