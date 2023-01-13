import 'package:flutter/material.dart';

import '../../../../util/size_config.dart';

class SecondaryListWidget extends StatefulWidget {
  final ValueChanged<List<String>> onValueChanged;

  const SecondaryListWidget({Key? key, required this.onValueChanged}) : super(key: key);

  @override
  State<SecondaryListWidget> createState() => _SecondaryListWidgetState();
}

class _SecondaryListWidgetState extends State<SecondaryListWidget> {
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