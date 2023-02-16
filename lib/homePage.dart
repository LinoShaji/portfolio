import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dashed_line/dashed_line.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/AnimeStack.dart';
import 'package:portfolio/MyCarousel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

//todo my projects, how to contact me and leave me a message(create a form and pass the values that users enters to me using firebase)

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
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
    final AboutKey = GlobalKey();
    final HomeKey = GlobalKey();
    final WorkKey = GlobalKey();
    final AnimeStackKey = GlobalKey();
    String about =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised";
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff36576C),
          flexibleSpace: Row(
            children: [
              const SizedBox(width: 20),
              ScrollButton(
                  "Home",
                  () => Scrollable.ensureVisible(HomeKey.currentContext!,
                      duration: const Duration(milliseconds: 600))),
              const SizedBox(width: 45),
              ScrollButton(
                  "About",
                  () => Scrollable.ensureVisible(AboutKey.currentContext!,
                      duration: const Duration(milliseconds: 600))),
              const SizedBox(width: 45),
              ScrollButton(
                  "My Works",
                      () => Scrollable.ensureVisible(WorkKey.currentContext!,
                      duration: const Duration(milliseconds: 600)))

            ],
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
              child: Text(
                about,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width < 800 ? 20 : 35,
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
          SizedBox(
            height: 30,
          ),
          //todo detect if android or windows and then change the below widgets

          Windows? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            //todo implement another facility while the screen size reudces
            child: Row(children: [
              Column(
                children: [
                  Row(
                    children: [

                      AnimeStack(IntroText: "Android", Desc: "Android Applications"),
                      AnimeStack(
                          IntroText: "Web Development",
                          Desc: "Im doing web development"),
                    ],
                  ),
                  SizedBox(height: 30),
                  Container(color: Colors.white60,height: 230,width: 500,child: Text("Testing"),)
                ],
              ),
              Column(
                children: [
                  AnimeStack(
                      IntroText: "Web Development",
                      Desc: "Im doing web development"),
                  SizedBox(
                    height: 20,
                  ),
                  AnimeStack(
                      IntroText: "Web Development",
                      Desc: "Im doing web development")
                ],
              )
            ]),
          ) :  MyCarousel(),
          const SizedBox(
            height: 50,
          ),
          Text(about),
          const SizedBox(
            height: 500,

          )
        ]),
      ),
    );
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
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ContactButton(
                    'lib/asset/images/whiteInstagram.png', 30, _insta),
                const SizedBox(
                  width: 20,
                ),
                ContactButton('lib/asset/images/whitegithub.png', 30, _git),
                const SizedBox(
                  width: 20,
                ),
                ContactButton(
                    'lib/asset/images/whitelinkedin.png', 30, _linkedin)
                //TODO add whatsapp redirection
              ]),
            ),
          )
        ],
      ),
    );
  }
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

const h1 = TextStyle(
    fontFamily: 'poppins',
    fontWeight: FontWeight.w600,
    fontSize: 65,
    letterSpacing: 0,
    color: Colors.white);

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

Widget ScrollButton(String caption, void OnPressed()) {
  return TextButton(
      onPressed: OnPressed,
      child: Text(
        caption,
        style: TextStyle(color: Colors.white, fontSize: 15),
      ));
}

class HeadingContainer extends StatelessWidget {
  final String heading;
  final double Size;

  HeadingContainer({Key? key, required this.heading, required this.Size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(heading,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Size,
              letterSpacing: 1,
              color: Color(0xff567189))),
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
