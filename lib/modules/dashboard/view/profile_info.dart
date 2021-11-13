import 'package:api_auth_demo/global/constant.dart';
import 'package:api_auth_demo/modules/authentication/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'component/user_header_info.dart';
import 'component/user_info_tile.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthState state = Get.find();
    return Scaffold(
      appBar:  AppBar(
          title: const Text('Profile Info',
            style: TextStyle(
                color: kGray4,
                fontWeight: FontWeight.w500
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading:
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,

              color: kGray6,
            ),
          ),



      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserHeaderInfo(
              name: state.userInfo!.name,
              email: state.userInfo!.email,
            ),
            const SizedBox(height: 32,),
            UserInfoTile(
              icon: Icons.person_outlined,
              info: state.userInfo!.firstName,
              tileName: 'First Name',

            ),
            UserInfoTile(
              icon: Icons.person_outlined,
              info: state.userInfo!.lastName,
              tileName: 'Last Name',

            ),
            UserInfoTile(
              icon: Icons.email_outlined,
              info: state.userInfo!.email,
              tileName: 'Email',

            ),


          ],
        ),
      ),
    );
  }
}


