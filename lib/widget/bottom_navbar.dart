import 'package:flutter/material.dart';
import 'package:reel_folio/route/route_path.dart';

Widget BottomNavBar(BuildContext context) {
  return BottomNavigationBar(
    showSelectedLabels: false,
    showUnselectedLabels: false,
    onTap: (index){
      if(index == 3){
        Navigator.pushNamed(context, RoutePath.routeToChatScreen);
      }else if(index == 4){
        Navigator.pushNamed(context, RoutePath.routeToPortfolioScreen);
      }
    },
    items: [
      BottomNavigationBarItem(
        icon: Image.asset("icons/home.png",height: 24,),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Image.asset("icons/server.png",height: 24),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Image.asset("icons/film.png",height: 24),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Image.asset("icons/message-square.png",height: 24),
        label: "Chat",
      ),
      BottomNavigationBarItem(
        icon: Image.asset("icons/user.png",height: 24),
        label: "Profile",
      ),
    ],
  );
}