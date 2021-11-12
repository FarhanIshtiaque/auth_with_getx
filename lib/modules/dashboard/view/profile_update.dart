import 'package:api_auth_demo/global/constant.dart';
import 'package:api_auth_demo/modules/authentication/view/component/custom_button.dart';
import 'package:api_auth_demo/modules/authentication/view/component/testfield_tittle.dart';
import 'package:api_auth_demo/modules/authentication/view/component/text_field.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';

class ProfileUpdate extends StatelessWidget {
  const ProfileUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Profile',
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
            const SizedBox(height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [

                  TextAvatar(
                    shape: Shape.Circular,
                    size: 64,
                    backgroundColor: kGray7,
                    textColor: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    upperCase: true,
                    numberLetters: 2,
                    text: 'John Doe',
                  ),
                  Spacer(flex: 2,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('John Doe',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: kGray2,
                            fontSize: 22
                        ),
                      ),

                      Text('johndoe@gmail.com',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: kGray5,
                            fontSize: 16
                        ),
                      ),

                    ],
                  ),
                  Spacer(flex: 10,)

                ],
              ),
            ),
            const SizedBox(height: 34,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(height: 2, width: double.infinity,
                color: kGray8,
              ),
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
                    onChanged: (value) {},),
                  const SizedBox(height: 24,),
                  const TextFieldTittle(name: 'Last Name'),
                  const SizedBox(height: 8,),
                  TextFieldWidget(hintText: 'last name',
                    suffixIconData: Icons.person_outline_outlined,
                    obscureText: false,
                    onChanged: (value) {},),
                  const SizedBox(height: 32,),
                  CustomButton(onTap: (){

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
