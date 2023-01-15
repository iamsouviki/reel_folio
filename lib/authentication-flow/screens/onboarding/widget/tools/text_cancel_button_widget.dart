import 'package:flutter/material.dart';

import '../../../../../util/size_config.dart';

class TextCancelButtonWidget extends StatelessWidget {
  const TextCancelButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenWidth! * 22 / 375,
      width: screenWidth! * 22 / 375,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Transform.rotate(
        angle: 2.35,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 15,
        ),
      ),
    );
  }
}