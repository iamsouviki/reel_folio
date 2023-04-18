import 'package:flutter/material.dart';

import '../../util/size_config.dart';

Widget aboutMovieWidget(String tag, String text) {
  return Container(
    width: screenWidth,
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: screenWidth! * 0.3,
          child: Text(tag, style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 15,
              fontWeight: FontWeight.w400)),
        ),
        Flexible(
          child: Text(text,
              // overflow: TextOverflow.ellipsis,
              style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w400)),
        ),
        SizedBox(height: 20,)
      ],
    ),
  );
}

