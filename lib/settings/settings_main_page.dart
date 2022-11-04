import 'package:flutter/material.dart';
import 'package:reel_folio/settings/widgets/app_bar_widget.dart';
import 'package:reel_folio/settings/widgets/row_widget.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/reel_folio_icon.dart';
import 'package:reel_folio/util/size_config.dart';

class SettingsMainPage extends StatelessWidget {
  const SettingsMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
          backgroundColor: ReelfolioColor.shadowColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SettingsAppBarWidget(
                title: "Settings",
              ),
              Divider(
                color: Colors.white.withOpacity(0.6),
                thickness: 1,
              ),
              SettingsRowWidget(
                icon: ReelFolioIcon.iconUser,
                title: 'Edit Portfolio',
              ),
              Divider(
                color: Colors.white.withOpacity(0.4),
                thickness: 1,
              ),
              SettingsRowWidget(
                icon: ReelFolioIcon.iconHelpCircle,
                title: 'Terms Of Service',
              ),
              Divider(
                color: Colors.white.withOpacity(0.4),
                thickness: 1,
              ),
              SettingsRowWidget(
                icon: ReelFolioIcon.iconNotificationBell,
                title: 'Account and Notifications',
              ),
              Divider(
                color: Colors.white.withOpacity(0.4),
                thickness: 1,
              ),
              SettingsRowWidget(
                icon: ReelFolioIcon.iconSaveSmall,
                title: 'Saved',
              ),
              Divider(
                color: Colors.white.withOpacity(0.4),
                thickness: 1,
              ),
              SettingsRowWidget(
                icon: ReelFolioIcon.iconPlusSquare,
                title: 'Contacts',
              ),
              Divider(
                color: Colors.white.withOpacity(0.4),
                thickness: 1,
              ),
            ],
          ),
        ));
  }
}
