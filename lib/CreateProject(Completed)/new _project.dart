import 'package:flutter/material.dart';
import 'package:reel_folio/CreateProject(Completed)/widget/appbar_widget.dart';
import 'package:reel_folio/CreateProject(Completed)/widget/new_project_item_widget.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';
import 'package:reel_folio/widget/default_navbar.dart';

class NewProjectWidget extends StatefulWidget {
  const NewProjectWidget({Key? key}) : super(key: key);

  @override
  State<NewProjectWidget> createState() => _NewProjectWidgetState();
}

class _NewProjectWidgetState extends State<NewProjectWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
          backgroundColor: secondarybgcolor,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(screenHeight! * 50 / 812),
              child: CreateProjectNavbar(context, "ADD NEW PROJECT")),
          body: SingleChildScrollView(
              child: Column(
            children: [
              Container(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth! * 10 / 375, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: screenWidth! * 10 / 375),
                  filled: true,
                  hintText: " Search",
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: searchTextcolor,
                  ),
                  prefixIcon: const Visibility(
                    visible: true,
                    child: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                  fillColor: searchBarcolor,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                ),
              )),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) => NewProject_Item(),
              ),
              SizedBox(height: screenHeight! * 0.2),
              const Text(
                "Didn’t find what you were searching for? ",
                style: TextStyle(
              color: secondaryTextColor2,
              fontSize: 16,
              fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {
              showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialog(context),
            );
                },
                style: OutlinedButton.styleFrom(
              minimumSize: const Size(100, 50),
              backgroundColor: searchTextcolor,
              side: const BorderSide(color: Colors.white),
                ),
                child: const Text(
              "Create New Project",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
                ),
              )
            ],
          )),
        ));
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return AlertDialog(
    backgroundColor: primarybgcolor,
    // title: const Text('Popup example'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Center(
          child: Text("Create New Project",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          )
          )),
          SizedBox(height: 10),
          Row(
            children: [
              OutlinedButton(
                onPressed: () {
                  showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialog(context),
            );
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(100, 40),
                  backgroundColor: searchTextcolor,
                  side: const BorderSide(color: Colors.white),
                ),
                child: const Text(
                  "Completed",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(width:10),
              OutlinedButton(
                onPressed: () {
                  showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialog(context),
            );
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(100, 40),
                  backgroundColor: searchTextcolor,
                  side: const BorderSide(color: Colors.white),
                ),
                child: const Text(
                  "Crewing Up",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          )
      ],
    ),
    // actions: <Widget>[
    //   new TextButton(
    //     onPressed: () {
    //       Navigator.of(context).pop();
    //     },
    //     // textColor: Theme.of(context).primaryColor,
    //     child: const Text('Close'),
    //   ),
    // ],
  );
}
