import 'package:fl_country_code_picker/fl_country_code_picker.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_app/utils/auth_controller.dart';
import 'package:taxi_app/utils/login_bg.dart';
import 'package:taxi_app/utils/otp_bg.dart';
import 'package:taxi_app/widgets/otp_widget.dart';

import '../widgets/login_widget.dart';


class OtpVerify extends StatefulWidget {

  String PhoneNumber;
  OtpVerify(this.PhoneNumber);

  @override
  State<OtpVerify> createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {

  
  AuthController authController = Get.put(AuthController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController.phoneAuth(widget.PhoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: Get.width,
          height: Get.height,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                   Stack(
                      children: [
                        OtpBG(),
                        Positioned(
                          top: 70,
                          left: 18,
                          child: InkWell(
                            onTap: (){
                              Get.back();
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,

                              ),
                              child: Icon(Icons.arrow_back, color: Colors.indigoAccent,),
                            ),
                          ),
                        ),
                      ]
                  ),
                  OtpWidget(),

                ],
              ),
            ),
          )
      ),
    );
  }
}
