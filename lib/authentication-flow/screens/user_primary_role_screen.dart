import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reel_folio/util/size_config.dart';
import '../../util/reel_folio_input_decoration.dart';
import '../manager/role_selection_manager.dart';
import 'widget/primary_list_widget.dart';
import 'widget/screen_sub_title_widget.dart';
import 'widget/screen_title_widget.dart';
import 'widget/text_cancel_button_widget.dart';



class UserPrimaryRoleScreen extends StatelessWidget {
  UserPrimaryRoleScreen({Key? key}) : super(key: key);

  final ValueNotifier<String> primaryRoleNotifier = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AspectRatio(
            aspectRatio: 375 / 50,
            child: SizedBox(),
          ),
          const ScreenTitleWidget(
            text: 'WHAT IS YOUR PRIMARY\nROLE',
            textAlign: TextAlign.center,
          ),
          const AspectRatio(
            aspectRatio: 375 / 60,
            child: SizedBox(),
          ),
          const ScreenSubTitleWidget(
            text:
            'Choose your main title. You only get to pick one, so what are you known for?',
            textAlign: TextAlign.center,
          ),
          const AspectRatio(
            aspectRatio: 375 / 15,
            child: SizedBox(),
          ),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              String text = ref.watch(primaryRoleManager);
              TextEditingController controller = TextEditingController();
              controller.text = text;
              controller.selection =
                  TextSelection.fromPosition(TextPosition(offset: text.length));
              return TextFormField(
                //controller: firstNameController,
                //validator: validator,
                controller: controller,
                cursorColor: Colors.white,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                maxLines: text.isNotEmpty ? 1 : 2,
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.justify,
                decoration: textInputDecoration(
                  context: context,
                  hintText:
                  'i.e. Director, Foley Artist, Producer, \nColorist etc.',
                ).copyWith(
                  suffix: text.isNotEmpty
                      ? GestureDetector(
                    onTap: () {
                      ref
                          .read(primaryRoleManager.notifier)
                          .state = '';
                      ref
                          .read(primaryRole.notifier)
                          .state = '';
                      controller.text = '';
                    },
                    child: const TextCancelButtonWidget(),
                  )
                      : const SizedBox(),
                ),
                onChanged: (val) {
                  ref
                      .read(primaryRoleManager.notifier)
                      .state = val;
                  if (val.isEmpty) {
                    ref
                        .read(primaryRole.notifier)
                        .state = '';
                  }
                },
              );
            },
          ),
          SizedBox(
            height: screenWidth! * 20 / 375,
          ),
          const PrimaryListWidget(
            /*onValueChanged: (val) {
              primaryRoleNotifier.value = val;
            },*/
          ),
        ],
      ),
    );
  }
}




