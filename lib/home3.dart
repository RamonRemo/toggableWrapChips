import 'package:animated_wrap/chip_master.dart';
import 'package:animated_wrap/chip_x.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double val = 0.1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.all(24.0),
            child: Slider(
                label: '$val',
                value: val,
                max: 10,
                divisions: 10,
                onChanged: (val) {
                  setState(() {
                    this.val = val;
                  });
                }),
          ),
          TheAllPowerfullChipMaster(list: [
            ChipX(label: 'chip1', value: 1 > val),
            ChipX(label: 'chip2', value: 2 > val),
            ChipX(label: 'chip3', value: 3 > val),
            ChipX(label: 'chip4', value: 4 > val),
            ChipX(label: 'chip5', value: 5 > val),
            ChipX(label: 'chip6', value: 6 > val),
            ChipX(label: 'chip7', value: 7 > val),
            ChipX(label: 'chip8', value: 8 > val),
            ChipX(label: 'chip9', value: 9 > val),
            ChipX(label: 'chip10', value: 10 > val),
          ]),
        ],
      ),
    );
  }
}
