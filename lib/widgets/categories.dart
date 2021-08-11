import 'package:flutter/material.dart';
import 'package:foods/models/category.dart';
import 'package:foods/widgets/custom_text.dart';

import '../helpers/style.dart';

List<Category> categoriesList = [
  Category(name: "Salad",image: "salad.png"),
  Category(name: "Steak",image: "steak.png"),
  Category(name: "Fast food",image: "sandwich.png"),
  Category(name: "Deserts",image: "ice-cream.png"),
  Category(name: "Sea food",image: "seafood.png"),
  Category(name: "Beer",image: "pint.png"),
];

class Categories extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoriesList.length,
                itemBuilder: (_, index) {
                  return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget> [
                      Container(
                        decoration: BoxDecoration(
                        color: white,
                        // boxShadow: [
                        //  BoxShadow(
                        //   color: red.withAlpha(50) ,
                        //   offset: Offset(4,36),
                        //   blurRadius: 50,
                          
                        //   )
                        //  ],
                        ),
                      child: Padding(padding: EdgeInsets.all(4), 
                      child: Image.asset("images/${categoriesList[index].image}", width: 50,),
                        )
                      ),
                      SizedBox(height: 10,),
                      CustomText(text: categoriesList[index].name, size: 14, color: black, weight: FontWeight.normal ),
                    ],
                  ),
                );
                } ,
              ),
            );
  }
}