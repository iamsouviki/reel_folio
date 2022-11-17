import 'package:flutter/material.dart';
import 'package:reel_folio/roles/widgets/app_bar_widget.dart';
import 'package:reel_folio/roles/widgets/roles_item_widget.dart';
import 'package:reel_folio/roles/widgets/tools/role_screen_subtitle_widget.dart';
import 'package:reel_folio/roles/widgets/tools/role_screen_title_widget.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/reel_folio_icon.dart';
import 'package:reel_folio/util/size_config.dart';

class SeeCandidatesPage extends StatelessWidget {
  SeeCandidatesPage({super.key});

  final roles = ["Director", "Producer", "Writer", "Cinematographer"];
  final ValueNotifier<List<String>> roleNotifier =
      ValueNotifier<List<String>>(["Director", "Writer"]);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: ReelfolioColor.shadowColor,
        body: Column(
          children: [
            RolesAppBar(title: "Roles & Applications"),
            Divider(
              color: Colors.white.withOpacity(0.6),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight! * 32 / 812,
                  bottom: screenHeight! * 16 / 812),
              child: RoleScreenTitleWidget(
                text: "PROJECT TITLE",
                textAlign: TextAlign.center,
              ),
            ),
            RoleScreenSubTitleWidget(data: "Shoot In 30 Days"),
            Padding(
              padding: EdgeInsets.only(top: screenHeight! * 20 / 812),
              child: Divider(
                color: Colors.white.withOpacity(0.6),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth! * 0.04,
                  vertical: screenHeight! * 0.02),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: roles.length,
                  itemBuilder: ((context, index) {
                    return RolesItemWidget(
                      body: roles[index],
                    );
                  })),
              // Expanded(
              //   flex: 5,
              //   child: ValueListenableBuilder(
              //       valueListenable: roleNotifier,
              //       builder: (BuildContext context, List<String> list,
              //           Widget? child) {
              //         final roles = roleNotifier.value;
              //         print(roles);
              //         return ListView.builder(
              //             shrinkWrap: true,
              //             itemCount: roles.length,
              //             itemBuilder: ((context, index) {
              //               return RolesItemWidget(
              //                 body: roles[index],
              //               );
              //             }));
              //       }),
              // return RolesItemWidget(body: roles[list]);
              // return Text(
              //   textAlign: TextAlign.left,
              //   list.isEmpty
              //       ? 'i.e. Director, Foley Artist, Producer, \nColorist etc.'
              //       : list.join(' '),
              //   style: TextStyle(
              //     fontSize: screenWidth! * 14 / 375,
              //     color: list.isEmpty
              //         ? const Color(0xFF474747)
              //         : Colors.white,
              //   ),
              // );
              //   },
              // ),
              // ),
            ),
            Spacer(
              flex: 3,
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: ReelfolioColor.shadowColor,
                side: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
              ),
              child: Text(
                'Add Roles',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
