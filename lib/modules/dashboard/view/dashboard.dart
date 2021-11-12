import 'package:api_auth_demo/modules/authentication/view/component/custom_button.dart';
import 'package:api_auth_demo/modules/authentication/view/component/screen_tittle.dart';
import 'package:api_auth_demo/modules/dashboard/view/profile_update.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            const Text(
              'You are Signed In',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
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
                  SizedBox(height: 12,),
                  CustomButton(
                      onTap: (){
                      },
                      buttonName: "Profile Info"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
