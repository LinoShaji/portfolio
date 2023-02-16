import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCarousel extends StatefulWidget {
  const MyCarousel({Key? key}) : super(key: key);

  @override
  State<MyCarousel> createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  double Height = 100;
  @override
  Widget build(BuildContext context) {
    return  CarouselSlider(
        items: [
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            alignment: Alignment.center,
            child: Text("data"),
            height: Height,
            color: Colors.amber,
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            alignment: Alignment.center,
            child: Text("data"),
            height: Height,
            color: Colors.black45,
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            alignment: Alignment.center,
            child: Text("data"),
            height: Height,
            color: Colors.pinkAccent,
          )
        ],
        options: CarouselOptions(
            height: 400,
            animateToClosest: true,
            autoPlay: true,
            enlargeCenterPage: true,
            autoPlayCurve: Curves.easeInOutCubicEmphasized));
  }
}
