import 'package:carousel_slider/carousel_slider.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/androidProjects.dart';
import 'package:portfolio/asset/WebProjects.dart';

class MyCarousel extends StatefulWidget {
  const MyCarousel({Key? key}) : super(key: key);

  @override
  State<MyCarousel> createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  bool Windows = true;

  void yesAndroid() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      setState(() {
        Windows = false;
      });
    } else if (defaultTargetPlatform == TargetPlatform.windows) {
      setState(() {
        Windows = true;
      });
    }
  }

  final double NormalHeight = 400;
  final double Normalwidth = 350;
  final double ShrinkHeight = 430;
  final double ShrinkWidth = 100;

  @override
  Widget build(BuildContext context) {
    yesAndroid();
    return Container(
      width: MediaQuery.of(context).size.width < 800 ? 300 : 900,
      //width: MediaQuery.of(context).size.width,
      child: CarouselSlider(
          items: [
            Container(
              decoration: BoxDecoration(
                  color: Color(0xff101418).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.only(left: 03, right: 03),
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.width < 800
                  ? ShrinkHeight
                  : NormalHeight,
              width: MediaQuery.of(context).size.width < 800
                  ? ShrinkWidth
                  : Normalwidth,
              child: Column(children: [
                const CarouselContainer(
                    flex: 2,
                    text: "ANDROID",
                    images: 'lib/asset/images/androidBackground.png',
                    Colour: Colors.black),
                Container(
                    margin: const EdgeInsets.all(15),
                    child: const Text(
                      "Android app development using Flutter",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: const Color(0xffF5EDCE),
                        borderRadius: BorderRadius.circular(15)),
                    margin: const EdgeInsets.all(10),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return ScaleTransition(
                                      scale: Tween<double>(begin: 0.1, end: 1)
                                          .animate(
                                        CurvedAnimation(
                                          parent: animation,
                                          curve:
                                              Curves.easeInOutCubicEmphasized,
                                        ),
                                      ),
                                      child: child,
                                    );
                                  },
                                  transitionDuration:
                                      Duration(milliseconds: 800),
                                  pageBuilder: (BuildContext context,
                                      Animation<double> animation,
                                      Animation<double> secondaryAnimation) {
                                    return AndroidProjects();
                                  }));
                        },
                        child: const Text(
                          "VIEW PROJECT",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                )
              ]),
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xff101418).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.only(left: 03, right: 03),
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.width < 800
                  ? ShrinkHeight
                  : NormalHeight,
              width: MediaQuery.of(context).size.width < 800
                  ? ShrinkWidth
                  : Normalwidth,
              child: Column(children: [
                const CarouselContainer(
                    flex: 2,
                    text: "WEB",
                    images: 'lib/asset/images/androidBackground.png',
                    Colour: Colors.black),
                Container(
                    margin: const EdgeInsets.all(15),
                    child: const Text(
                      "Web app development designing and development",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: const Color(0xffF5EDCE),
                        borderRadius: BorderRadius.circular(15)),
                    margin: EdgeInsets.all(10),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (conatext) => WebProjects()));
                        },
                        child: const Text(
                          "VIEW PROJECT",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                )
              ]),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xff101418).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.only(left: 03, right: 03),
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.width < 800
                  ? ShrinkHeight
                  : NormalHeight,
              width: MediaQuery.of(context).size.width < 800
                  ? ShrinkWidth
                  : Normalwidth,
              child: Column(children: [
                const CarouselContainer(
                    flex: 2,
                    text: "BRAND IDENTITY",
                    images: 'lib/asset/images/androidBackground.png',
                    Colour: Colors.black,
                    textsize: 25),
                Container(
                    margin: EdgeInsets.all(15),
                    child: Text(
                      "Design custom logo's, posters, product covers and all related stuffs",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: const Color(0xffF5EDCE),
                        borderRadius: BorderRadius.circular(15)),
                    margin: EdgeInsets.all(10),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "VIEW DESIGNS",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                )
              ]),
            )
          ],
          options: CarouselOptions(
            scrollDirection: MediaQuery.of(context).size.width < 800
                ? Axis.vertical
                : Axis.horizontal,
            pageSnapping: true,
            viewportFraction:
                MediaQuery.of(context).size.width < 800 ? 0.9 : 0.25,
            aspectRatio: 18 / 9,
            disableCenter: true,
            height: MediaQuery.of(context).size.width < 800
                ? ShrinkHeight
                : NormalHeight,
            animateToClosest: true,
            autoPlay: true,
            enlargeCenterPage: true,
            autoPlayCurve: Curves.easeInOutCubicEmphasized,
            autoPlayAnimationDuration: Duration(milliseconds: 1000),
            //Curves.easeInOutSine.flipped
            // autoPlayCurve: Curves.easeInOutCubicEmphasized),
          )),
    );
  }
}

class CarouselContainer extends StatelessWidget {
  final int flex;
  final String text;
  final String images;
  final Color Colour;
  final double textsize;

  const CarouselContainer(
      {super.key,
      required this.flex,
      required this.text,
      required this.images,
      required this.Colour,
      this.textsize = 30});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(13),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(images), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20)),
        child: Text(text,
            style: TextStyle(
                fontSize: textsize,
                fontWeight: FontWeight.w500,
                color: Colour)),
        //
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({
    super.key,
    required this.ShrinkHeight,
    required this.NormalHeight,
    required this.ShrinkWidth,
    required this.Normalwidth,
  });

  final double ShrinkHeight;
  final double NormalHeight;
  final double ShrinkWidth;
  final double Normalwidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 03, right: 03),
      alignment: Alignment.center,
      child: Text("data"),
      height:
          MediaQuery.of(context).size.width < 800 ? ShrinkHeight : NormalHeight,
      width:
          MediaQuery.of(context).size.width < 800 ? ShrinkWidth : Normalwidth,
      decoration: BoxDecoration(
          color: Colors.black45, borderRadius: BorderRadius.circular(15)),
    );
  }
}
