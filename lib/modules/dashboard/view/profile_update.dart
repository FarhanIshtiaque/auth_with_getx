import 'package:api_auth_demo/global/constant.dart';
import 'package:api_auth_demo/modules/authentication/state/auth_state.dart';
import 'package:api_auth_demo/modules/authentication/view/component/custom_button.dart';
import 'package:api_auth_demo/modules/authentication/view/component/testfield_tittle.dart';
import 'package:api_auth_demo/modules/authentication/view/component/text_field.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'component/user_header_info.dart';
import 'dashboard.dart';

class ProfileUpdate extends StatelessWidget {
  const ProfileUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthState state = Get.find();
    return Scaffold(
      appBar: AppBar(
          title: const Text('Profile Update',
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
          )


      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            const UserHeaderInfo(
              name: 'johndoe',
              email: 'johndoe@gmail.com',
            ),

            const SizedBox(height: 32,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextFieldTittle(name: 'First Name'),
                  const SizedBox(height: 8,),
                  TextFieldWidget(hintText: 'first name',
                      suffixIconData: Icons.person_outline_outlined,
                      obscureText: false,
                    onChanged: (value) {
                    state.setFirstName(value);
                    },),
                  const SizedBox(height: 24,),
                  const TextFieldTittle(name: 'Last Name'),
                  const SizedBox(height: 8,),
                  TextFieldWidget(hintText: 'last name',
                    suffixIconData: Icons.person_outline_outlined,
                    obscureText: false,
                    onChanged: (value) {
                    state.setLastName(value);
                    },),
                  const SizedBox(height: 32,),
                  CustomButton(onTap: (){

                    state.updateProfile(
                        firstName: state.firstname.value,
                        lastName: state.lastname.value);

                  }, buttonName: "Confirm"),

                ],

              ),
            )


          ],
        ),
      ),
    );
  }
}

