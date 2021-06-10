import 'package:app_food/scr/models/category.dart';
import 'package:flutter/material.dart';

import '../helpers/style.dart';
import 'custom_text.dart';

List<Category> categoriesList = [
  Category(name: 'Salad', image: 'salad.png'),
  Category(name: 'Steak', image: 'steak.jpg'),
  Category(name: 'Fast food', image: 'sandwich.png'),
  Category(name: 'Deserts', image: 'ice-cream.png'),
  Category(name: 'Sea food', image: 'fish.jpg'),
  Category(name: 'Beer', image: 'pint.png')
];

class Categories extends StatefulWidget {
  const Categories({Key key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      child: ListView.builder(
        itemCount: categoriesList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red[50],
                        offset: Offset(4, 6),
                        blurRadius: 20,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Image.asset(
                      'images/${categoriesList[index].image}',
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                CustomText(
                  text: categoriesList[index].name,
                  size: 14,
                  color: black,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
