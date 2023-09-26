import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_app/utils/login_bg.dart';
import 'package:taxi_app/views/otp_verification_screen.dart';


import '../widgets/login_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final countryPicker = const FlCountryCodePicker();
  CountryCode countryCode =
      const CountryCode(name: "India", code: "IND", dialCode: "  +");
    onSubmit(String? input){
        Get.to(()=> OtpVerify(countryCode.dialCode+input!));
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: Get.width,
          height: Get.height,
          child: SingleChildScrollView(
            child: Center(
              child: Stack(children: [
                Column(
                  children: [
                    LoginBG(),
                    LoginWidget(countryCode, () async {
                      final code =
                          await countryPicker.showPicker(context: context);
                      // Null check
                      if (code != null) countryCode = code;
                      setState(() {});
                    }, onSubmit),
                  ],
                ),
                Positioned(
                  top: 40,
                  left: 65,
                  child: Container(
                    width: Get.width*0.7,
                    height: 65,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 4,
                              blurRadius: 5
                          )
                        ]
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                            child: Container()
                        ),
                        Expanded(
                          flex: 1,
                            child: Container()
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          )),
    );
  }
}
