import 'package:flutter/material.dart';

Widget BottomNavBar() {
  return BottomNavigationBar(
    showSelectedLabels: false,
    showUnselectedLabels: false,
    items: [
      BottomNavigationBarItem(
        icon: Image.asset("icons/home.png"),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Image.asset("icons/server.png"),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Image.asset("icons/film.png"),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Image.asset("icons/message-square.png"),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Image.asset("icons/user.png"),
        label: "Home",
      ),
    ],
  );
}