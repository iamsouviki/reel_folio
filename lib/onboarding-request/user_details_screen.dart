import 'package:flutter/material.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101010),
      body: SafeArea(
        top: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Your Name',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontFamily: 'GT-America',
                letterSpacing: -0.1,
              ),
            ),
            TextField(
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              cursorColor: Color(0xFF474747),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 22,
              ),
              decoration: InputDecoration(
                hintText: 'first last',
                hintStyle: TextStyle(
                  color: Color(0xFF474747),
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color:  Color(0xFF474747),
                  ),
                ),
              ),
            ),
            Text(
              'Your Email',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontFamily: 'GT-America',
                letterSpacing: -0.1,
              ),
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              cursorColor: Color(0xFF474747),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 22,
              ),
              decoration: InputDecoration(
                hintText: 'email@reelfolio.com',
                hintStyle: TextStyle(
                  color: Color(0xFF474747),
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color:  Color(0xFF474747),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
