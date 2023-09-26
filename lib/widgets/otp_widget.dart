import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taxi_app/widgets/pinput_widget.dart';


Widget OtpWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(10),
            const Text("Enter your OTP here  ", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            const Gap(20),
            const PinputExample(),
            const Gap(200),
            RichText(text: const TextSpan(
                children: [
                  TextSpan(
                      text: "Agree the terms and conditions",
                      style: TextStyle(color: Colors.black, )
                  ),
                ]
            )
            )
          ],
        )
    ),
  );
}
