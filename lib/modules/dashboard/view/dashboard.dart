import 'package:api_auth_demo/global/constant.dart';
import 'package:api_auth_demo/modules/authentication/state/auth_state.dart';
import 'package:api_auth_demo/modules/authentication/view/component/custom_button.dart';
import 'package:api_auth_demo/modules/authentication/view/component/screen_tittle.dart';
import 'package:api_auth_demo/modules/dashboard/view/profile_info.dart';
import 'package:api_auth_demo/modules/dashboard/view/profile_update.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthState state = Get.find();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ScreenTittle(
              tittle: 'Welcome to weDevs',
            ),
            const SizedBox(
              height: 50,
            ),
            Lottie.asset(
              'assets/lottie.json',
              width: screenWidth * .8,
              repeat: false,
            ),
             Center(
               child:state.onUpdate.value== true? const Text(
                 'Your Profile Updated',
                 style: TextStyle(
                   fontSize: 18,
                   fontWeight: FontWeight.w600,
                   color: kGray3,
                 ),
               ):const Text(
                'You are Signed In',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: kGray3,
                ),
            ),
             ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  CustomButton(
                      onTap: () {
                        Get.to(
                          ProfileUpdate()
                        );
                      },
                      buttonName: "Profile Update"),
                  const SizedBox(height: 12,),
                  Obx(
                    ()=> Center(
                      child: state.onUpdate.value== true?CustomButton(
                          onTap: (){
                            Get.to(ProfileInfo());
                          },
                          buttonName: "Profile Info"):Text(''),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
