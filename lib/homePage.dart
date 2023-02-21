import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dashed_line/dashed_line.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/Mywidgets/MyCarousel.dart';
import 'package:portfolio/Mywidgets/NeumorphicContainer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

//todo my projects, how to contact me and leave me a message(create a form and pass the values that users enters to me using firebase)

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color emailcolor = Colors.blueGrey;
  Color locationcolor = Colors.blueGrey;
  Color WhatsappColor = Colors.black;
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

  bool textAppear = false;

  @override
  Widget build(BuildContext context) {
    yesAndroid();
    String email = Uri.encodeComponent("linoshaji23@gmail.com");
    Uri mail = Uri.parse("mailto:$email");
    Uri whatsapp = Uri.parse("https://wa.me/+918593871625");
    Future<void> _launchWhatsapp() async {
      if (!await launchUrl(whatsapp)) {
        throw Exception("Could not launch");
      }
    }

    Future<void> _launchemail() async {
      if (!await launchUrl(mail)) {
        throw Exception('Could not launch');
      }
    }

    Uri location = Uri.parse(
        "https://www.google.co.in/maps/place/Ameen+Hostel/@9.5451859,76.8147328,17z/data=!3m1!4b1!4m5!3m4!1s0x3b0637dc24488533:0x2554ebc013ffaaa5!8m2!3d9.5451855!4d76.8169148");
    Future<void> _launchlocation() async {
      if (!await launchUrl(location)) {
        throw Exception('coukd not launch');
      }
    }

    final AboutKey = GlobalKey();
    final HomeKey = GlobalKey();
    final WorkKey = GlobalKey();
    final Contact = GlobalKey();
    String about =
        "A computer science engineering student passionate about tech world. I found my interest sitting infront of my laptop develop, deploy responsive and intuitive user interfaces. Always passionate about building innovative and engaging programming applications that make a positive impact on people's lives and am excited to bring my skills and experience to new projects and teams. Currently working with python projects and trying the new field of network security and intelligence.";
    ScrollController controller = ScrollController();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff36576C),
          flexibleSpace: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 20),
                ScrollButton(
                    "Home",
                    () => Scrollable.ensureVisible(HomeKey.currentContext!,
                        duration: const Duration(milliseconds: 600)),MediaQuery.of(context).size.width < 800?17:20),
                SizedBox(
                    width: MediaQuery.of(context).size.width < 600 ? 17 : 45),
                ScrollButton(
                    "About",
                    () => Scrollable.ensureVisible(AboutKey.currentContext!,
                        duration: const Duration(milliseconds: 600)),MediaQuery.of(context).size.width < 800?17:20),
                SizedBox(
                    width: MediaQuery.of(context).size.width < 600 ? 17 : 45),
                ScrollButton(
                    "My Works",
                    () => Scrollable.ensureVisible(WorkKey.currentContext!,
                        duration: const Duration(milliseconds: 600)),MediaQuery.of(context).size.width < 800?17:20),
                SizedBox(
                    width: MediaQuery.of(context).size.width < 600 ? 17 : 45),
                ScrollButton(
                    "Contact me",
                    () => Scrollable.ensureVisible(Contact.currentContext!,
                        duration: const Duration(milliseconds: 600)),MediaQuery.of(context).size.width < 800?17:20)
              ],
            ),
          )),
      backgroundColor: const Color(0xffe9e6e6),
      body: SingleChildScrollView(
        child: Column(children: [
          MediaQuery.of(context).size.width < 800
              ? Column(key: HomeKey, children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: nameContainer(context)),
                  const SizedBox(height: 30),
                  const meImageContainer(),
                ])
              : Container(
                  color: Color(0xff36576C),
                  child: Row(
                    key: HomeKey,
                    children: [
                      nameContainer(context),
                      const meImageContainer(),
                    ],
                  ),
                ),
          const SizedBox(height: 60),
          Container(
            key: AboutKey,
            child: Text(
                key:
                    Key('${MediaQuery.of(context).size.width < 800 ? 20 : 35}'),
                "HELLO  WORLD!",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: MediaQuery.of(context).size.width < 800 ? 25 : 35,
                    letterSpacing: 0,
                    color: const Color(0xff00425A))),
          ),
          const SizedBox(height: 15),
          HeadingContainer(
            heading: "ABOUT ME",
            Size: MediaQuery.of(context).size.width < 800 ? 40 : 50,
          ),
          const DottedLine(lineLength: 300, dashColor: Colors.black45),
          const SizedBox(height: 40),
          Container(
              padding: const EdgeInsets.only(left: 90, right: 90),
              child: Animate(
                effects: [FadeEffect(duration: Duration(seconds: 1))],
                child: Text(
                  about,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width < 800 ? 20 : 30,
                  ),
                ),
              )),
          const SizedBox(height: 20),
          Container(
              margin: const EdgeInsets.only(left: 800, right: 800),
              child: DashedLine.svgPath(
                  "M0.5 36.5C517.62 125.638 748 -23 1235 5.00003",
                  color: Colors.black45)),
          const SizedBox(
            height: 30,
          ),
          HeadingContainer(
              key: WorkKey,
              heading: "WHAT I DO",
              Size: MediaQuery.of(context).size.width < 800 ? 40 : 50),
          const DottedLine(lineLength: 400, dashColor: Colors.black45),
          const SizedBox(
            height: 30,
          ),
          const MyCarousel(),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color(0xff36576C),
            ),
            child: Column(children: [
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: HeadingContainer(
                  colour: Colors.black54,
                  key: Contact,
                  heading: "Get in touch with me",
                  Size: MediaQuery.of(context).size.width < 800 ? 20 : 30,
                ),
              ),
              //NeumorphicContainer(),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        "Where to find me :",
                        style: TextStyle(
                            color: Colors.white60,
                            fontSize: MediaQuery.of(context).size.width < 800
                                ? 18
                                : 25,
                            fontWeight: FontWeight.w700),
                      ),
                      //
                      MouseRegion(
                        onEnter: (a) {
                          setState(() {
                            locationcolor = Colors.white;
                          });
                        },
                        onExit: (a) {
                          setState(() {
                            locationcolor = Colors.blueGrey;
                          });
                        },
                        child: InkWell(
                          onTap: () {
                            _launchlocation();
                          },
                          child: Text(
                            " Pattimattom p.o\n Kottayam district\n Kanjirappally ",
                            style: TextStyle(
                              color: locationcolor,
                              fontSize: MediaQuery.of(context).size.width < 800
                                  ? 18
                                  : 25,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Email me at :",
                        style: TextStyle(
                            color: Colors.white60,
                            fontSize: MediaQuery.of(context).size.width < 800
                                ? 18
                                : 25,
                            fontWeight: FontWeight.w700),
                      ),
                      MouseRegion(
                        onEnter: (a) {
                          setState(() {
                            emailcolor = Colors.white;
                          });
                        },
                        onExit: (a) {
                          setState(() {
                            emailcolor = Colors.blueGrey;
                          });
                        },
                        child: InkWell(
                          onTap: () {
                            _launchemail();
                          },
                          child: Text(
                            "\t\t\tlinoshaji23@gmail.com",
                            style: TextStyle(
                              color: emailcolor,
                              fontSize: MediaQuery.of(context).size.width < 800
                                  ? 18
                                  : 25,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Call / Whatsapp me at:",
                        style: TextStyle(
                            color: Colors.white60,
                            fontSize: MediaQuery.of(context).size.width < 800
                                ? 18
                                : 25,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "(+91) 8593871625",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize:
                              MediaQuery.of(context).size.width < 800 ? 18 : 25,
                        ),
                      ),
                      MouseRegion(
                          onHover: (a) {
                            setState(() {
                              WhatsappColor = Colors.white;
                            });
                          },
                          child: IconButton(
                              color: WhatsappColor,
                              onPressed: () {
                                _launchWhatsapp();
                              },
                              icon: Image(
                                  image: AssetImage(
                                      'lib/asset/images/whatsapp.png')))),
                    ],
                  ),
                ),
              )
            ]),
          )
        ]),
      ),
    );
  }
}

