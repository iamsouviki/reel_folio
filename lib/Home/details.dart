import 'package:flutter/material.dart';
import 'package:reel_folio/Home/widget/project_category_detail_navbar.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

import '../Api/config.dart';
import '../Model/CategoryWiseProjectModel.dart';

class Detail extends StatefulWidget {
  final String category;
  final List<Projects> projects;
  Detail({Key? key, required this.category, required this.projects})
      : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: primarybgcolor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight! * 190 / 1050),
          child: ProjectCategoryNavbar(context, widget.category),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: screenHeight!,
            padding: const EdgeInsets.all(15),
            child: _gridList(widget.projects),
          ),
        ),
      ),
    );
  }
}

Widget _gridList(List<Projects> projects) {
  return GridView.builder(
    itemCount: projects.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 20,
    ),
    itemBuilder: (BuildContext context, int index) {
      return Container(
        height: screenHeight! / 2.8,
        width: screenWidth! / 1.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 1.2,
                    ),
                  ),
                  height: screenHeight! / 6.2,
                  width: screenWidth! / 1.8,
                  child: Image.network(
                    "$IMAGE_BASE_URL/${projects[index].thumbnail ?? ''}",
                    fit: BoxFit.cover,
                  ),
                ),
                projects[index].type == 'hiring'
                    ? Positioned(
                        top: 10,
                        left: screenWidth! / 2.8,
                        child: Container(
                          height: 20,
                          width: 36,
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            color: tagcolor1,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                          ),
                          child: const Text(
                            "Hiring",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              width: screenWidth! / 1.5,
              child: Text(
                projects[index].title.toString(),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'GT-America-Extended-Bold',
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 5,
              ),
              width: screenWidth! / 1.5,
              height: 14,
              child: Text(
                projects[index].details.toString().replaceAll("\n", ""),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: secondaryTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}

