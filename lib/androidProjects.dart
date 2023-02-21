import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AndroidProjects extends StatefulWidget {
  const AndroidProjects({Key? key}) : super(key: key);

  @override
  State<AndroidProjects> createState() => _AndroidProjectsState();
}

class _AndroidProjectsState extends State<AndroidProjects> {
  final Uri _Dblood = Uri.parse('https://github.com/LinoShaji/D-Blood');
  final Uri _Ltaxi = Uri.parse('https://github.com/LinoShaji/Locate-your-Taxi');
  final Uri _Adhkar = Uri.parse('https://github.com/pilgrimfathers/adkarApp');
  final _key = GlobalKey<ScaffoldState>();
  Future<void> _launchUrlAdhkar()async{
    if(!await launchUrl(_Adhkar)){throw Exception('Could not launch');}
  }
  Future<void> _launchUrlDblood() async {
    if (!await launchUrl(_Dblood)) {
      throw Exception('Could not lauch');
    }
  }

  Future<void> _lauchUrlLtaxi() async {
    if (!await launchUrl(_Ltaxi)) {
      throw Exception('Could not lauch');
    }
  }
  double adhkarop = 0;
  double Ltaxiop = 0;
  double Dop = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: CarouselSlider(
            items: [
              MouseRegion(onEnter: (a){setState(() {
                adhkarop = 1;
              });},
                onExit: (a){setState(() {
                  adhkarop = 0;
                });},
                child: InkWell(
                  hoverColor: Colors.black45.withOpacity(0.1),
                  onTap: (){_launchUrlAdhkar();},
                  child: Stack(
                    children: [Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("lib/asset/images/ADKARNEW.png")))),
                      AnimatedOpacity(opacity: adhkarop,
                      duration: Duration(milliseconds: 500),
                      child: Container(alignment: Alignment.center,child: Text("ADKAR",style: TextStyle(fontSize: 50)),))
                  ]),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: MouseRegion(
                        onEnter: (a){setState(() {
                          Ltaxiop = 1;
                        });},
                        onExit: (a){setState(() {
                          Ltaxiop = 0;
                        });},
                        child: InkWell(
                          focusColor: Colors.black45,
                          highlightColor: Colors.lightBlue,
                          hoverColor: Colors.black45.withOpacity(0.1),
                          onTap: () {
                            _lauchUrlLtaxi();
                          },
                          child: Stack(
                            children: [Container(alignment: Alignment.center,
                              child: CarouselSlider(
                                  items: [
                                    Container(
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "lib/asset/images/Ltaxi.jpg")))),
                                    Container(
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "lib/asset/images/Ltaxi2.jpg")))),
                                  ],
                                  options: CarouselOptions(
                                    aspectRatio: MediaQuery.of(context).size.width<800?13/9:16/9,
                                    viewportFraction: MediaQuery.of(context).size.width<800?0.5:0.8,
                                    disableCenter: true,
                                      height: MediaQuery.of(context).size.width<800?MediaQuery.of(context).size.height/1.8:MediaQuery.of(context).size.height,
                                      autoPlay: true,
                                      scrollDirection: MediaQuery.of(context).size.width<800?Axis.vertical:Axis.horizontal,
                                      autoPlayAnimationDuration:
                                          Duration(milliseconds: 230))),
                            ),
                              AnimatedOpacity(opacity: Ltaxiop,
                                  duration: Duration(milliseconds: 500),
                                  child: Container(alignment: Alignment.center,child: Text("L-TAXI",style: TextStyle(fontSize: 50)),))
                            ]),
                        ),
                      ),
                    ),
                    MouseRegion(
                      onEnter: (a){setState(() {
                        Dop = 1;
                      });},
                      onExit: (a){setState(() {
                        Dop = 0;
                      });},
                      child: InkWell(
                        autofocus: false,
                        enableFeedback: true,
                        hoverColor: Colors.black45.withOpacity(0.1),
                        onTap: () {
                          _launchUrlDblood();
                        },
                        child: ReusableStack(context,'lib/asset/images/Dblood1.jpeg','lib/asset/images/Dblood2.jpg'),
                      ),
                    )
                  ],
                ),
              )
            ],
            options: CarouselOptions(
              reverse: true,
                viewportFraction: 0.7,
                height: MediaQuery.of(context).size.height,
                scrollDirection: Axis.vertical,
                autoPlay: true,
                enlargeCenterPage: false)),
      ),
    );
  }

  Stack ReusableStack(BuildContext context,String firstImage,String SecondImage) {
    return Stack(
                        children: [CarouselSlider(
                            items: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        firstImage),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                decoration:  BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        SecondImage),
                                  ),
                                ),
                              )
                            ],
                            options: CarouselOptions(
                                animateToClosest: true,
                                autoPlay: true,
                                enlargeCenterPage: false,
                                viewportFraction: MediaQuery.of(context).size.width<800?0.4:0.6,
                                autoPlayAnimationDuration: Duration(seconds: 3))),
                          AnimatedOpacity(opacity: Dop,
                              duration: Duration(milliseconds: 500),
                              child: Container(alignment: Alignment.center,child: Text(textAlign: TextAlign.center,"D-BlOOD",style: TextStyle(fontSize: 50)),))
                        ]);
  }
}