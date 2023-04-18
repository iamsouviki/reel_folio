import 'package:flutter/material.dart';
import 'package:reel_folio/Saved/saved_screen.dart';
import 'package:reel_folio/Portfolio/portfolio_edit.dart';
import 'package:reel_folio/settings/account_notifications_page.dart';
import 'package:reel_folio/settings/settings_terms_page.dart';
import 'package:reel_folio/settings/widgets/app_bar_widget.dart';
import 'package:reel_folio/settings/widgets/row_widget.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/reel_folio_icon.dart';
import 'package:reel_folio/util/size_config.dart';

import '../Contacts/contacts_main_list.dart';

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
              const SettingsAppBarWidget(
                title: "Settings",
              ),
              Divider(
                color: Colors.white.withOpacity(0.6),
                thickness: 1,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PortfolioEditPage()),
                  );
                },
                child: const SettingsRowWidget(
                  icon: ReelFolioIcon.iconUser,
                  title: 'Edit Portfolio',
                ),
              ),
              Divider(
                color: Colors.white.withOpacity(0.4),
                thickness: 1,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsTermsPage()),
                  );
                },
                child: const SettingsRowWidget(
                  icon: ReelFolioIcon.iconHelpCircle,
                  title: 'Terms Of Service',
                ),
              ),
              Divider(
                color: Colors.white.withOpacity(0.4),
                thickness: 1,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsAccountPage(),
                    ),
                  );
                },
                child: const SettingsRowWidget(
                  icon: ReelFolioIcon.iconNotificationBell,
                  title: 'Account and Notifications',
                ),
              ),
              Divider(
                color: Colors.white.withOpacity(0.4),
                thickness: 1,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SavedScreen(),
                    ),
                  );
                },
                child: const SettingsRowWidget(
                  icon: ReelFolioIcon.iconSaveSmall,
                  title: 'Saved',
                ),
              ),
              Divider(
                color: Colors.white.withOpacity(0.4),
                thickness: 1,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ContactsMain(),
                    ),
                  );
                },
                child: const SettingsRowWidget(
                  icon: ReelFolioIcon.iconPlusSquare,
                  title: 'Contacts',
                ),
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
