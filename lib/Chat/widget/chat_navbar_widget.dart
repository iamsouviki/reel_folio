import 'package:flutter/material.dart';
import 'package:reel_folio/Chat/new_message_screen.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/reel_folio_icon.dart';
import 'package:reel_folio/util/size_config.dart';

Widget ChatMainNavbar(BuildContext context) {
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
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          SizedBox(width: 10),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewMessage()));
            },
            child: Image.asset(ReelFolioIcon.editIcon),
          ),
        ]),
      ),
      const Divider(
        color: filterbgcolor,
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
        padding: const EdgeInsets.fromLTRB(10.0,10,10, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "People",
              style: TextStyle(
                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 27,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Contacts Only",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      Stack(
        children: [
           
      const Divider(
        color: filterbgcolor,
        thickness: 1,
      ),
      Divider(
        color: Colors.white,
        thickness: 2,
        indent: 10,
        endIndent: screenWidth!*0.85,
      ),
        ],
      ),

    ],
  );
}
