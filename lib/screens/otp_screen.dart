
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grab_meals/constants/colors.dart';
import 'package:grab_meals/providers/otp_provider.dart';
import 'package:grab_meals/screens/sign_up.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {

  const OtpScreen({Key? key, required this.verificationId}) : super(key: key);

  final String verificationId;

  static const routeName = "/otpScreen";


  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    String? otpCode;
    final isLoading =  Provider.of<OtpProvider>(context,listen: true).isLoading;
    final TextEditingController pinController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: isLoading == true ? Center(
          child: LoadingAnimationWidget.inkDrop(color: AppColors.mainColor, size: 200),)
        :Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.arrow_back_outlined),
                  ),
                ),
                Container(
                  width: 200,
                  height: 200,
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.mainColor
                  ),
                  child: SvgPicture.asset("assets/icons/slider-3.svg"),
                ),
                const SizedBox(height: 20,),
                const Text(
                  "OTP Verification",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 10,),
                const Text(
                  "Please enter the OTP sent to your phone",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black38,
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20),

                Pinput(
                  length: 6,
                  showCursor: true,
                  controller: pinController,
                  androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
                  defaultPinTheme: PinTheme(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.mainColor
                      ),
                    ),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20
                    )
                  ),
                  onCompleted: (value){
                    setState(() {
                      otpCode = value;
                    });
                  },
                ),

                const SizedBox(height: 20,),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: (){
                        if(otpCode != null)
                          {
                            verifyOtp(context, otpCode!);
                          }
                        else
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                content: Text("Enter the 6-digit code", textAlign: TextAlign.center,),
                                duration: Duration(milliseconds: 2000),
                                ));
                          }
                      },
                      child: const Text(
                          "Verify"
                      )),
                ),

                const SizedBox(height: 20),

                const Text(
                    "Didn't receive any code?",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.placeholder,
                      fontWeight: FontWeight.w700
                    ),),

                const SizedBox(height: 10),

                const Text(
                  "Resend Code",
                  style: TextStyle(
                      fontSize: 14,
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.bold
                  ),)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void verifyOtp(BuildContext context, String userOtp){
    final otp = Provider.of<OtpProvider> (context, listen: false);
    otp.verifyOtp(
        context: context,
        verificationId: widget.verificationId,
        userOtp: userOtp,
        onSuccess: (){
          otp.checkExistingUser().then((value) async {
            if (value == true)
              {

              }
            else{
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SignUpScreen()), (route) => false);
            }
          });
        });
  }

}
