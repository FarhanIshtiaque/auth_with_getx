import 'package:api_auth_demo/global/constant.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';

class UserHeaderInfo extends StatelessWidget {
  const UserHeaderInfo({
    Key? key, required this.name, required this.email,
  }) : super(key: key);

  final String name;
  final String email;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 24,
          ),
          Row(
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
                text: name,
              ),
              const Spacer(flex: 2,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Text(name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: kGray2,
                        fontSize: 22
                    ),
                  ),

                  Text(email,
                    style: const TextStyle(
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
          const SizedBox(height: 34,),
          Container(height: 2, width: double.infinity,
            color: kGray8,
          ),
        ],

      ),
    );
  }
}
