import 'package:api_auth_demo/global/constant.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
   CustomButton({
    Key? key, required this.onTap, required this.buttonName,
  }) : super(key: key);
  final GestureTapCallback onTap;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child:  Center(
          child: Text(
            buttonName,
            style: const TextStyle(
                color: kGray10, fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}