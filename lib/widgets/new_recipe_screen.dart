import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class NewRecipeScreen extends StatelessWidget {
  static final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(20),
      child: FormBuilder(
      key: _formKey,
      child: ListView(
        children: [
          Container(padding: EdgeInsets.all(5) ,child: FormBuilderTextField(name: "Name", keyboardType: TextInputType.multiline,maxLines: null, decoration: InputDecoration(hintText: "Name of the Dish", border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4.0)))))),

          Container(padding: EdgeInsets.all(5) ,child: FormBuilderTextField(name: "Description", keyboardType: TextInputType.multiline,maxLines: null, minLines: 2, decoration: InputDecoration(hintText: "Short Description", border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4.0)))))),

          Container(padding: EdgeInsets.all(5) ,child: FormBuilderTextField(name: "Ingredients", keyboardType: TextInputType.multiline,maxLines: null, minLines: 4, decoration: InputDecoration(hintText: "Ingridents", border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4.0)))))),
          
          Container(padding: EdgeInsets.all(5) ,child:FormBuilderTextField(name: "Steps", keyboardType: TextInputType.multiline,maxLines: null, minLines: 4, decoration: InputDecoration(hintText: "Steps", border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4.0)))))),
          
          Container(
            padding: EdgeInsets.all(5),
            child: Row(children: [
              Expanded(child: FormBuilderCheckbox(name: "Vegan", title: Text("Vegan"))),
              Expanded(child: FormBuilderCheckbox(name: "Vegetarian", title: Text("Vegetarian"))),
              Expanded(child: FormBuilderCheckbox(name: "Gluten", title: Text("Gluten Free")))
            ],)),
            ElevatedButton(onPressed: null, child: Text("Save"))
          
        ],
        
      )));
  }
}
