import 'package:animated_wrap/chip_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class WidgetSize extends StatefulWidget {
  final ChipX child;
  final Function onChange;
  bool selected = false;
  double? he;
  double? wi;

  WidgetSize({
    super.key,
    required this.onChange,
    required this.child,
    this.selected = false,
  });

  @override
  _WidgetSizeState createState() => _WidgetSizeState();

  // @override
  // String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
  //   return 'chipvalue: ${child.value[0]}, selected: ${selected} , he: ${he}, wi: ${wi} \n';

  //   // return super.toString(minLevel);
  // }
}

class _WidgetSizeState extends State<WidgetSize> {
  double? he;
  double? wi;

  @override
  void didUpdateWidget(covariant WidgetSize oldWidget) {
    // if (oldWidget.he == null || widget.he == null) {
    //   return;
    // }

    // if (oldWidget.he!.toDouble() > widget.he!.toDouble()) {}
    // if (widget.he == oldWidget.he) {
    //   widget.he = widget.he;
    //   widget.wi = widget.wi;
    // } else {
    widget.he = oldWidget.he;
    widget.wi = oldWidget.wi;
    // }

    // print('(${oldWidget.he}), (${oldWidget.wi})');
    // print('(${widget.he}), (${widget.wi})');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(postFrameCallback);

    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      key: widgetKey,
      margin: EdgeInsets.all(widget.selected ? 8.0 : 0.0),
      width: widget.selected ? widget.wi : 0,
      // height: widget.selected ? widget.he : 0,
      curve: Curves.fastLinearToSlowEaseIn,
      child: widget.child,
    );
  }

  var widgetKey = GlobalKey();
  var oldSize;
  var firstSize;

  void postFrameCallback(_) {
    var context = widgetKey.currentContext;
    if (context == null) return;

    var newSize = context.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    widget.onChange(newSize);

    if (firstSize == null && newSize != null) {
      firstSize = newSize;
      widget.he = firstSize?.height;
      widget.wi = firstSize?.width;
    }

    widget.he = firstSize?.height ?? 0;
    widget.wi = firstSize?.width ?? 0;

    // print(widget.he);
    // print(widget.wi);
    setState(() {});
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'chipvalue: ${widget.child.value[0]}, selected: ${widget.selected} , he: ${widget.he}, wi: ${widget.wi}';
    // return super.toString(minLevel);
  }
}
