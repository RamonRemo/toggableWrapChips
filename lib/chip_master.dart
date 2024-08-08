import 'package:animated_wrap/chip_x.dart';
import 'package:animated_wrap/widget_size.dart';
import 'package:flutter/material.dart';

class TheAllPowerfullChipMaster extends StatelessWidget {
  final List<ChipX> list;

  const TheAllPowerfullChipMaster({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainerExample(
      chipList: list,
    );
  }
}

class AnimatedContainerExample extends StatefulWidget {
  final List<ChipX> chipList;

  const AnimatedContainerExample({super.key, required this.chipList});

  @override
  State<AnimatedContainerExample> createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool selected = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            // spacing: 16,
            // runSpacing: 16,
            children: () {
              final List<WidgetSize> list = widget.chipList.map((e) {
                return WidgetSize(
                  onChange: (size) {},
                  selected: e.value,
                  child: e,
                );
              }).toList();

              return list;
            }(),
          ),
        ],
      ),
    );
  }

//   List<Widget> buildList() {
//     List<WidgetSize> containersList = [];

//     for (int i = 0, len = widget.chipList.length; i < len; i++) {
//       containersList.add(
//         WidgetSize(
//           selected: !selected,
//           onChange: (size) {
//             setState(() {
//               // he = size.height;
//               // wi = size.width;
//               // print(size);
//             });
//           },
//           child: widget.chipList[i],
//         ),
//       );
//     }

//     return containersList;
//   }
}
