import 'package:flutter/material.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

Widget ChatMainNavbar() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          const SizedBox(width: 10),
          const Text(
            "Chats",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(width: 10),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit_note, color: Colors.white),
          ),
        ]),
      ),
      const Divider(
        color: secondaryTextColor2,
        thickness: 1,
      ),
      SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10.0),
            filled: true,
            hintText: " Search",
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: searchTextcolor,
            ),
            prefixIcon: Visibility(
              visible: true,
              child: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
            fillColor: searchBarcolor,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(10.0,10,10, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "People",
              style: TextStyle(
                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Contacts Only",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
      ),

      Stack(
        children: [
           Divider(
        color: Colors.white,
        thickness: 2,
        indent: 10,
        endIndent: screenWidth!*0.85,
      ),
      const Divider(
        color: secondaryTextColor2,
        thickness: 1,
      ),
        ],
      ),

    ],
  );
}
