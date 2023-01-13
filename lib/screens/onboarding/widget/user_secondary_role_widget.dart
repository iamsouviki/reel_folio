import 'package:flutter/material.dart';
import 'package:reel_folio/screens/onboarding/widget/tools/screen_title_widget.dart';

import '../../../util/size_config.dart';
import 'tools/screen_sub_title_widget.dart';
import 'tools/secondary_list_widget.dart';
import 'tools/text_cancel_button_widget.dart';

class UserSecondaryRoleWidget extends StatelessWidget {
  UserSecondaryRoleWidget({Key? key}) : super(key: key);

  final ValueNotifier<List<String>> primaryRoleNotifier =
      ValueNotifier<List<String>>(['']);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AspectRatio(
            aspectRatio: 375 / 50,
            child: SizedBox(),
          ),
          const ScreenTitleWidget(text: 'WHAT IS YOUR OTHER\nSKILLS',textAlign: TextAlign.center,),
          const AspectRatio(
            aspectRatio: 375 / 60,
            child: SizedBox(),
          ),
          const ScreenSubTitleWidget(
            text:
                'Choose whatever you are good at and have done in past. Pick all that apply',
            textAlign: TextAlign.center,
          ),
          const AspectRatio(
            aspectRatio: 375 / 50,
            child: SizedBox(),
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: 60),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              border:
                  Border.all(color: const Color(0xFFFFFFFF).withOpacity(0.5)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: ValueListenableBuilder(
                      valueListenable: primaryRoleNotifier,
                      builder: (BuildContext context, List<String> list,
                          Widget? child) {
                        return Text(
                          textAlign: TextAlign.left,
                          list.isEmpty
                              ? 'i.e. Director, Foley Artist, Producer, \nColorist etc.'
                              : list.join(' '),
                          style: TextStyle(
                            fontSize: screenWidth! * 14 / 375,
                            color: list.isEmpty
                                ? const Color(0xFF474747)
                                : Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                  const TextCancelButtonWidget(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenWidth! * 20 / 375,
          ),
          SecondaryListWidget(
            onValueChanged: (val) {
              primaryRoleNotifier.value = val;
            },
          ),
        ],
      ),
    );
  }
}




