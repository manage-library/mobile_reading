import 'package:flutter/material.dart';

import '../constants.dart';

class TwoSideRoundedButton extends StatelessWidget {
  final String? text;
  final double radious;
  final VoidCallback? press;
  const TwoSideRoundedButton({
    Key? key,
    this.text,
    this.radious = 29,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: kBlackColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radious),
            bottomRight: Radius.circular(radious),
          ),
        ),
        child: Text(
          text ?? '',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
