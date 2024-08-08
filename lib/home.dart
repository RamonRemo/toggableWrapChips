// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:measure_size_builder/measure_size_builder.dart';

// class AnimatedContainerExampleApp extends StatelessWidget {
//   const AnimatedContainerExampleApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('AnimatedContainer Sample')),
//         body: AnimatedContainerExample(
//           animatedContainers: [
//             Container(
//               margin: EdgeInsets.all(8),
//               height: 40.0,
//               width: 100.0,
//               decoration: BoxDecoration(
//                   color: Colors.red, borderRadius: BorderRadius.circular(15)),
//             ),
//             Container(
//               margin: EdgeInsets.all(8),
//               height: 40.0,
//               width: 120.0,
//               decoration: BoxDecoration(
//                   color: Colors.green, borderRadius: BorderRadius.circular(15)),
//             ),
//             Container(
//               margin: EdgeInsets.all(8),
//               height: 40.0,
//               width: 160.0,
//               decoration: BoxDecoration(
//                   color: Colors.blue, borderRadius: BorderRadius.circular(15)),
//             ),
//             Container(
//               margin: EdgeInsets.all(8),
//               height: 40.0,
//               width: 180.0,
//               decoration: BoxDecoration(
//                   color: Colors.yellow,
//                   borderRadius: BorderRadius.circular(15)),
//             ),
//             Container(
//               margin: EdgeInsets.all(8),
//               height: 40.0,
//               width: 200.0,
//               decoration: BoxDecoration(
//                   color: Colors.purple,
//                   borderRadius: BorderRadius.circular(15)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AnimatedContainerExample extends StatefulWidget {
//   final List<Container> animatedContainers;

//   const AnimatedContainerExample({super.key, required this.animatedContainers});

//   @override
//   State<AnimatedContainerExample> createState() =>
//       _AnimatedContainerExampleState();
// }

// class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
//   bool selected = true;

//   List<AnimatedContainer> list = [];

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: [
//           ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   selected = !selected;
//                 });
//               },
//               child: Text('lasaa')),
//           Wrap(
//             // spacing: 15,
//             // runSpacing: 10,
//             children: buildList(),
//           ),
//         ],
//       ),
//     );
//   }

//   List<Widget> buildList() {
//     List<WidgetSize> containersList = [];

//     for (int i = 0, len = widget.animatedContainers.length; i < len; i++) {
//       // double? he;
//       // double? wi;

//       // void postFrameCallback(_) {
//       //   setState(() {
//       //     he = keys[i].currentContext?.size?.height;
//       //     wi = keys[i].currentContext?.size?.width;
//       //     // print('he: $he, wi: $wi');
//       //   });
//       // }

//       // SchedulerBinding.instance.addPostFrameCallback(postFrameCallback);

//       // print(he);
//       // print(wi);

//       containersList.add(
//         WidgetSize(
//           selected: selected,
//           onChange: (size) {
//             setState(() {
//               // he = size.height;
//               // wi = size.width;
//               // print(size);
//             });
//           },
//           child: widget.animatedContainers[i],
//         ),
//       );
//     }

//     return containersList;
//   }
// }

// //------------------------------------------------------------------------------
// //------------------------------------------------------------------------------
// //------------------------------------------------------------------------------
// //------------------------------------------------------------------------------
// //------------------------------------------------------------------------------
// //------------------------------------------------------------------------------
// //------------------------------------------------------------------------------
// //------------------------------------------------------------------------------
// //------------------------------------------------------------------------------

// class WidgetSize extends StatefulWidget {
//   final Widget child;
//   final Function onChange;
//   bool selected = false;
//   double? he;
//   double? wi;

//   WidgetSize({
//     super.key,
//     required this.onChange,
//     required this.child,
//     this.selected = false,
//   });

//   @override
//   _WidgetSizeState createState() => _WidgetSizeState();
// }

// class _WidgetSizeState extends State<WidgetSize> {
//   @override
//   void didUpdateWidget(covariant WidgetSize oldWidget) {
//     // if (oldWidget.he == null || widget.he == null) {
//     //   return;
//     // }

//     // if (oldWidget.he!.toDouble() > widget.he!.toDouble()) {}
//     // if (widget.he == oldWidget.he) {
//     //   widget.he = widget.he;
//     //   widget.wi = widget.wi;
//     // } else {
//     widget.he = oldWidget.he;
//     widget.wi = oldWidget.wi;
//     // }

//     print('(${oldWidget.he}), (${oldWidget.wi})');
//     print('(${widget.he}), (${widget.wi})');
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   Widget build(BuildContext context) {
//     SchedulerBinding.instance.addPostFrameCallback(postFrameCallback);

//     return AnimatedContainer(
//       duration: Duration(seconds: 1),
//       key: widgetKey,
//       margin: EdgeInsets.all(widget.selected ? 0.0 : 0.0),
//       width: widget.selected ? widget.wi : 50,
//       height: widget.selected ? widget.he : 50,
//       curve: Curves.fastOutSlowIn,
//       child: widget.child,
//     );
//   }

//   var widgetKey = GlobalKey();
//   var oldSize;
//   var firstSize;

//   void postFrameCallback(_) {
//     var context = widgetKey.currentContext;
//     if (context == null) return;

//     var newSize = context.size;
//     if (oldSize == newSize) return;

//     oldSize = newSize;
//     widget.onChange(newSize);

//     if (firstSize == null && newSize != null) {
//       firstSize = newSize;
//       widget.he = firstSize?.height;
//       widget.wi = firstSize?.width;
//     }

//     widget.he = firstSize?.height;
//     widget.wi = firstSize?.width;

//     print(widget.he);
//     print(widget.wi);
//     setState(() {});
//   }
// }
