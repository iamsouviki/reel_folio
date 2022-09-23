import 'package:flutter/material.dart';
import 'package:reel_folio/util/size_config.dart';

class UserPrimaryRoleWidget extends StatelessWidget {
  const UserPrimaryRoleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'WHAT IS YOU PRIMARY\nROLE',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontFamily: 'GT-America',
              letterSpacing: -0.1,
            ),
            textAlign: TextAlign.center,
          ),
          const Text(
            'Choose your main title. You only get to pick\none, so what are you known for?',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
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
                vertical: 6,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'i.e. Director, Foley Artist, Producer, \nColorist etc.',
                          style: TextStyle(
                              fontSize: screenWidth! * 14 / 375,
                              color: Color(0xFF474747)),
                        ),
                      ),
                    ],
                  ),
                  const TextCancelButtonWidget(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenWidth! * 10 / 375,
          ),
          ListWidget(),
          /*AnimatedContainer(
            duration: const Duration(microseconds: 600),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Directoral',
                      style: TextStyle(
                        fontSize: screenWidth! * 17 / 375,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 22,
                    ),
                  ],
                ),
                SizedBox(height: screenWidth! * 6 / 375,),
                const Divider(
                  color: Colors.white,
                ),
              ],
            ),
          ),*/
        ],
      ),
    );
  }
}

class TextCancelButtonWidget extends StatelessWidget {
  const TextCancelButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenWidth! * 30 / 375,
      width: screenWidth! * 30 / 375,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: Transform.rotate(
        angle: 2.35,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ListWidget extends StatefulWidget {
  const ListWidget({Key? key}) : super(key: key);

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

  int? selectedIndex;
  List<dynamic> dataList = [
    {
      "title": "Title 1",
      "items": [
        'Item 1',
        'Item 2',
        'Item 3',
        'Item 4',
      ],
    },
    {
      "title": "Title 2",
      "items": [
        "Item 1",
        "Item 2",
        "Item 3",
        "Item 4",
        "Item 5",
        "Item 6",
        "Item 7",
        "Item 8",
      ],
    },
    {
      "title": "Title 3",
      "items": [
        "Item 1",
        "Item 2",
        "Item 3",
        "Item 4",
      ],
    },
    {
      "title": "Title 4",
      "items": [
        "Item 1",
        "Item 2",
        "Item 3",
        "Item 4",
        "Item 5",
        "Item 6",
        "Item 7",
        "Item 8",
        "Item 9",
        "Item 10",
      ],
    },
    {
      "title": "Title 5",
      "items": [
        "Item 1",
        "Item 2",
        "Item 3",
        "Item 4",
        "Item 5",
        "Item 6",
        "Item 7",
      ],
    },
  ];

  final ValueNotifier _selectedItem = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ...category.map(
          (index) => Flexible(
            fit: FlexFit.loose,
            flex: selectedIndex == category.indexOf(index)
                ? (dataList[category.indexOf(index)]["items"].length / 3).ceil()
                : 1,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = category.indexOf(index);
                });
              },
              child: Container(
                child: Center(
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
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 22,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenWidth! * 6 / 375,
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      selectedIndex == category.indexOf(index)
                          ? Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10
                            ),
                            child: Wrap(
                        runSpacing: 20,
                        spacing: 20,
                        direction: Axis.horizontal,
                                alignment: WrapAlignment.spaceBetween,
                                runAlignment: WrapAlignment.start,
                                children: [
                                  ...dataList[category.indexOf(index)]["items"]
                                      .map(
                                    (e) => GestureDetector(
                                      onTap: (){
                                        _selectedItem.value = e;
                                      },
                                      child: ValueListenableBuilder(
                                        valueListenable: _selectedItem,
                                        builder: (BuildContext context, value, Widget? child) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              color: value == e ? Colors.white : Colors.black,
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(25)),
                                              border: Border.all(
                                                color: Colors.white,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 50,
                                                vertical: 12,
                                              ),
                                              child: Text(
                                                e,
                                                style: TextStyle(
                                                  color: value == e ? Colors.black :Colors.white,
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
