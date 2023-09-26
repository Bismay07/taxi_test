
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginBG extends StatelessWidget {
  const LoginBG({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height*0.56,
      width: Get.width,
      decoration: const BoxDecoration(
        color: Colors.indigoAccent,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(80),
          bottomRight: Radius.circular(80)
        )
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 100),
        child: SvgPicture.asset('assets/login.svg'),
      ),
    );
  }
}
