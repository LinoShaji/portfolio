// import 'package:flutter/cupertino.dart';
//
// class Responsive extends StatelessWidget {
//   final Widget largeScreen;
//   final Widget smallScreen;
//   final Widget mediumScreen;
//
//   const Responsive({Key? key,
//     this.mediumScreen,
//     this.smallScreen,
//     @required this.largeScreen})
//       : super(key: key);
//
//
//   static bool isMediumScreen(BuildContext context) {
//     return MediaQuery
//         .of(context)
//         .size
//         .width >= 800 &&
//         MediaQuery
//             .of(context)
//             .size
//             .width <= 1200;
//   }
//
//   static bool isLargeScreen(BuildContext context) {
//     return MediaQuery
//         .of(context)
//         .size
//         .width > 1200;
//   }
//
//   static bool isSmallScreen(BuildContext context) {
//     return MediaQuery
//         .of(context)
//         .size
//         .width < 800;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, constraints) {
//       if (constraints.maxWidth > 1200) {
//         return largeScreen;
//       } else if (constraints.maxWidth <= 1200 && constraints.maxWidth >= 800) {
//         return mediumScreen ?? largeScreen;
//       }else{return smallScreen?? largeScreen;}
//     },);
//   }
// }
