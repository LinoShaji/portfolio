import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WebProjects extends StatefulWidget {
  const WebProjects({Key? key}) : super(key: key);

  @override
  State<WebProjects> createState() => _WebProjectsState();
}

class _WebProjectsState extends State<WebProjects> {
  double Razop = 0;
  final Uri _Raz = Uri.parse("http://razalhind.com");

  Future<void> _launchRaz() async {
    if (!await launchUrl(_Raz)) throw Exception("Could not launch");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            OpacityHoverContainer(
                axis: MediaQuery.of(context).size.width < 800
                    ? Axis.vertical
                    : Axis.horizontal,
                nav: "http://razalhind.com/",
                CarouselImage1: "lib/asset/images/3.png",
                CarouselImage2: "lib/asset/images/2.png",
                HoverText: "RAZ AL HIND"),
            OpacityHoverContainer(
                axis: MediaQuery.of(context).size.width < 800
                    ? Axis.vertical
                    : Axis.horizontal,
                nav: "linoshaji.github.io",
                CarouselImage1: "lib/asset/images/portfolio1.png",
                CarouselImage2: "lib/asset/images/portfolio2.png",
                HoverText: "PORTFOLIO")
          ],
        ),
      ),
    );
  }
}

class Images extends StatelessWidget {
  final String root;

  const Images({Key? key, required this.root}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage(root));
  }
}

class ImageContainer extends StatelessWidget {
  String root;

  ImageContainer({Key? key, required this.root}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width < 800
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width / 2,
       child: Image.network(root)
      // Image.network(root: root),
    );
  }
}

class OpacityHoverContainer extends StatefulWidget {
  String CarouselImage1;
  String CarouselImage2;
  String HoverText;
  String nav;
  Axis axis;

  OpacityHoverContainer(
      {Key? key,
      this.axis = Axis.horizontal,
      this.nav = "linoshaji.github.io",
      required this.CarouselImage1,
      required this.CarouselImage2,
      required this.HoverText})
      : super(key: key);

  @override
  State<OpacityHoverContainer> createState() => _OpacityHoverContainerState();
}

class _OpacityHoverContainerState extends State<OpacityHoverContainer> {
  double AnimOpacity = 0;

  @override
  Widget build(BuildContext context) {
    final Uri _navigation = Uri.parse(widget.nav);
    Future<void> _launchUrl() async {
      if (!await launchUrl(_navigation)) {
        throw Exception("Could not launch");
      }
    }

    return MouseRegion(
      onEnter: (a) {
        setState(() {
          AnimOpacity = 1;
        });
      },
      onExit: (a) {
        setState(() {
          AnimOpacity = 0;
        });
      },
      child: InkWell(
        onTap: () {
          _launchUrl();
        },
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 50, right: 50),
              child: CarouselSlider(
                  items: [
                    ImageContainer(root: widget.CarouselImage1),
                    ImageContainer(root: widget.CarouselImage2),
                  ],
                  options: CarouselOptions(
                      height: MediaQuery.of(context).size.width < 800
                          ? MediaQuery.of(context).size.height / 2
                          : MediaQuery.of(context).size.height,
                      autoPlay: true,
                      viewportFraction: 0.6,
                      scrollDirection: widget.axis)),
            ),
            AnimatedOpacity(
                opacity: AnimOpacity,
                duration: Duration(milliseconds: 400),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(widget.HoverText, style: TextStyle(fontSize: 50)),
                ))
          ],
        ),
      ),
    );
  }
}

// Stack(children: [
// CarouselSlider(
// items: [
// ImageContainer(root: "lib/asset/images/3.png"),
// ImageContainer(root: "lib/asset/images/2.png"),
// AnimatedOpacity(
// opacity: Razop,
// duration: Duration(milliseconds: 400),
// child: Container(
// alignment: Alignment.center,
// child: Text("RAZ AL HIND",
// style: TextStyle(fontSize: 20)),
// ))
// ],
// options:
// CarouselOptions(autoPlay: true, viewportFraction: 0.6))
// ])
