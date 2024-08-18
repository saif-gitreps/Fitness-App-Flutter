import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _searchBar(),
          SizedBox(height: 40,),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:20),
                child: Text(
                  'Category',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),
                ),
              )
            ],
          )
        ],
      )
    );
  }

  Container _searchBar() {
    return Container(
          margin: EdgeInsets.only(top: 10, left: 20, right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0
              )
            ]
          ),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Search",
              prefixIcon: Padding(padding: const EdgeInsets.all(8.0),
                  child: Image.asset('/icons/icons8-search-50.png',
                  width: 5,
                  height: 2,
                )
              ),
              suffixIcon:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Filter')
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              )
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
            // Handle actions tap
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
