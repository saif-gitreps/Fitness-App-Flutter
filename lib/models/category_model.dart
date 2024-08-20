import 'package:flutter/material.dart';

class CategoryModels {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModels({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModels> getCategories() {
    List<CategoryModels> categories = [];

    categories.add(
        CategoryModels(name:"Cake", iconPath:"/icons/strawberry-cake.png", boxColor: Colors.green)
    );
    categories.add(
        CategoryModels(name:"Pancake", iconPath:"/icons/pancakes.png", boxColor: Colors.blue)
    );
    categories.add(
        CategoryModels(name:"Juice", iconPath:"/icons/orange-juice.png", boxColor: Colors.red)
    );
    categories.add(
        CategoryModels(name:"Jam", iconPath:"/icons/jam.png", boxColor: Colors.purple)
    );


    return categories;
  }
}