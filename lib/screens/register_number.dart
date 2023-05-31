
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grab_meals/constants/colors.dart';
import 'package:grab_meals/providers/otp_provider.dart';
import 'package:grab_meals/utils/helper.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class NumberRegistration extends StatefulWidget {
  const NumberRegistration({Key? key}) : super(key: key);

  static const routeName = "/numberRegistration";

  @override
  State<NumberRegistration> createState() => _NumberRegistrationState();
}

class _NumberRegistrationState extends State<NumberRegistration> {

  final TextEditingController phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: phoneController.text.length
      )
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: Column(
              children: [
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
                  "Register",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 10,),
                const Text(
                  "Please enter your phone number to continue your registration process",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20,),

                IntlPhoneField(
                  controller: phoneController,
                  cursorColor: AppColors.mainColor,
                  onChanged: (value){
                    setState(() {
                      phoneController.text = value as String;
                    });
                  },
                  decoration:InputDecoration(
                    border: const OutlineInputBorder(
                        borderSide: BorderSide()
                    ),
                    suffixIcon: phoneController.text.length >10
                    ? Container(
                      height: 30,
                      width: 30,
                      margin: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green
                      ),
                      child: const Icon(Icons.check, color: Colors.white, size: 20,),
                    ): null,
                    hintText: "Phone Number",
                    hintStyle: const TextStyle(
                        color: AppColors.placeholder
                    ),
                  ),
                  initialCountryCode: 'KE',
                  keyboardType: TextInputType.phone,
                ),

                const SizedBox(height: 20,),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: (){
                        sendPhoneNumber();
                      },
                      child: const Text(
                          "Send OTP"
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sendPhoneNumber()
  {
    final otp = Provider.of<OtpProvider>(context,listen: false);
    String phoneNumber = phoneController.text.trim();
    otp.signInWithPhone(context, phoneNumber);
  }
}
