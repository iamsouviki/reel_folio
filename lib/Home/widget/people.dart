import 'package:flutter/material.dart';
import 'package:reel_folio/Home/homepage.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

import '../../Api/config.dart';
import '../../Model/PeoplelistModel.dart';

Widget HomePeople(List<PeopleData> peopleList) {
  id = 0;
  return SizedBox(
    height: screenHeight! * 400 / 812,
    child: _gridList(peopleList),
  );
}

Widget _gridList(List<PeopleData> peopleList) {
  return GridView.builder(
    itemCount: peopleList.length,
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
            child: Image.network(
              "$IMAGE_BASE_URL/${peopleList[index].coverPicture ?? ''}",
              errorBuilder: (context, object, trace) => Image.asset(
                "assets/blank-profile-picture.png",
                fit: BoxFit.fill,
              ),
              fit: BoxFit.fill,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                peopleList[index].name.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: screenHeight! /500),
              Text(
                peopleList[index].primaryRole ?? '',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700),
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
              child: const Text(
                "View",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
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

Widget PeopleListItem(PeopleData peopleData) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 1.2,
          ),
        ),
        height: screenHeight! / 5,
        width: screenWidth! / 2.5,
        child: Image.network(
          "$IMAGE_BASE_URL/${peopleData.coverPicture ?? ''}",
          errorBuilder: (context, object, trace) => Image.asset(
            "assets/blank-profile-picture.png",
            fit: BoxFit.cover,
          ),
          fit: BoxFit.contain,
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            peopleData.name.toString(),
            style: const TextStyle(
                color: Colors.white, fontSize: 43, fontWeight: FontWeight.w900),
          ),
          SizedBox(height: screenHeight! * 10 / 812),
          Text(
            peopleData.primaryRole ?? '',
            style: const TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700),
          ),
        ],
      ),
      Container(
        alignment: Alignment.bottomRight,
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
          child: const Text(
            "View",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(5),
        child: const Divider(
          color: Colors.grey,
          height: 0.5,
        ),
      ),
    ],
  );
}
