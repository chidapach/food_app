import 'package:flutter/material.dart';
import 'package:foods/widgets/custom_text.dart';

import '../helpers/style.dart';

class BottomNavIcon extends StatelessWidget {
  final String image;
  final String name;
  final Function onTap;

  const BottomNavIcon({Key? key,required this.image,required this.name,required this.onTap}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: onTap() ?? null,
                  child: Column(
                    children: [
                      Image.asset(
                        "images/$image",
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomText(text: name, color: black, size: 14, weight: FontWeight.normal, )
                    ],
                  ),
                ),
    );
  }
}