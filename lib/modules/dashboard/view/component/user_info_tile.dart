import 'package:api_auth_demo/global/constant.dart';
import 'package:flutter/material.dart';

class UserInfoTile extends StatelessWidget {
  const UserInfoTile({
    Key? key, required this.tileName, required this.icon, required this.info,
  }) : super(key: key);

  final String tileName;
  final IconData icon;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Text(tileName,
            style: TextStyle(
                color: kGray5,
                fontSize: 14,
                fontWeight: FontWeight.w700),
          ),

          SizedBox(height: 4,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 24,
                color: kGray5,
              ),
              SizedBox(width: 6,),
              Text(info,
                style: TextStyle(
                    color: kGray2,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),


            ],

          ),
          const SizedBox(height: 6,),
          Container(height: 1, width: double.infinity,
            color: kGray8,
          ),
          const SizedBox(height: 12,),
        ],
      ),
    );
  }
}