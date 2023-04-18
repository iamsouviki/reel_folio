import 'package:flutter/material.dart';
import 'package:reel_folio/project_page/widgets/open_position_row_widget.dart';

class OpenPositionsWidget extends StatelessWidget {
  const OpenPositionsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            Text(
              "Open Positions",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                OpenPositionRowWidget(),
                Divider(
                  color: Colors.white.withOpacity(0.4),
                  thickness: 1,
                ),
                OpenPositionRowWidget(),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
                OpenPositionRowWidget(),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
