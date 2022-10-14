import 'package:flutter/material.dart';
import 'package:reel_folio/onboarding/widget/tools/screen_sub_title_widget.dart';
import 'package:reel_folio/onboarding/widget/tools/screen_title_widget.dart';

import '../../util/size_config.dart';
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
          ListWidget(
            onValueChanged: (val) {
              primaryRoleNotifier.value = val;
            },
          ),
        ],
      ),
    );
  }
}



class ListWidget extends StatefulWidget {
  final ValueChanged<List<String>> onValueChanged;

  const ListWidget({Key? key, required this.onValueChanged}) : super(key: key);

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  List<String> category = [
    'Directoral',
    'Production',
    'Cast',
    'Sound',
  ];

  List<dynamic> items = [
    'Director',
    'Producer',
    'Casting Assistant',
    'Editor',
  ];

  final ValueNotifier<List<String>> _selectedItem =
      ValueNotifier<List<String>>(['']);

  final ValueNotifier _selectedIndex = ValueNotifier<int>(10);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _selectedIndex,
      builder: (BuildContext context, value, Widget? child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ...category.map(
              (index) => Flexible(
                fit: FlexFit.loose,
                flex: value == category.indexOf(index)
                    //? (dataList[category.indexOf(index)]["items"].length / 3).ceil() ?
                    ? (items.length / 3).ceil()
                    : 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          index,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (value == category.indexOf(index)) {
                              _selectedIndex.value = 10;
                            } else {
                              _selectedIndex.value = category.indexOf(index);
                            }
                          },
                          child: Transform.rotate(
                            angle: value == category.indexOf(index) ? 3.1 : 0,
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
                    value! == category.indexOf(index)
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
                                ...items.map(
                                  (e) => GestureDetector(
                                    onTap: () {
                                      if (_selectedItem.value.contains(e)) {
                                        _selectedItem.value =
                                            List.from(_selectedItem.value)
                                              ..remove(e);
                                        widget.onValueChanged(
                                            _selectedItem.value);
                                      } else {
                                        _selectedItem.value =
                                            List.from(_selectedItem.value)
                                              ..add(e);
                                        widget.onValueChanged(
                                            _selectedItem.value);
                                      }
                                    },
                                    child: ValueListenableBuilder(
                                      valueListenable: _selectedItem,
                                      builder: (BuildContext context,
                                          List<String> value, Widget? child) {
                                        print(value.toString());
                                        return Container(
                                          height: 40,
                                          width: screenWidth! / 3,
                                          decoration: BoxDecoration(
                                            color: value.contains(e)
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
                                              e,
                                              style: TextStyle(
                                                color: value.contains(e)
                                                    ? Colors.black
                                                    : Colors.white,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
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
    );
  }
}