Container nameContainer(BuildContext context) {
  final Uri _insta = Uri.parse('https://www.instagram.com/lino_shaji/');
  final Uri _git = Uri.parse('https://github.com/LinoShaji');
  final Uri _linkedin =
      Uri.parse('https://www.linkedin.com/in/lino-shaji-66232618b/');

  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width / 2,
    decoration: const BoxDecoration(color: Color(0xff36576C)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20),
          alignment: Alignment.center,
          child: Text("I   am",
              style: TextStyle(
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.width < 800 ? 30 : 40,
                  letterSpacing: 0,
                  color: Colors.white)),
        ),
        Container(
          alignment: Alignment.center,
          child: Text("LINO SHAJI",
              style: TextStyle(
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.width < 800 ? 35 : 65,
                  letterSpacing: 0,
                  color: Colors.white)),
        ),
        Container(alignment: Alignment.center, child: AnimatedPositions()),
        SizedBox(height: 60),
        // contact buttons
        Align(
          alignment: Alignment.center,
          child: Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ContactButton('lib/asset/images/whiteInstagram.png', 30, _insta),
              const SizedBox(
                width: 20,
              ),
              ContactButton('lib/asset/images/whitegithub.png', 30, _git),
              const SizedBox(
                width: 20,
              ),
              ContactButton('lib/asset/images/whitelinkedin.png', 30, _linkedin)
              //TODO add whatsapp redirection
            ]),
          ),
        )
      ],
    ),
  );
}

