import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DetailsPage extends StatelessWidget {
  final String img;
  final String title;
  final String price;
  final BuildContext context;

  DetailsPage(
      {required this.img,
      required this.title,
      required this.price,
      required this.context});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text(title),
        Text(img),
        Text(price),
      ]
    ),);
  }
}
