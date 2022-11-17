import 'package:flutter/material.dart';
import 'package:reel_folio/create_project(hiring)/widgets/navbar_widget.dart';
import 'package:reel_folio/create_project(hiring)/widgets/project_upload_widget.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

class NewProjectUpload extends StatefulWidget {
  const NewProjectUpload({super.key});

  @override
  State<NewProjectUpload> createState() => _NewProjectUploadState();
}

class _NewProjectUploadState extends State<NewProjectUpload> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
            backgroundColor: ReelfolioColor.shadowColor,
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(screenHeight! * 70 / 812),
                child: CreateProjectNavbar(
                    context, "ADD NEW PROJECT", NewProjectUpload())),
            body: SingleChildScrollView(
                child: Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: screenWidth! * 10 / 375, vertical: 10),
                    height: screenHeight! * 0.2,
                    width: screenWidth,
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth! * 40 / 375,
                        vertical: screenHeight! * 0.06),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                    ),
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        backgroundColor: ReelfolioColor.bgColor,
                        side: const BorderSide(color: Colors.white, width: 1),
                      ),
                      child: const Text('Add Thumbnail',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    )),
                const SizedBox(
                  height: 30,
                ),
                Text("Where can we find it?",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.3),
                        fontSize: 16,
                        fontWeight: FontWeight.w400)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ProjectUploadDetails("www.vimeo.com/myvideo"),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text("Title",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.3),
                        fontSize: 16,
                        fontWeight: FontWeight.w400)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ProjectUploadDetails("Title of project"),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text("Logline",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.3),
                        fontSize: 16,
                        fontWeight: FontWeight.w400)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ProjectUploadDetails(
                      "1-2 sentence description of your project."),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text("Description",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.3),
                        fontSize: 16,
                        fontWeight: FontWeight.w400)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ProjectUploadDetails(
                      "What else do you want people to know? (i.e., total run time, awards, year, inspiration for the film, location, etc.)"),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ))));
  }
}
