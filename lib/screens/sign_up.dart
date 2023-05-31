import 'package:flutter/material.dart';
import 'package:grab_meals/constants/colors.dart';
import 'package:grab_meals/screens/login.dart';
import 'package:grab_meals/utils/custom_text_input.dart';
import 'package:grab_meals/utils/helper.dart';
import 'package:grab_meals/widgets/custom_text_input.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:passwordfield/passwordfield.dart';


class SignUpScreen extends StatelessWidget{
  const SignUpScreen({super.key});

  static const routeName = "/signupscreen";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 30),
            child: Column(
              children: [
                Text(
                  "Sign Up",
                  style: Helper.getTheme(context).headline6,
                ),
                const Spacer(),

                const CustomTextInput(hintText: "Your Name"),

                const Spacer(),

                const CustomTextInput(hintText: "Your Email"),

                const Spacer(),

                PasswordField(
                  passwordConstraint: r'.*[@$#.*].*',
                  inputDecoration: PasswordDecoration(
                    inputPadding: const EdgeInsets.only(left: 20),
                    hintStyle: const TextStyle(
                      color: AppColors.placeholder
                    )
                  ),
                  hintText: 'Your Password',
                  border: PasswordBorder(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.placeholder,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.placeholder,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(width: 2, color: Colors.red.shade200),
                    ),
                  ),
                  errorMessage:
                  'must contain special character either . * @ # \$',
                ),

                const Spacer(),

                const CustomTextInput(hintText: "Confirm Password"),

                const Spacer(flex: 5,),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: (){},
                      child: const Text(
                          "Sign Up"
                      )),
                ),
                const SizedBox(height: 50,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                        "Already have an Account?"
                    ),
                    const SizedBox(width: 5,),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const[
                          Text(
                            "Sign In!",
                            style: TextStyle(
                                color: AppColors.mainColor,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      )
    );
  }

}
