import 'package:flutter/material.dart';
import 'package:reel_folio/util/size_config.dart';

class RoleScreenSubTitleWidget extends StatelessWidget {
  const RoleScreenSubTitleWidget({
    Key? key,
    required String data,
  })  : _data = data,
        super(key: key);

  final String _data;

  @override
  Widget build(BuildContext context) {
    return Text(
      _data,
      style: TextStyle(
        fontSize: screenWidth! * 13 / 375,
        letterSpacing: -0.1,
        color: Colors.white.withOpacity(0.4),
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
