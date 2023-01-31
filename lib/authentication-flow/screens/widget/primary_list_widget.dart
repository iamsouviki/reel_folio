import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:reel_folio/authentication-flow/screens/user_details_screen.dart';
import 'package:reel_folio/authentication-flow/services/auth_service.dart';
import '../../../util/size_config.dart';
import '../../manager/role_selection_manager.dart';

class PrimaryListWidget extends ConsumerStatefulWidget {
  //final ValueChanged<String> onValueChanged;

  const PrimaryListWidget({Key? key}) : super(key: key);

  @override
  PrimaryListWidgetState createState() => PrimaryListWidgetState();
}

class PrimaryListWidgetState extends ConsumerState {
  //final ValueNotifier _selectedItem = ValueNotifier<String>('');

  final ValueNotifier _selectedIndex = ValueNotifier<int>(10);

  OnBoardingUserDetailsModel get _userModel => GetIt.I<OnBoardingUserDetailsModel>();

  @override
  Widget build(BuildContext context) {
    var text = ref.watch(primaryRoleManager);

    var userRole = ref.watch(userRoleProvider);

    return userRole.map(
      data: (roleData) => ValueListenableBuilder(
        valueListenable: _selectedIndex,
        builder: (BuildContext context, value, Widget? child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (text.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Wrap(
                    runSpacing: 20,
                    spacing: 20,
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.spaceBetween,
                    runAlignment: WrapAlignment.start,
                    children: [
                      //...dataList[category.indexOf(index)]["items"]
                      ...roleData.value!.data!
                          .where((element) => element.name == text)
                          .toList()
                          .map(
                            (e) => GestureDetector(
                              onTap: () {
                                //_selectedItem.value = e;
                                //widget.onValueChanged(e);
                                ref.read(primaryRole.notifier).state = e.name!;
                                ref.read(primaryRoleManager.notifier).state =
                                    e.name!;
                              },
                              child: Container(
                                height: 40,
                                width: screenWidth! / 3,
                                decoration: BoxDecoration(
                                  color: ref.watch(primaryRole) == e.name
                                      ? Colors.white
                                      : Colors.black,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(25)),
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    e.name!,
                                    style: TextStyle(
                                      color: ref.watch(primaryRole) == e.name
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      // ListTile(title:Text(dataList[category.indexOf(index)]["items"].toString()))
                    ],
                  ),
                ),
              ...roleData.value!.data!.map(
                (index) => Flexible(
                  fit: FlexFit.loose,
                  flex: value == index.name
                      //? (dataList[category.indexOf(index)]["items"].length / 3).ceil() ?
                      ? (index.skills!.length / 3).ceil()
                      : 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            index.name!,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print(value);
                              if (value == index.name) {
                                _selectedIndex.value = 10;
                              } else {
                                _selectedIndex.value = roleData.value!.data!
                                    .map((e) => e.name!)
                                    .toList()
                                    .indexOf(index.name!);
                              }
                            },
                            child: Transform.rotate(
                              angle: value == index.name ? 3.1 : 0,
                              child: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenWidth! * 6 / 375,
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      value! == roleData.value!.data!.indexOf(index)
                          ? Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Wrap(
                                runSpacing: 20,
                                spacing: 20,
                                direction: Axis.horizontal,
                                alignment: WrapAlignment.spaceBetween,
                                runAlignment: WrapAlignment.start,
                                children: [
                                  //...dataList[category.indexOf(index)]["items"]
                                  ...index.skills!.map(
                                    (e) => Consumer(
                                      builder: (BuildContext context,
                                          WidgetRef ref, Widget? child) {
                                        return GestureDetector(
                                          onTap: () {

                                            _userModel.primarySkill = e.id!;

                                            ref
                                                .read(primaryRole.notifier)
                                                .state = e.name!;
                                            //widget.onValueChanged(e);
                                            ref
                                                .read(
                                                    primaryRoleManager.notifier)
                                                .state = e.name!;
                                          },
                                          child: Container(
                                            height: 40,
                                            width: screenWidth! / 3,
                                            decoration: BoxDecoration(
                                              color: ref.watch(primaryRole) ==
                                                      e.name
                                                  ? Colors.white
                                                  : Colors.black,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(25)),
                                              border: Border.all(
                                                color: Colors.white,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                e.name!,
                                                style: TextStyle(
                                                  color:
                                                      ref.watch(primaryRole) ==
                                                              e.name
                                                          ? Colors.black
                                                          : Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  // ListTile(title:Text(dataList[category.indexOf(index)]["items"].toString()))
                                ],
                              ),
                            )
                          : SizedBox(),
                      SizedBox(
                        height: screenWidth! * 15 / 375,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
      error: (__) => const Text(''),
      loading: (_) => const CupertinoActivityIndicator(),
    );
  }
}
