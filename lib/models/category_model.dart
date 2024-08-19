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
        CategoryModels(name:"Cake", iconPath:"/", boxColor: Colors.green)
    );
    categories.add(
        CategoryModels(name:"Pancake", iconPath:"/", boxColor: Colors.blue)
    );
    categories.add(
        CategoryModels(name:"Juice", iconPath:"/", boxColor: Colors.red)
    );
    categories.add(
        CategoryModels(name:"Jelly", iconPath:"/", boxColor: Colors.purple)
    );


    return categories;
  }
}