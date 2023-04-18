import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:reel_folio/Model/PortfolioModel.dart';
import 'package:reel_folio/Portfolio/widget/popup.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/reel_folio_icon.dart';
import 'package:shimmer/shimmer.dart';
import '../Api/api.dart';
import '../Api/config.dart';
import '../user_preferences.dart';
import '../util/size_config.dart';

// Building the page in 1 widget. Will break later.

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  UserPreferences get _preferences => GetIt.I<UserPreferences>();
  PortfolioUserData? portfolioUserData;

  getPortfolioDetails() async {
    var token = await _preferences.getAccessToken();
    var response = await Api().getMethod(MY_PORTFOLIO_URL, token!);
    PortfolioModel portfolioModel = PortfolioModel.fromJson(response);
    setState(() {
      portfolioUserData = portfolioModel.data;
    });
  }

  @override
  void initState() {
    super.initState();
    getPortfolioDetails();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: ReelfolioColor.shadowColor,
        // TODO: Fix AppBar transparent issue
        body: SingleChildScrollView(
          child: portfolioUserData == null
              ? Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: Colors.grey,
                  child: portfolioLoader(),
                )
              : Column(
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          '$IMAGE_BASE_URL/${portfolioUserData!.coverPicture}',
                          errorBuilder: (x, y, z) => Image.asset(
                            ReelfolioImageAsset.portfolioReelPreview,
                            fit: BoxFit.fitWidth,
                          ),
                          fit: BoxFit.fitWidth,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth! * 0.05,
                                  vertical: screenHeight! * 0.03),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    child: Image.asset(
                                      ReelFolioIcon.iconArrowBackward,
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  InkWell(
                                    onTap: () => showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return PopUp(context);
                                        }),
                                    child: Image.asset(
                                      ReelFolioIcon.iconMenu,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: screenHeight! / 60,
                            ),
                            Container(
                              height: screenHeight! * 0.465,
                              width: screenWidth!,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    ReelfolioColor.shadowColor.withOpacity(0),
                                    ReelfolioColor.shadowColor.withOpacity(0.8),
                                  ],
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth! * 0.05),
                                        child: Image.asset(
                                            ReelFolioIcon.reelPlayButton),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth! * 0.08),
                                        child: Text(
                                          portfolioUserData!.name ?? '',
                                          style: const TextStyle(
                                            fontFamily:
                                                "GT-America-Extended-Bold",
                                            fontWeight: FontWeight.w900,
                                            fontSize: 50,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth! * 0.08,
                                            vertical: screenHeight! * 0.03),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              portfolioUserData!
                                                      .primarySkill!.name ??
                                                  '',
                                              style: const TextStyle(
                                                fontFamily:
                                                    "GT-America-Extended-Bold",
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Image.asset(
                                                ReelFolioIcon.saveButton),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth! * 0.08,
                          vertical: screenHeight! * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff394A71),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: InkWell(
                              onTap: () {},
                              child: const Text(
                                "Add to Contacts",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Image.asset(ReelFolioIcon.iconArrowDownward),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth! * 0.1,
                        vertical: screenHeight! * 0.005,
                      ),
                      width: screenWidth!,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                              '$IMAGE_BASE_URL/${portfolioUserData!.profilePicture}',
                            ),
                            backgroundColor: Colors.transparent,
                            // child: Image.network(
                            //   '$IMAGE_BASE_URL/${portfolioUserData.profilePicture}',
                            //   errorBuilder: (x, y, z) => Image.asset(
                            //     ReelfolioImageAsset.portfolioReelPreview,
                            //     fit: BoxFit.fitWidth,
                            //   ),
                            //   fit: BoxFit.fitWidth,
                            // ),
                          ),
                          Flexible(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                portfolioUserData!.bio ?? '',
                                overflow: TextOverflow.clip,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: screenHeight! * 0.06,
                      width: screenWidth!,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth! * 0.03),
                            child: const Text(
                              "Skills",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const VerticalDivider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: screenHeight! * 0.01,
                            ),
                            width: screenWidth! * 0.80,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              reverse: false,
                              // Hardcoded for now
                              itemCount: portfolioUserData!.skills?.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth! * 0.02),
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                            color: Colors.white, width: 1),
                                        minimumSize:
                                            Size(screenWidth! * 0.2, 30),
                                        backgroundColor: Colors.transparent,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth! * 0.04,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        )),
                                    child: Text(
                                      portfolioUserData!.skills?[index].name
                                              .toString() ??
                                          '',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Colors.white),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth! * 0.03,
                        vertical: screenHeight! * 0.01,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "My Work",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight! * 0.3,
                      child: GridView.builder(
                        itemCount: portfolioUserData!.myWork.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 20,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
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
                                        "$IMAGE_BASE_URL/${portfolioUserData!.myWork[index].thumbnail ?? ''}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    portfolioUserData!.myWork[index].type ==
                                            'hiring'
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
                                    portfolioUserData!.myWork[index].title
                                        .toString(),
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
                                    portfolioUserData!.myWork[index].details
                                        .toString()
                                        .replaceAll("\n", ""),
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
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

Widget portfolioLoader() {
  return Column(
    children: [
      Stack(
        children: [
          Container(
            height: screenHeight! / 7,
            width: screenWidth!,
            color: Colors.black,
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth! * 0.05,
                    vertical: screenHeight! * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Image.asset(
                        ReelFolioIcon.iconArrowBackward,
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        ReelFolioIcon.iconMenu,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight! / 60,
              ),
              Container(
                height: screenHeight! * 0.465,
                width: screenWidth!,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      ReelfolioColor.shadowColor.withOpacity(0),
                      ReelfolioColor.shadowColor.withOpacity(0.8),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth! * 0.05),
                          child: Image.asset(ReelFolioIcon.reelPlayButton),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth! * 0.08),
                          child: Container(
                            height: 30,
                            width: screenWidth! / 2.2,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth! * 0.08,
                              vertical: screenHeight! * 0.03),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 20,
                                width: screenWidth! / 3.4,
                                color: Colors.black,
                              ),
                              Image.asset(ReelFolioIcon.saveButton),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth! * 0.08, vertical: screenHeight! * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff394A71),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 15,
                  width: screenWidth! / 6,
                  color: Colors.black,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Image.asset(ReelFolioIcon.iconArrowDownward),
            ),
          ],
        ),
      ),
      const Divider(
        color: Colors.white,
      ),
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth! * 0.1,
          vertical: screenHeight! * 0.005,
        ),
        width: screenWidth!,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.black,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Container(
                      height: 10,
                      width: screenWidth! / 6.2,
                      color: Colors.black,
                    ),
                    Container(
                      height: 10,
                      width: screenWidth! / 6.2,
                      color: Colors.black,
                    ),
                    Container(
                      height: 10,
                      width: screenWidth! / 6.2,
                      color: Colors.black,
                    ),
                    Container(
                      height: 10,
                      width: screenWidth! / 6.2,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      const Divider(
        color: Colors.white,
      ),
      SizedBox(
        height: screenHeight! * 0.06,
        width: screenWidth!,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 13,
                width: screenWidth! / 5,
                color: Colors.black,
              ),
            ),
            const VerticalDivider(
              color: Colors.white,
              thickness: 1,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight! * 0.01,
              ),
              width: screenWidth! * 0.70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                reverse: true,
                // Hardcoded for now
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth! * 0.02),
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white, width: 1),
                          minimumSize: Size(screenWidth! * 0.1, 30),
                          backgroundColor: Colors.transparent,
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth! * 0.04,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )),
                      child: Container(
                        height: 10,
                        width: screenWidth! / 5.2,
                        color: Colors.black,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      const Divider(
        color: Colors.white,
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth! * 0.03,
          vertical: screenHeight! * 0.01,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 30,
              width: screenWidth! / 2.2,
              color: Colors.black,
            ),
          ],
        ),
      ),
      SizedBox(
        height: screenHeight! * 0.3,
        child: GridView.builder(
          itemCount: 5,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 20,
          ),
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
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
                          color: Colors.black,
                          border: Border.all(
                            color: Colors.white,
                            width: 1.2,
                          ),
                        ),
                        height: screenHeight! / 6.2,
                        width: screenWidth! / 1.8,
                      ),
                      Positioned(
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
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    width: screenWidth! / 1.5,
                    child: Container(
                      height: 20,
                      width: screenWidth! / 4.2,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                    ),
                    width: screenWidth! / 1.5,
                    height: 14,
                    child: Container(
                      height: 10,
                      width: screenWidth! / 5.2,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}
