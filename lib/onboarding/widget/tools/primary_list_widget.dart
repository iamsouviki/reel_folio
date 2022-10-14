import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../util/size_config.dart';
import '../../manager/role_selection_manager.dart';

class PrimaryListWidget extends ConsumerStatefulWidget {
  //final ValueChanged<String> onValueChanged;

  const PrimaryListWidget({Key? key}) : super(key: key);

  @override
  PrimaryListWidgetState createState() => PrimaryListWidgetState();
}

class PrimaryListWidgetState extends ConsumerState {
  List<String> category = [
    'Directoral',
    /* 'Production',
    'Cast',
    'Sound',*/
  ];

  List<String> items = [
    'Director',
    'Producer',
    'Casting Assistant',
    'Editor',
    'Assistant Director',
    'Sound Director',
  ];

  //final ValueNotifier _selectedItem = ValueNotifier<String>('');

  final ValueNotifier _selectedIndex = ValueNotifier<int>(10);

  @override
  Widget build(BuildContext context) {
    var text = ref.watch(primaryRoleManager);

    return ValueListenableBuilder(
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
                    ...items
                        .where((element) => element.contains(text))
                        .toList()
                        .map(
                          (e) => GestureDetector(
                        onTap: () {
                          //_selectedItem.value = e;
                          //widget.onValueChanged(e);
                          ref.read(primaryRole.notifier).state = e;
                          ref.read(primaryRoleManager.notifier).state = e;
                        },
                        child: Container(
                          height: 40,
                          width: screenWidth! / 3,
                          decoration: BoxDecoration(
                            color: ref.watch(primaryRole) == e
                                ? Colors.white
                                : Colors.black,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              e,
                              style: TextStyle(
                                color: ref.watch(primaryRole) == e
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
                                (e) => Consumer(
                              builder: (BuildContext context,
                                  WidgetRef ref, Widget? child) {
                                return GestureDetector(
                                  onTap: () {
                                    ref.read(primaryRole.notifier).state =
                                        e;
                                    //widget.onValueChanged(e);
                                    ref
                                        .read(primaryRoleManager.notifier)
                                        .state = e;
                                  },
                                  child: Container(
                                    height: 40,
                                    width: screenWidth! / 3,
                                    decoration: BoxDecoration(
                                      color: ref.watch(primaryRole) == e
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
                                          color:
                                          ref.watch(primaryRole) == e
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
    );
  }
}