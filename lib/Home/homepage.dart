import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:reel_folio/Api/api.dart';
import 'package:reel_folio/Api/config.dart';
import 'package:reel_folio/Home/widget/navbar.dart';
import 'package:reel_folio/Home/widget/people.dart';
import 'package:reel_folio/Home/widget/projects.dart';
import 'package:reel_folio/Home/widget/projects_bottom_card.dart';
import 'package:reel_folio/Home/widget/projects_top_card.dart';
import 'package:reel_folio/Model/CategoryWiseProjectModel.dart';
import 'package:reel_folio/Model/PeoplelistModel.dart';
import 'package:reel_folio/Model/ProjectListModel.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';
import 'package:reel_folio/widget/bottom_navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../user_preferences.dart';

var id = 0;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  late TabController _tabController;
  List<ProjectDetails> projectList = [];
  List<PeopleData> peopleList = [];
  List<CategoryWiseProjectsData> categorywiseProjectList = [];
  UserPreferences get _preferences => GetIt.I<UserPreferences>();

  Future getProjectList() async {
    final preferences =
    await SharedPreferences.getInstance();
    var token = await preferences.get('access_token').toString();
    var response = await Api().getMethod(GET_PROJECT_LIST_URL, token);
    ProjectListModel projectListModel = ProjectListModel.fromJson(response);
    setState(() {
      projectList = projectListModel.data!;
    });
  }

  Future getPeopleList() async {
    final preferences =
    await SharedPreferences.getInstance();
    var token = await preferences.get('access_token').toString();
    var response = await Api().getMethod(PEOPLE_LIST_URL, token!);
    PeoplelistModel peoplelistModel = PeoplelistModel.fromJson(response);
    setState(() {
      peopleList = peoplelistModel.data!;
    });
  }

  Future getCategorywiseProjectList() async {
    final preferences =
    await SharedPreferences.getInstance();
    var token = await preferences.get('access_token').toString();
    var response =
        await Api().getMethod(GET_CATEGORYWISE_PROJECT_LIST_URL, token!);
    CategoryWiseProjectModel categoryWiseProjectModel =
        CategoryWiseProjectModel.fromJson(response);
    setState(() {
      categorywiseProjectList = categoryWiseProjectModel.data!;
    });
  }

  @override
  void initState() {
    super.initState();
    getProjectList();
    getPeopleList();
    getCategorywiseProjectList();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight! * 190 / 1000),
          child: HomeNavbar(context, _tabController),
        ),
        backgroundColor: primarybgcolor,
        body: Container(
          height: screenHeight!,
          width: screenWidth,
          color: primarybgcolor,
          child: DefaultTabController(
            length: 2,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView(
                  shrinkWrap: true,
                  children: [
                    projectList.isEmpty || categorywiseProjectList.isEmpty
                        ? Shimmer.fromColors(
                            baseColor: Colors.white,
                            highlightColor: Colors.grey,
                            child: projectShimmer(),
                          )
                        : HomeProjects(
                            context, projectList, categorywiseProjectList),
                  ],
                ),
                peopleList.isEmpty
                    ? Shimmer.fromColors(
                        baseColor: Colors.white,
                        highlightColor: Colors.grey,
                        child: peopleShimmer(),
                      )
                    : HomePeople(peopleList),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 55,
          child: BottomNavBar(context),
        ),
      ),
    );
  }
}

Widget peopleShimmer() {
  return GridView.builder(
    itemCount: 5,
    padding: const EdgeInsets.all(10),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 15,
    ),
    itemBuilder: (BuildContext context, int index) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 1.2,
              ),
            ),
            height: screenHeight! / 8,
            width: screenWidth! / 2.2,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5,),
              Container(
                height: 20,
                width: screenWidth! / 3.2,
                color: Colors.black,
              ),
              const SizedBox(height: 5),
              Container(
                height: 10,
                width: screenWidth! / 4.2,
                color: Colors.black,
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: screenWidth! * 0.1),
            child: ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(68, 26)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: const BorderSide(width: 1.5, color: Colors.white),
                  ),
                ),
              ),
              onPressed: () {},
              child: Container(
                height: 8,
                width: screenWidth! / 4,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(0),
            child: const Divider(
              color: Colors.grey,
              height: 0.5,
            ),
          ),
        ],
      );
    },
  );
}

Widget projectShimmer() {
  return Column(
    children: [
      Container(
        width: screenWidth!,
        alignment: Alignment.center,
        child: Container(
          height: 30,
          width: screenWidth! / 2.2,
          color: Colors.black,
        ),
      ),
      Container(
        height: screenHeight! * 400 / 950,
        margin: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [1, 2, 3]
              .map(
                (e) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                            height: screenHeight! / 3,
                            width: screenWidth! / 1.5,
                          ),
                          Positioned(
                            top: 10,
                            left: screenWidth! / 1.85,
                            child: Container(
                              height: 20,
                              width: 54,
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                color: tagcolor1,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 12,
                        width: screenWidth! / 3,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 25,
                        width: screenWidth! / 2,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.only(left: screenWidth! * 0.3),
                        width: screenWidth! / 3,
                        height: 15,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
      Container(
        width: screenWidth!,
        alignment: Alignment.center,
        child: Container(
          height: 30,
          width: screenWidth! / 2.2,
          color: Colors.black,
        ),
      ),
      Column(
        children: [1, 2, 3]
            .map(
              (e) => Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth! * 10 / 375),
                    child: Row(
                      children: [
                        Container(
                          height: 20,
                          width: screenWidth! / 3,
                          color: Colors.black,
                        ),
                        const Spacer(),
                        Container(
                          height: 20,
                          width: screenWidth! / 6,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.black,
                    indent: 10,
                    endIndent: 10,
                  ),
                  SizedBox(height: screenHeight! * 10 / 812),
                  SizedBox(
                    height: screenHeight! / 4,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [1, 2]
                            .map(
                              (pr) => SizedBox(
                                height: screenHeight! / 4.5,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth! * 10 / 375),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                            height: screenHeight! / 6.5,
                                            width: screenWidth! / 1.5,
                                          ),
                                          Positioned(
                                            top: 10,
                                            left: screenWidth! / 1.85,
                                            child: Container(
                                              height: 20,
                                              width: 54,
                                              padding: const EdgeInsets.all(2),
                                              decoration: const BoxDecoration(
                                                color: tagcolor1,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(5),
                                                  bottomRight:
                                                      Radius.circular(5),
                                                ),
                                              ),
                                              child: const Text(
                                                "Hiring",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        width: screenWidth! / 2.5,
                                        color: Colors.black,
                                        height: 20,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                          top: 10,
                                        ),
                                        width: screenWidth! / 3.5,
                                        height: 20,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight! * 10 / 812),
                ],
              ),
            )
            .toList(),
      ),
    ],
  );
}
