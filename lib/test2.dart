import 'package:flutter/material.dart';

class Test2 extends StatelessWidget {
  const Test2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const CustomInfo(),
    );
  }
}

class CustomInfo extends StatefulWidget {
  const CustomInfo({Key? key}) : super(key: key);

  @override
  State<CustomInfo> createState() => _CustomInfoState();
}

class _CustomInfoState extends State<CustomInfo> {
  double? width;
  double? height;
  Color? color;
  bool? animate;
  bool? textAppear;

  @override
  void initState() {
    animate = false;
    textAppear = false;
    showInfoPlayer(animate!);
    super.initState();
  }

  void showInfoPlayer(bool animate) {
    setState(() {
      if (animate) {
        height = 450;
        width = 800;
        color = Colors.grey[500];
        Future.delayed(const Duration(milliseconds: 300), () {
          setState(() {
            textAppear = true;
          });
        });
      } else {
        height = 450;
        width = 500;
        color = Colors.grey[500];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MouseRegion(
          onEnter: (a) {
            setState(() {
              animate = true;
              showInfoPlayer(animate!);
            });
          },
          onExit: (a) {
            animate = false;
            showInfoPlayer(animate!);
            textAppear = false;
          },
          child: Container(
            width: 650,
            height: 450,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedContainer(
                    height: height,
                    width: width,
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 60.0,
                    ),
                    color: color,
                    child: AnimatedOpacity(
                      opacity: textAppear! ? 1 : 0,
                      duration: Duration(milliseconds: textAppear! ? 400 : 100),
                      curve: Curves.easeOut,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "11",
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            "MOHAMED SALAH",
                            style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            "Forward",
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 10.0),
                            width: 270,
                            child: const Text(
                              "Mohamed Salah is one of the most prolific forwards in European football and a Champions League and Premier League winner with Liverpool.",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  //alignment: const Alignment(0, 0),
                  alignment: Alignment.bottomCenter,
                  child: AnimatedContainer(
                    padding: EdgeInsets.only(left: animate! ? 270 : 0),
                    duration: const Duration(milliseconds: 250),
                    height: 400,
                    child: const Image(
                      image: AssetImage('asset/salah.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                // refering section
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedOpacity(
                    opacity: textAppear! ? 0 : 1,
                    duration: Duration(milliseconds: textAppear! ? 200 : 200),
                    child: Container(
                      width: width,
                      color: const Color(0xFFF5F5F5).withOpacity(0.7),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "11",
                              style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              "MOHAMED SALAH",
                              style: TextStyle(
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:dashed_line/dashed_line.dart';
// import 'package:dotted_line/dotted_line.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class test extends StatefulWidget {
//   const test({Key? key}) : super(key: key);
//
//   @override
//   State<test> createState() => _HomePageState();
// }
//
// //todo work on some more animations for the animated textkit
// class _HomePageState extends State<test> {
//   bool textAppear = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final AboutKey = GlobalKey();
//     final HomeKey = GlobalKey();
//     String about =
//         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised";
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: const Color(0xff36576C),
//           flexibleSpace: Row(
//             children: [
//               const SizedBox(width: 20),
//               ScrollButton(
//                   "Home",
//                       () => Scrollable.ensureVisible(HomeKey.currentContext!,
//                       duration: const Duration(milliseconds: 600))),
//               const SizedBox(width: 45),
//               ScrollButton(
//                   "About",
//                       () => Scrollable.ensureVisible(AboutKey.currentContext!,
//                       duration: const Duration(milliseconds: 600)))
//             ],
//           )),
//       backgroundColor: const Color(0xffe9e6e6),
//       body: SingleChildScrollView(
//         child: Column(children: [
//           MediaQuery.of(context).size.width < 800
//               ? Column(key: HomeKey, children: [
//             SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 child: nameContainer(context)),
//             const SizedBox(height: 30),
//             const meImageContainer(),
//           ])
//               : Container(
//             color: Color(0xff36576C),
//             child: Row(
//               key: HomeKey,
//               children: [
//                 nameContainer(context),
//                 const meImageContainer(),
//               ],
//             ),
//           ),
//           const SizedBox(height: 60),
//           Container(
//             key: AboutKey,
//             child: Text(
//                 key:
//                 Key('${MediaQuery.of(context).size.width < 800 ? 20 : 35}'),
//                 "HELLO  WORLD!",
//                 style: TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontSize: MediaQuery.of(context).size.width < 800 ? 25 : 35,
//                     letterSpacing: 0,
//                     color: const Color(0xff00425A))),
//           ),
//           const SizedBox(height: 15),
//           HeadingContainer(
//             heading: "ABOUT ME",
//             Size: MediaQuery.of(context).size.width < 800 ? 40 : 50,
//           ),
//           const DottedLine(lineLength: 300, dashColor: Colors.black45),
//           const SizedBox(height: 40),
//           Container(
//               padding: const EdgeInsets.only(left: 90, right: 90),
//               child: Text(
//                 about,
//                 style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.width < 800 ? 20 : 35,
//                 ),
//               )),
//           const SizedBox(height: 20),
//           Container(
//               margin: const EdgeInsets.only(left: 800, right: 800),
//               child: DashedLine.svgPath(
//                   "M0.5 36.5C517.62 125.638 748 -23 1235 5.00003",
//                   color: Colors.black45)),
//           const SizedBox(
//             height: 30,
//           ),
//           HeadingContainer(
//               heading: "WHAT I DO",
//               Size: MediaQuery.of(context).size.width < 800 ? 40 : 50),
//           const DottedLine(lineLength: 400, dashColor: Colors.black45),
//           SizedBox(
//             height: 30,
//           ),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//               MouseRegion(
//                 onEnter: (a) {
//                   setState(() {
//                     textAppear= true;
//                   });
//                 },
//                 onExit: (a) {
//                   setState(() {
//                     textAppear = false;
//                   });
//                 },
//                 // todo refactor the below code to be reusable
//                 child: Stack(children: [AnimatedOpacity(
//                     curve: Curves.easeOut,
//                     opacity: textAppear ? 1 : 0,
//                     duration: Duration(milliseconds: 300),
//                     child: Align(
//                       alignment: Alignment.bottomCenter,
//                       child: AnimatedContainer(curve: Curves.bounceOut,padding: EdgeInsets.symmetric(horizontal: 40.0,
//                         vertical: 60.0,),duration: Duration(milliseconds: 400),
//                           child: DoContainer(doText: "Developer",H1: 220,W1: 250,)),
//                     )),
//                   AnimatedOpacity(
//                       opacity: textAppear ? 0 : 1,
//                       duration: Duration(milliseconds: 300),
//                       child: Align(alignment: Alignment.center,
//                         child: AnimatedContainer(padding: EdgeInsets.symmetric(horizontal: 57.0,vertical: 77.0),duration: Duration(milliseconds: 400),
//                             child: DoContainer(doText: "Developer")),
//                       ))
//                 ]),
//               ),
//               //todo https://levelup.gitconnected.com/how-to-create-a-beautiful-hover-effect-on-a-card-in-flutter-f82a2958e235 study this and implement for the DoContainer
//               const SizedBox(
//                 width: 40,
//               ),
//               Container(height: 60, color: Colors.black45)
//             ]),
//           ),
//           const SizedBox(
//             height: 50,
//           ),
//           Text(about),
//           const SizedBox(
//             height: 500,
//           )
//         ]),
//       ),
//     );
//   }
//
//   Container nameContainer(BuildContext context) {
//     final Uri _insta = Uri.parse('https://www.instagram.com/lino_shaji/');
//     final Uri _git = Uri.parse('https://github.com/LinoShaji');
//     final Uri _linkedin =
//     Uri.parse('https://www.linkedin.com/in/lino-shaji-66232618b/');
//
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width / 2,
//       decoration: const BoxDecoration(color: Color(0xff36576C)),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             margin: const EdgeInsets.only(left: 20),
//             alignment: Alignment.center,
//             child: Text("I   am",
//                 style: TextStyle(
//                     fontFamily: 'poppins',
//                     fontWeight: FontWeight.w600,
//                     fontSize: MediaQuery.of(context).size.width < 800 ? 30 : 40,
//                     letterSpacing: 0,
//                     color: Colors.white)),
//           ),
//           Container(
//             alignment: Alignment.center,
//             child: Text("LINO SHAJI",
//                 style: TextStyle(
//                     fontFamily: 'poppins',
//                     fontWeight: FontWeight.w600,
//                     fontSize: MediaQuery.of(context).size.width < 800 ? 35 : 65,
//                     letterSpacing: 0,
//                     color: Colors.white)),
//           ),
//           Container(alignment: Alignment.center, child: AnimatedPositions()),
//           SizedBox(height: 60),
//           // contact buttons
//           Align(
//             alignment: Alignment.center,
//             child: Container(
//               child:
//               Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                 ContactButton(
//                     'lib/asset/images/whiteInstagram.png', 30, _insta),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 ContactButton('lib/asset/images/whitegithub.png', 30, _git),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 ContactButton(
//                     'lib/asset/images/whitelinkedin.png', 30, _linkedin)
//                 //TODO add whatsapp redirection
//               ]),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class AnimatedPositions extends StatelessWidget {
//   const AnimatedPositions({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text("A",
//             style: TextStyle(
//                 fontFamily: 'poppins',
//                 fontWeight: FontWeight.w600,
//                 fontSize: MediaQuery.of(context).size.width < 800 ? 30 : 40,
//                 letterSpacing: 0,
//                 color: Colors.white)),
//         SizedBox(width: 20),
//         animatedTextPositions(),
//       ],
//     );
//   }
// }
//
// class animatedTextPositions extends StatelessWidget {
//   const animatedTextPositions({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedTextKit(
//         key: Key('${MediaQuery.of(context).size.width < 800 ? 30 : 40}'),
//         animatedTexts: [
//           TyperAnimatedText("DEVELOPER",
//               textStyle: TextStyle(
//                   fontFamily: 'poppins',
//                   fontWeight: FontWeight.w600,
//                   fontSize: MediaQuery.of(context).size.width < 800 ? 30 : 40,
//                   letterSpacing: 0,
//                   color: Colors.white),
//               speed: s1),
//           TyperAnimatedText("TECH GEEK",
//               textStyle: TextStyle(
//                   fontFamily: 'poppins',
//                   fontWeight: FontWeight.w600,
//                   fontSize: MediaQuery.of(context).size.width < 800 ? 30 : 40,
//                   letterSpacing: 0,
//                   color: Colors.white),
//               speed: s1),
//           TyperAnimatedText("SHUTTERBUG",
//               textStyle: TextStyle(
//                   fontFamily: 'poppins',
//                   fontWeight: FontWeight.w600,
//                   fontSize: MediaQuery.of(context).size.width < 800 ? 30 : 40,
//                   letterSpacing: 0,
//                   color: Colors.white),
//               speed: s1),
//           TyperAnimatedText("PHILOMATH",
//               textStyle: TextStyle(
//                   fontFamily: 'poppins',
//                   fontWeight: FontWeight.w600,
//                   fontSize: MediaQuery.of(context).size.width < 800 ? 30 : 40,
//                   letterSpacing: 0,
//                   color: Colors.white),
//               speed: s1),
//         ]);
//   }
// }
//
// class meImageContainer extends StatelessWidget {
//   const meImageContainer({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       key: Key('meImageContainer'),
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width / 2,
//       child: Image(
//           fit: BoxFit.fitHeight,
//           image: AssetImage('lib/asset/images/portfoliopic.jpg')),
//     );
//   }
// }
//
// const h1 = TextStyle(
//     fontFamily: 'poppins',
//     fontWeight: FontWeight.w600,
//     fontSize: 65,
//     letterSpacing: 0,
//     color: Colors.white);
//
// Widget ContactButton(String logo, double h, Uri link) {
//   Future<void> _launchUrl() async {
//     if (!await launchUrl(link)) {
//       throw Exception('Could not launch');
//     }
//   }
//
//   return IconButton(
//     onPressed: _launchUrl,
//     icon: Image(height: h, fit: BoxFit.contain, image: AssetImage(logo)),
//   );
// }
//
// Duration Speed = Duration();
// final s1 = Speed = Duration(milliseconds: 100);
//
// Widget ScrollButton(String caption, void OnPressed()) {
//   return TextButton(
//       onPressed: OnPressed,
//       child: Text(
//         caption,
//         style: TextStyle(color: Colors.white, fontSize: 15),
//       ));
// }
//
// class HeadingContainer extends StatelessWidget {
//   final String heading;
//   final double Size;
//
//   HeadingContainer({Key? key, required this.heading, required this.Size})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text(heading,
//           style: TextStyle(
//               fontWeight: FontWeight.w600,
//               fontSize: Size,
//               letterSpacing: 1,
//               color: Color(0xff567189))),
//     );
//   }
// }
//
// class DoContainer extends StatelessWidget {
//   final String doText; final double H1;final double W1;
//
//   DoContainer({Key? key, required this.doText,this.H1 = 180,this.W1 = 200}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Colors.black45,
//         ),
//         alignment: Alignment.center,
//         padding: EdgeInsets.only(right: 20, left: 20),
//         height: H1,
//         width: W1,
//         child: Text(
//           doText,
//           style: TextStyle(fontSize: 25),
//         ));
//   }
// }
// Widget? HoverContainer(double op1,double op0,String intro,String def){Stack(children: [AnimatedOpacity(
//     curve: Curves.easeOut,
//     opacity: op1,// 1:0
//     duration: Duration(milliseconds: 300),
//     child: Align(
//       alignment: Alignment.bottomCenter,
//       child: AnimatedContainer(padding: EdgeInsets.symmetric(horizontal: 40.0,
//         vertical: 60.0,),duration: Duration(milliseconds: 400),
//           child: DoContainer(doText: def,H1: 220,W1: 250,)),
//     )),
//   AnimatedOpacity(
//       opacity: op0,
//       duration: Duration(milliseconds: 300),
//       child: Align(alignment: Alignment.center,
//         child: AnimatedContainer(padding: EdgeInsets.symmetric(horizontal: 57.0,vertical: 77.0),duration: Duration(milliseconds: 400),
//             child: DoContainer(doText: intro)),
//       ))
// ]);}
