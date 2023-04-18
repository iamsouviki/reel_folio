import 'package:flutter/material.dart';
import 'package:reel_folio/Chat/widget/chat_screen_navbar_widget.dart';
import 'package:reel_folio/Chat/widget/receiver_widget.dart';
import 'package:reel_folio/Chat/widget/sender_widget.dart';
import 'package:reel_folio/Chat/widget/type_message_widget.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          backgroundColor: primarybgcolor,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(screenHeight! * 180 / 812),
              child: ChatScreenNavbar(context)),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            "You Started the Chat",
                            style: TextStyle(color: chatboxcolor),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: primarybgcolor,
                            side: BorderSide(color: chatboxcolor, width: 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                          )),
                    ),
                    Center(
                      child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            "Applied as a Director",
                            style: TextStyle(color: chatboxcolor),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: primarybgcolor,
                            side: BorderSide(color: chatboxcolor, width: 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                          )),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "3/11/2022",
                        style: TextStyle(color: secondaryTextColor),
                      ),
                    ),

                    ///Receiver Widget
                    ReceiverWidget(),

                    ///Sender Widget
                    SenderWidget(),
                    SenderWidget(),
                    SenderWidget(),
                    SenderWidget(),
                    SenderWidget(),
                    SizedBox(
                      height: screenHeight! * 80 / 812,
                    )
                  ],
                ),
              ),

              Column(children: [
                Spacer(),
                TypeMessage(),
              ])
              ],)
            
          
          // TypeMessage()
          ),
      // bottomSheet: BottomSheet(
      //   onClosing: () {},
      //   builder: (context) => TypeMessage(),
      // ),
      // bottomNavigationBar: TypeMessage(),
    );
  }
}
