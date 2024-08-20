import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool viewIsSelected;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxColor,
    required this.viewIsSelected
  });

  static List < DietModel > getDiets() {
    List < DietModel > diets = [];

    diets.add(
        DietModel(
            name: 'Chicken',
            iconPath: '/icons/chicken-leg.png',
            level: 'Easy',
            duration: '30mins',
            calorie: '180kCal',
            viewIsSelected: true,
            boxColor: Color(0xff9DCEFF)
        )
    );

    diets.add(
        DietModel(
            name: 'Salmon',
            iconPath: '/icons/salmon.png',
            level: 'Easy',
            duration: '20mins',
            calorie: '230kCal',
            viewIsSelected: false,
            boxColor: Color(0xffEEA4CE)
        )
    );

    return diets;
  }
}