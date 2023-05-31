
import 'package:flutter/material.dart';
import 'package:grab_meals/utils/helper.dart';
import 'package:grab_meals/widgets/custom_text_input.dart';

class ForgotPassScreen extends StatelessWidget{
  const ForgotPassScreen({super.key});

  static const routeName = "/forgotPass";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Column(
              children: [
                Text(
                  "Reset Password",
                  style: Helper.getTheme(context).headline6,
                ),
                const SizedBox(height: 30,),

                const Text(
                  "Please enter your email to receive a link for your password rest request",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20,),

                const CustomTextInput(hintText: "Your Email"),

                const SizedBox(height: 30,),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: (){},
                      child: const Text(
                          "Submit"
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}