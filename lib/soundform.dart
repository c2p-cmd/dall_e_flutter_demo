import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SoundWidget extends HookWidget {
  final int count;
  final double minHeight, maxHeight;
  const SoundWidget(
      {Key? key, this.count = 6, this.minHeight = 10.0, this.maxHeight = 30.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 850),
    )..repeat();
    return AnimatedBuilder(
      animation: controller,
      builder: (ctx, child) {
        final double t = controller.value;
        final int current = (count * t).floor();
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            count,
            (index) => AnimatedContainer(
              duration: Duration(milliseconds: 800 ~/ count),
              margin: index == (count - 1)
                  ? EdgeInsets.zero
                  : const EdgeInsets.only(right: 5),
              width: 5,
              height: index == current ? maxHeight : minHeight,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(999999),
              ),
            ),
          ),
        );
      },
    );
  }
}
