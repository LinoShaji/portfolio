import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';

class AnimeStack extends StatefulWidget {
  final String IntroText;
  final String Desc;

  AnimeStack({Key? key, required this.IntroText, required this.Desc})
      : super(key: key);

  @override
  State<AnimeStack> createState() => _AnimeStackState();
}

class _AnimeStackState extends State<AnimeStack> {
  bool textAppear = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        MouseRegion(
          onEnter: (a) {
            setState(() {
              textAppear = true;
            });
          },
          onExit: (a) {
            setState(() {
              textAppear = false;
            });
          },
          child: AnimatedOpacity(
            curve: Curves.easeOut,
            opacity: textAppear ? 0 : 1,
            duration: Duration(milliseconds: textAppear ? 400 : 100),
            child: Align(
              alignment: Alignment.center,
              //small container
              child: ClayContainer(

                borderRadius: 20,
                color: Color(0xffcfcfa3),
                depth: 20,
                child: AnimatedContainer(
                    decoration: const BoxDecoration(
                        color: Color(0xffcfcfa3),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    alignment: Alignment.center,
                    height: 250,
                    width: 200,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                    child: Text(
                      widget.IntroText,
                      style: TextStyle(fontSize: 35),
                    )),
              ),
            ),
          ),
        ),
        MouseRegion(
          onEnter: (a) {
            setState(() {
              textAppear = true;
            });
          },
          onExit: (a) {
            setState(() {
              textAppear = false;
            });
          },
          //large container
          child: AnimatedOpacity(
            curve: textAppear ? Curves.easeIn : Curves.easeOut,
            opacity: textAppear ? 1 : 0,
            duration: Duration(milliseconds: textAppear ? 200 : 200),
            child: Align(
              alignment: Alignment.center,
              child: AnimatedContainer(
                alignment: Alignment.center,
                height: 250,
                width: 300,
                decoration: const BoxDecoration(
                    color: Colors.white60,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white60,
                          blurStyle: BlurStyle.outer,
                          blurRadius: 10)
                    ]),
                duration: Duration(milliseconds: 300),
                curve: Curves.elasticIn,
                child: Text(widget.Desc),
              ),
            ),
          ),
        )
      ],
    );
  }
}
