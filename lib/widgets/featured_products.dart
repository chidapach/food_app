import 'package:flutter/material.dart';
import 'package:foods/helpers/screen_navigation.dart';
import 'package:foods/models/products.dart';
import 'package:foods/screens/details.dart';

import '../helpers/style.dart';
import 'custom_text.dart';

List<Product> productsList = [
  Product(
      name: "Cereals",
      price: 5.99,
      rating: 4.2,
      vendor: "GoodFood",
      wishList: true,
      image: "2.png"),
  Product(
      name: "Taccos",
      price: 5.99,
      rating: 4.7,
      vendor: "GoodFood",
      wishList: false,
      image: "5.png"),
  Product(
      name: "Cereals",
      price: 5.99,
      rating: 4.2,
      vendor: "GoodFood",
      wishList: true,
      image: "1.png"),
];

class Featured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productsList.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  changeScreen(_ , Details(product: productsList[index],));
                },
                child: Container(
                  height: 240,
                  width: 200,
                  decoration: BoxDecoration(color: white, boxShadow: [
                    BoxShadow(color: grey, offset: Offset(1, 1), blurRadius: 4)
                  ]),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        "images/${productsList[index].image}",
                        height: 140,
                        width: 140,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(
                              text: productsList[index].name,
                              color: black,
                              size: 14,
                              weight: FontWeight.normal,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: grey,
                                        offset: Offset(1, 1),
                                        blurRadius: 4)
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: productsList[index].wishList
                                    ? Icon(
                                        Icons.favorite,
                                        color: red,
                                        size: 18,
                                      )
                                    : Icon(
                                        Icons.favorite_border,
                                        color: red,
                                        size: 18,
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: CustomText(
                                  text: productsList[index].rating.toString(),
                                  color: grey,
                                  size: 14,
                                  weight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Icon(
                                Icons.star,
                                color: red,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: red,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: red,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: red,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: grey,
                                size: 16,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: CustomText(
                              text: "\$${productsList[index].price}",
                              color: black,
                              size: 16,
                              weight: FontWeight.bold,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
