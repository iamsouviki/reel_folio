import 'package:flutter/material.dart';
import 'package:reel_folio/Chat/widget/new_message_list_widget.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

class NewMessage extends StatefulWidget {
  NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
          backgroundColor: primarybgcolor,
          appBar: AppBar(
              backgroundColor: primarybgcolor,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: const Text(
                "New Message",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              centerTitle: true,
              actions: [
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(secondaryTextColor),
                  ),
                  onPressed: () {},
                  child: const Text('Chat'),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(5),
                child: Divider(
                  color: secondaryTextColor,
                  thickness: 0.5,
                ),
              )),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth! * 20 / 375),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: EdgeInsets.only(top: 10),
                child: const Text(
                  "To:",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  filled: true,
                  hintText: " Search",
                  hintStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: secondaryTextColor,
                  ),
                  fillColor: Colors.transparent,
                  // border: OutlineInputBorder(
                  //     borderSide: BorderSide.none,
                  //     borderRadius: BorderRadius.circular(5)),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: const Text(
                  "Suggested:",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height:screenHeight! * 30 / 812),
              Expanded(
                child: _verticalList(2,context),
              ),
            ]),
          ),
        ));
  }
}

ListView _verticalList(int n, BuildContext context) {
  return ListView(
    scrollDirection: Axis.vertical,
    children: List.generate(n, (i) => NewMessageList()),
  );
}
