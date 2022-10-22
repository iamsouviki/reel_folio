import 'package:flutter/material.dart';

Widget BottomNavBar() {
  return BottomNavigationBar(
    showSelectedLabels: false,
    showUnselectedLabels: false,
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
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Image.asset("icons/user.png",height: 24),
        label: "Home",
      ),
    ],
  );
}