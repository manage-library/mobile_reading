
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
class SvgIconWidget extends StatelessWidget {
  final SvgPicture child;
  final String name;
  final Color? color;
  final double? size;

  SvgIconWidget({Key? key,
    required this.name,
    this.color,
    this.size}): child = SvgPicture.asset(name,
    width: size ?? 24,
    height: size ?? 24,
    color: color,
  ), super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}