import 'package:flutter/material.dart';


enum WillChipStyle {
  filled,
  outLine,
}

class ChipX extends StatefulWidget {
  const ChipX({
    required this.label,
    this.value,
    this.initSelected = false,
    this.onSelected,
    this.style = WillChipStyle.filled,
    super.key,
  });

  factory ChipX.filled({
    required final String label,
    final dynamic value,
    final bool initSelected = false,
    final Function(bool selected)? onSelected,
  }) {
    return ChipX(
      label: label,
      value: value,
      initSelected: initSelected,
      onSelected: onSelected,
    );
  }

  factory ChipX.outLine({
    required final String label,
    final dynamic value,
    final bool initSelected = false,
    final Function(bool selected)? onSelected,
  }) {
    return ChipX(
      label: label,
      value: value,
      initSelected: initSelected,
      onSelected: onSelected,
      style: WillChipStyle.outLine,
    );
  }

  final String label;
  final dynamic value;
  final bool initSelected;
  final WillChipStyle style;
  final Function(bool selected)? onSelected;

  /// Return value, if not null,
  ///
  /// if null returns label
  dynamic get valueOrLabel {
    return value ?? label;
  }

  @override
  State<ChipX> createState() => _ChipXState();
}

class _ChipXState extends State<ChipX>
    with SingleTickerProviderStateMixin {
  ValueNotifier<bool> isSelected = ValueNotifier(false);
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;
  late Animation<Color?> _colorBorderAnimation;
  late Duration _duration;
  late double angle;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _duration = const Duration(milliseconds: 100);

    _animationController = AnimationController(
      vsync: this,
      duration: _duration,
    );

    _initDefault();
  }

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onToggle();
        if (widget.onSelected != null) {
          // ignore: prefer_null_aware_method_calls
          widget.onSelected!(isSelected.value);
        }
      },
      child: AnimatedBuilder(
        builder: (final context, final child) {
          angle = _animationController.value * 0.8;

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: _colorAnimation.value,
              border: Border.all(
                color: _colorBorderAnimation.value!,
              ),
            ),
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 8,
              right: 8,
              left: 8,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLabel(context),
                const SizedBox(width: 8),
                Transform.rotate(
                  angle: angle,
                  child: Icon(Icons.add)
                )
              ],
            ),
          );
        },
        animation: _animationController,
      ),
    );
  }

  Text _buildLabel(final BuildContext context) {
    return Text(
      widget.label,
    );
  }

  void _onToggle([final bool? initialValue]) {
    setState(() {
      isSelected.value = initialValue ?? !isSelected.value;

      isSelected.value
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }

  void _initDefault() {
    late Color init;
    if (widget.style == WillChipStyle.filled) {
      init = Colors.grey;
    } else {
      init = Colors.transparent;
    }
    _colorAnimation = ColorTween(
      begin: init,
      end: Colors.grey,
    ).animate(_animationController);

    _colorBorderAnimation = ColorTween(
      begin: Colors.grey,
      end: Colors.grey,
    ).animate(_animationController);

    _onToggle(widget.initSelected);
  }
}