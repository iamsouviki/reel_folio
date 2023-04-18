import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get_it/get_it.dart';

import 'package:reel_folio/util/size_config.dart';

import 'widget/screen_sub_title_widget.dart';
import 'widget/screen_title_widget.dart';

class UserDetailsScreen extends StatelessWidget {
  UserDetailsScreen({Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  final _emailIDController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  OnBoardingUserDetailsModel get _userDetails => GetIt.I<OnBoardingUserDetailsModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AspectRatio(
          aspectRatio: 375 / 60,
          child: SizedBox(),
        ),
        const ScreenTitleWidget(text: 'YOUR NAME'),
        const AspectRatio(
          aspectRatio: 375 / 40,
          child: SizedBox(),
        ),
        TextField(
          controller: _nameController,
          onChanged: (val) => _userDetails.username = val,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          cursorColor: const Color(0xFF474747),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: screenWidth! * 22 / 375,
          ),
          decoration: InputDecoration(
            hintText: 'first last',
            hintStyle: TextStyle(
              color: const Color(0xFF474747),
              fontWeight: FontWeight.w400,
              fontSize: screenWidth! * 22 / 375,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF474747),
              ),
            ),
          ),
        ),
        const AspectRatio(
          aspectRatio: 375 / 60,
          child: SizedBox(),
        ),
        const ScreenTitleWidget(text: 'YOUR EMAIL'),
        const AspectRatio(
          aspectRatio: 375 / 40,
          child: SizedBox(),
        ),
        TextField(
          controller: _emailIDController,
          onChanged: (val) => _userDetails.userEmail = val,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          cursorColor: const Color(0xFF474747),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: screenWidth! * 22 / 375,
          ),
          decoration: InputDecoration(
            hintText: 'email@reelfolio.com',
            hintStyle: TextStyle(
              color: const Color(0xFF474747),
              fontWeight: FontWeight.w400,
              fontSize: screenWidth! * 22 / 375,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF474747),
              ),
            ),
          ),
        ),
        const AspectRatio(
          aspectRatio: 375 / 60,
          child: SizedBox(),
        ),
        const ScreenTitleWidget(text: 'PHONE'),
        const ScreenSubTitleWidget(
          text:
              'Please enter your cell phone number. It will be used for authentication purposes.',
        ),
        const AspectRatio(
          aspectRatio: 375 / 40,
          child: SizedBox(),
        ),
        TextField(
          controller: _phoneNumberController,
          onChanged: (val) => _userDetails.userPhoneNumber = val,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          cursorColor: const Color(0xFF474747),
          inputFormatters: [
            //MaskedInputFormatter('(###) ###- ####')
          ],
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: screenWidth! * 22 / 375,
          ),
          decoration: InputDecoration(
            hintText: '(234) 567- 8910',
            hintStyle: TextStyle(
              color: const Color(0xFF474747),
              fontWeight: FontWeight.w400,
              fontSize: screenWidth! * 22 / 375,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF474747),
              ),
            ),
          ),
        ),
        const AspectRatio(
          aspectRatio: 375 / 60,
          child: SizedBox(),
        ),
        const AspectRatio(
          aspectRatio: 375 / 60,
          child: SizedBox(),
        ),
      ],
    );
  }
}

class OnBoardingUserDetailsModel {
  String? username;
  String? userEmail;
  String? userPhoneNumber;
  String? userPin;
  int? id;
  String? otpCode;
  String? socialMediaLink;
  String? password;
  String? confirmPassword;
  List<int>? otherSkills;
  int? primarySkill;
  String? otpAdded;


  String? userId;
  String? bio;
  File? profileImage;
  File? coverPic;

  OnBoardingUserDetailsModel({
    this.username,
    this.userEmail,
    this.userPhoneNumber,
    this.id,
    this.otpCode,
    this.socialMediaLink,
    this.password,
    this.confirmPassword,
    this.otherSkills,
    this.primarySkill,
    this.otpAdded,

    this.userId,
    this.bio,
    this.profileImage,
    this.coverPic,
  });

  bool isValid(){
    return username!.isNotEmpty && isEmail(userEmail!) && userPhoneNumber!.isNotEmpty;
  }

  bool isEmail(String em) {

    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(em);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['otp'] = '';
    data['work_link'] = '';
    data['name'] = username;
    data['email'] = userEmail;
    data['primary_role_id'] = primarySkill;
    data['password'] = 'password';
    data['password_confirmation'] = 'password';
    data['other_skills_id'] = otherSkills;
    return data;
  }
}
