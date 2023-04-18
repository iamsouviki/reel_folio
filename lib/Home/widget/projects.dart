import 'package:flutter/material.dart';
import 'package:reel_folio/Home/details.dart';
import 'package:reel_folio/Home/homepage.dart';
import 'package:reel_folio/Home/widget/projects_bottom_card.dart';
import 'package:reel_folio/Home/widget/projects_top_card.dart';
import 'package:reel_folio/route/route_path.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/size_config.dart';

import '../../Model/CategoryWiseProjectModel.dart';
import '../../Model/ProjectListModel.dart';
import '../../util/colors.dart';

Widget HomeProjects(BuildContext context, List<ProjectDetails> projectList,
    List<CategoryWiseProjectsData> categorywiseProjectList) {
  id = 1;
  return Column(
    children: [
      Container(
        width: screenWidth!,
        alignment: Alignment.center,
        child: const Text(
          "Reelfolio Picks",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      Container(
        height: screenHeight! * 400 / 950,
        margin: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: _horizontalList(projectList),
      ),
      Container(
        width: screenWidth!,
        alignment: Alignment.center,
        child: const Text(
          "Categories",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      Column(
          children: categorywiseProjectList
              .map(
                (e) => Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth! * 10 / 375),
                      child: Row(
                        children: [
                          Text(
                            e.name.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Detail(
                                    category: e.name.toString(),
                                    projects: e.projects!,
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              "See All",
                              style: TextStyle(
                                color: secondaryTextColor2,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.white.withOpacity(0.1),
                      indent: 10,
                      endIndent: 10,
                    ),
                    SizedBox(height: screenHeight! * 10 / 812),
                    SizedBox(
                      height: screenHeight! / 4,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: e.projects
                                ?.map(
                                  (pr) => SizedBox(
                                    height: screenHeight! / 4.5,
                                    child: CrewingUpCard(pr),
                                  ),
                                )
                                .toList() as List<Widget>),
                      ),
                    ),
                    SizedBox(height: screenHeight! * 10 / 812),
                  ],
                ),
              )
              .toList()),
    ],
  );
}

ListView _horizontalList(List<ProjectDetails> projectList) {
  return ListView(
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    children: projectList.map((e) => ProjectCard(e)).toList(),
  );
}
