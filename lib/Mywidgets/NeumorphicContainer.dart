import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test2 extends StatelessWidget {
  const Test2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(child: NeumorphicContainer()),
    );
  }
}

class NeumorphicContainer extends StatefulWidget {
  final Widget child;
  double bevel;

  //normal = 400, 600
  double Height;
  double Width;

  NeumorphicContainer(
      {Key? key,
      this.child = const Text("data"),
      this.bevel = 9.0,
      this.Height = 600,
      this.Width = 400})
      : super(key: key);

  @override
  State<NeumorphicContainer> createState() => _NeumorphicContainerState();
}

class _NeumorphicContainerState extends State<NeumorphicContainer> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (a) {
        setState(() {
          widget.bevel = 15.0;
          widget.Height = 630;
          widget.Width = 430;
        });
      },
      onExit: (a) {
        setState(() {
          // widget.bevel = 9.0;
          //widget.Height = 600;
          widget.Width = 400;
        });
      },
      child: AnimatedContainer(
        alignment: Alignment.center,
        height: widget.Height,
        width: widget.Width,
        decoration: BoxDecoration(
            color: Colors.deepOrangeAccent,
            boxShadow: [
              BoxShadow(
                  // color: Colors.deepOrangeAccent,
                  color: Colors.black,
                  blurRadius: widget.bevel,
                  blurStyle: BlurStyle.outer,
                  spreadRadius: 0.0)
            ]),
        duration: Duration(milliseconds: 50),
        child: widget.child,
      ),
    );
  }
}
