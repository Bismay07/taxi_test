import 'dart:ffi';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:taxi_app/views/otp_verification_screen.dart';


  Widget LoginWidget(CountryCode countryCode, Function OnCountryChange, Function onSubmit) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(10),
            const Text("Hello, Bismay", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            const Gap(20),
            Container(
              width: double.infinity,
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
                    flex: 2,
                      child: InkWell(
                        onTap: () => OnCountryChange(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: countryCode.flagImage(),
                                ),
                              ),
                              Text(countryCode.dialCode),
                              const Icon(Icons.arrow_drop_down_circle_outlined)
                            ],
                          ),
                        ),
                      )),
                  Container(
                    width: 1,
                    height: 55,
                    color: Colors.black.withOpacity(0.2),
                  ),
                   Expanded(
                    flex: 5,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          onSubmitted:(String? input)=> onSubmit(input) ,
                          decoration: const InputDecoration(
                            hintText: "Enter your mobile number.",
                            border: InputBorder.none
                          ),
                        ),
                      )),
                ],
              ),
            ),
           const Gap(20),
           InkWell(
             // onTap: (String? input)=> onSubmit(input),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container(
                 height: 70,
                 width: Get.width*0.5,
                 decoration: const BoxDecoration(
                    color: Colors.indigoAccent,
                   borderRadius: BorderRadius.all(Radius.circular(20)),
                 ),
                 child: const Icon(Icons.arrow_circle_right_outlined, color: Colors.white,size: 40,),
               ),
             ]
             ),
           )
          ],
        )
    ),
    );
  }
