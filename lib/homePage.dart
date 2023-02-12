import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:dashed_line/dashed_line.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

//todo work on some more animations for the animatestextkit
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String about =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised";
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: [
              ClayAnimatedContainer(child: nameContainer(context)),
              meImageContainer(),
            ],
          ),
          const SizedBox(height: 60),
          Text(
              key: Key('${MediaQuery.of(context).size.width < 800 ? 20 : 35}'),
              "HELLO  WORLD!",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: MediaQuery.of(context).size.width < 800 ? 25 : 35,
                  letterSpacing: 0,
                  color: Color(0xff00425A))),
          const SizedBox(height: 15),
          Container(
            child: Text("ABOUT ME ",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: MediaQuery.of(context).size.width < 800 ? 45 : 55,
                    letterSpacing: 1,
                    color: Color(0xff567189))),
          ),
          const DottedLine(lineLength: 500, dashColor: Colors.black45),
          SizedBox(height: 40),
          Container(
              padding: EdgeInsets.only(left: 120, right: 120),
              child: Text(
                about,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width < 800 ? 30 : 40,
                ),
              )),
          SizedBox(height: 20),
          Container(
              margin: EdgeInsets.only(left: 500, right: 500),
              child: DashedLine.svgPath(
                  "M0.5 36.5C517.62 125.638 748 -23 1235 5.00003",
                  color: Colors.black45)),
          SizedBox(
            height: 90,
          )
          //
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
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
      child: Image(image: AssetImage('lib/asset/images/me.jpg')),
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