class AnimatedPositions extends StatelessWidget {
  const AnimatedPositions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("A",
            style: TextStyle(
                fontFamily: 'poppins',
                fontWeight: FontWeight.w600,
                fontSize: MediaQuery.of(context).size.width < 800 ? 30 : 40,
                letterSpacing: 0,
                color: Colors.white)),
        SizedBox(width: 20),
        animatedTextPositions(),
      ],
    );
  }
}

class animatedTextPositions extends StatelessWidget {
  const animatedTextPositions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
        isRepeatingAnimation: true,
        repeatForever: true,
        key: Key('${MediaQuery.of(context).size.width < 800 ? 30 : 40}'),
        animatedTexts: [
          TyperAnimatedText("DEVELOPER",
              textStyle: TextStyle(
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.width < 800 ? 30 : 40,
                  letterSpacing: 0,
                  color: Colors.white),
              speed: s1),
          TyperAnimatedText("TECH GEEK",
              textStyle: TextStyle(
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.width < 800 ? 30 : 40,
                  letterSpacing: 0,
                  color: Colors.white),
              speed: s1),
          TyperAnimatedText("SHUTTERBUG",
              textStyle: TextStyle(
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.width < 800 ? 30 : 40,
                  letterSpacing: 0,
                  color: Colors.white),
              speed: s1),
          TyperAnimatedText("PHILOMATH",
              textStyle: TextStyle(
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.width < 800 ? 30 : 40,
                  letterSpacing: 0,
                  color: Colors.white),
              speed: s1),
        ]);
  }
}

class meImageContainer extends StatelessWidget {
  const meImageContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('meImageContainer'),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width / 2,
      child: Image(
          fit: BoxFit.fitHeight,
          image: AssetImage('lib/asset/images/portfoliopic.jpg')),
    );
  }
}

Widget ContactButton(String logo, double h, Uri link) {
  Future<void> _launchUrl() async {
    if (!await launchUrl(link)) {
      throw Exception('Could not launch');
    }
  }

  return IconButton(
    onPressed: _launchUrl,
    icon: Image(height: h, fit: BoxFit.contain, image: AssetImage(logo)),
  );
}

Duration Speed = Duration();
final s1 = Speed = Duration(milliseconds: 100);

Widget ScrollButton(String caption, void OnPressed(), double size) {
  return TextButton(
      onPressed: OnPressed,
      child: Text(
        caption,
        style: TextStyle(color: Colors.white, fontSize: size),
      ));
}

class HeadingContainer extends StatelessWidget {
  final String heading;
  final double Size;
  Color colour;

  HeadingContainer(
      {Key? key,
      required this.heading,
      required this.Size,
      this.colour = const Color(0xff567189)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(heading,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Size,
              letterSpacing: 1,
              color: colour)),
    );
  }
}

class DoContainer extends StatelessWidget {
  final String doText;

  DoContainer({Key? key, required this.doText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black45,
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.only(right: 20, left: 20),
        height: 180,
        width: 200,
        child: Text(
          doText,
          style: TextStyle(fontSize: 25),
        ));
  }
}
