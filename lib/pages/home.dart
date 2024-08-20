import 'package:fitness/models/category_model.dart';
import 'package:fitness/models/diet_model.dart';
import 'package:fitness/models/popular_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModels> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];

  void _initialInfo() {
    categories = CategoryModels.getCategories();
    diets = DietModel.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _initialInfo();
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _searchBar(),
          const SizedBox(height: 40),
          _categoriesSection(),
          const SizedBox(height: 40),
          _dietSection(),
          const SizedBox(height: 40),
          _popularSection(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Column _popularSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Popular Meals',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 15),
            ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.only(
                  left:20,
                  right:20,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                           Image.asset(popularDiets[index].iconPath)
                      ,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(popularDiets[index].name,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600)
                            ),
                            Text(diets[index].level + ' | ' + diets[index].duration + ' | '+ diets[index].calorie,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600)
                            ),
                          ],
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 1),
                          blurRadius: 80,
                          spreadRadius: 0,
                        )
                      ]
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 20,
                ),
                itemCount: popularDiets.length
            )
          ],
        );
  }

  Column _dietSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Recommendation for Diet',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
                height: 250,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      width: 210,
                      decoration: BoxDecoration(
                        color: diets[index].boxColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(diets[index].iconPath ,height: 50, width: 60),
                          Text(diets[index].name,style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600)
                          ),
                          Text(diets[index].level + ' | ' + diets[index].duration + ' | '+ diets[index].calorie,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600)
                            ),
                          Container(
                            height: 45,
                            width: 140,
                            child: Center(
                              child: Text(
                                'view',
                                style: TextStyle(fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: diets[index].viewIsSelected ? Colors.grey : Colors.black,
                                )
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.amberAccent,
                              borderRadius: BorderRadius.circular(30)
                            ),

                          )
                        ],
                      )
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 25,),
                  itemCount: diets.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20
                  ),
              ),
            )
          ],
        );
  }

  Column _categoriesSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Category',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 120,
              color: Colors.white,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                padding: EdgeInsets.only(
                  left:20,
                  right:20
                ),
                separatorBuilder: (context, index) => SizedBox(
                  width: 25,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 70,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Center(
                            child: Image.asset(
                              categories[index].iconPath,
                              width: 20,
                              height: 20,
                            )
                          )
                        ),
                        Text(
                          categories[index].name,
                          style: TextStyle(
                            fontSize: 15
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
  }

  Container _searchBar() {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "Search",
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/icons/icons8-search-50.png', // Corrected asset path
              width: 24, // Adjust width and height as needed
              height: 24,
            ),
          ),
          suffixIcon: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Filter'),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text(
        'Breakfast',
        style: TextStyle(color: Colors.indigo),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () {
          // Handle back button tap
        },
        child: const Center(
          child: Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              'Back',
              style: TextStyle(color: Colors.indigo, fontSize: 16),
            ),
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            // Handle options tap
          },
          child: const Center(
            child: Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Text(
                'Options',
                style: TextStyle(color: Colors.indigo, fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
