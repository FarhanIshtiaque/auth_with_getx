import 'package:api_auth_demo/global/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'component/custom_button.dart';
import 'component/screen_tittle.dart';
import 'component/testfield_tittle.dart';
import 'component/text_field.dart';
import 'sign_up.dart';


class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ScreenTittle(
                tittle: 'Sign in to weDevs',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextFieldTittle(
                      name: 'Email',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFieldWidget(
                      hintText: 'Username or Email',
                      obscureText: false,
                      suffixIconData: Icons.email,
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const TextFieldTittle(
                      name: 'Password',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFieldWidget(
                      hintText: 'Password',
                      obscureText: false,
                      suffixIconData: Icons.visibility,
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forget Password',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                     CustomButton(
                       buttonName: 'Sign In',
                       onTap: (){
                         Get.to(SignUp());
                       },
                     ),
                    const SizedBox(
                      height: 32,
                    ),

                    const SizedBox(
                      height: 32,
                    ),

                    const SizedBox(
                      height: 108,
                    ),
                    Center(
                      child: RichText(
                        text: const TextSpan(
                          text: 'Don\'t have an account?',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: kGray3),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Sign Up',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: kPrimaryColor)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

