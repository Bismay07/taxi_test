
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  String userid = '';
  var verId = '';
  int? resendtokenid;
  bool phoneAuthcheck = false;
  dynamic credentials;

  phoneAuth(String phone) async {
    try{
      credentials = null;
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
          timeout: const Duration(seconds: 60),
          verificationCompleted: (PhoneAuthCredential credential) async{
            log('Completed');
            credentials = credential;
            await FirebaseAuth.instance.signInWithCredential(credential);

          },
          forceResendingToken: resendtokenid,
          verificationFailed: (FirebaseAuthException e) {
            log('Failed');
            if(e.code == 'invalid-phone-number'){
              debugPrint('The provided number is invalid');
            }
          },
          codeSent: (String verificationId, int? resendToken) async {
            log("Code sent");
            verId = verificationId;
            resendtokenid = resendToken;
          },
          codeAutoRetrievalTimeout: (String verificatioId){});
    }
    catch (e){
      log("Error Occurred $e");
    }
  }
  verifyOtp(String OtpNumber) async{
    log("Called");
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verId,
        smsCode: OtpNumber);
    log("Verified");
    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}