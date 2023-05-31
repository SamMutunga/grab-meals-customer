import 'package:flutter/material.dart';
import 'package:grab_meals/constants/colors.dart';
import 'package:grab_meals/screens/forgot_password.dart';
import 'package:grab_meals/screens/homescreen.dart';
import 'package:grab_meals/screens/sign_up.dart';
import 'package:grab_meals/utils/custom_text_input.dart';
import 'package:grab_meals/utils/helper.dart';
import 'package:grab_meals/widgets/custom_text_input.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});

  static const routeName = "/loginscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 30
              ),
              child: Column(
                children: [
                  Text(
                      "Login",
                  style: Helper.getTheme(context).headline6,),

                  const Spacer(),

                  const Text(
                      "Add your details to login",

                  ),
                  const Spacer(),

                  const CustomTextInput(hintText: "Your Email",),

                  const Spacer(),

                  const CustomTextInput(hintText: "Your Password",),

                  const Spacer(),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                        },
                        child: const Text(
                          "Login"
                        )),
                  ),

                  const Spacer(),

                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushReplacementNamed(ForgotPassScreen.routeName);
                    },
                    child: const Text(
                      "Forgot your Password?"
                    ),
                  ),

                  const Spacer(flex: 2,),

                  const Text(
                    "Or"
                  ),

                  const Spacer(),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(AppColors.mainColor),
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(
                              const StadiumBorder(
                                  side: BorderSide(
                                      color: AppColors.mainColor,
                                      width: 1.5
                                  )
                              ))
                      ),
                      onPressed: () {  },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Helper.getIconAssetName("facebook_logo.png"),
                            width: 40,
                            height: 40,
                          ),
                          const SizedBox(width: 20,),
                          const Text(
                            "Sign in with Facebook"
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Spacer(),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(AppColors.mainColor),
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(
                              const StadiumBorder(
                                  side: BorderSide(
                                      color: AppColors.mainColor,
                                      width: 1.5
                                  )
                              ))
                      ),
                      onPressed: () {  },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Helper.getIconAssetName("google_logo.png"),
                            width: 40,
                            height: 40,
                          ),
                          const SizedBox(width: 20,),
                          const Text(
                              "Sign in with Google"
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Spacer(flex: 4,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                          "Don't Have an Account?"
                      ),
                      const SizedBox(width: 5,),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushReplacementNamed(SignUpScreen.routeName);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const[
                            Text(
                              "Sign Up Today!",
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
            )),
      ),
    );
  }

}
