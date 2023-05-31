
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grab_meals/screens/otp_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpProvider extends ChangeNotifier{

  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _uid;
  String get uid => _uid!;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;



  OtpProvider(){
    checkSignIn();
  }

  void checkSignIn() async{
    final SharedPreferences otp = await SharedPreferences.getInstance();
    _isSignedIn = otp.getBool("isSignedIn") ?? false;
    notifyListeners();
  }

  void signInWithPhone(BuildContext context, String phoneNumber) async
  {
    try{
      await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential authCredential) async
          {
            await _auth.signInWithCredential(authCredential);
          },
          verificationFailed: (error)
          {
            throw Exception(error.message);
          }, codeSent: (verificationId, forceResendingToken)
          {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => OtpScreen(verificationId: verificationId)));
          },
          codeAutoRetrievalTimeout: (verificationId){});
    }
    on FirebaseAuthException catch (e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString(), textAlign: TextAlign.center,)));
    }
  }

  void verifyOtp(
      {
        required BuildContext context,
        required String verificationId,
        required String userOtp,
        required Function onSuccess
      })async
  {
    _isLoading = true;
    notifyListeners();

    try{
      PhoneAuthCredential phoneAuth = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: userOtp);

      User? user = (await _auth.signInWithCredential(phoneAuth)).user;

      if (user != null)
        {
          _uid = user.uid;
          onSuccess();
        }
      _isLoading = false;
      notifyListeners();
    }
    on FirebaseAuthException catch (e){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
                content: Text(e.message.toString(),
                textAlign: TextAlign.center,)));
      _isLoading = false;
      notifyListeners();
    }
  }

  Future <bool> checkExistingUser() async {
    DocumentSnapshot snapshot = await _store.collection("users").doc(_uid).get();
    if (snapshot.exists)
      {
        print("Existing User");
        return true;
      }
    else{
      print("New User");
      return false;
    }
  }

}