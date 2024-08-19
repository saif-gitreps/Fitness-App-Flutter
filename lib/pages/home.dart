import 'package:fitness/models/category_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModels> categories = [];

  void _getCategories() {
    categories = CategoryModels.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _searchBar(),
          const SizedBox(height: 40),
          Column(
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
                        mainAxisAlignment: MainAxisAlignment.center,
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
                              child: Text(categories[index].name,
                              ),
                            )
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
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
