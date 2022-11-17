import 'package:flutter/material.dart';

class ProjectDetailWidget extends StatelessWidget {
  const ProjectDetailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Detail",
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
        ),
        Text(
          "This is ongoing description of \nall the details related to this \nproject. we shoot here and \nwe’re looking for this kind of \narrange and this schedule on \nteh required shoot days.",
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
          overflow: TextOverflow.clip,
          maxLines: 5,
        ),
      ],
    );
  }
}
