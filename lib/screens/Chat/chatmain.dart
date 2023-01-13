import 'package:flutter/material.dart';
import 'package:reel_folio/screens/Chat/widget/chat_main_list_widget.dart';
import 'package:reel_folio/screens/Chat/widget/chat_navbar_widget.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

class ChatMain extends StatefulWidget {
  ChatMain({Key? key}) : super(key: key);

  @override
  State<ChatMain> createState() => _ChatMainState();
}

class _ChatMainState extends State<ChatMain> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: primarybgcolor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight! * 220 / 812),
            child: ChatMainNavbar(context)
          ),
      
        body: _verticalList(3, context),
        
      ),
    );
  }
}

ListView _verticalList(int n, BuildContext context) {
  return ListView(
    scrollDirection: Axis.vertical,
    children: List.generate(n, (i) => ChatMainList(context)),
  );
}