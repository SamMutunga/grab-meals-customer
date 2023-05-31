import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/material.dart';
import 'package:grab_meals/constants/colors.dart';
import 'package:grab_meals/screens/login.dart';
import 'package:grab_meals/screens/register_number.dart';
import 'package:grab_meals/screens/sign_up.dart';
import 'package:grab_meals/utils/helper.dart';

class LandingScreen extends StatelessWidget{
  const LandingScreen({super.key});

  static const routeName = "/landingScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ClipShadow(
                clipper: CustomClipperAppBar(),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.placeholder,
                    offset: Offset(0, 15),
                    blurRadius: 10
                  )
                ],
                child: Container(
                  width: double.infinity,
                  height: Helper.getScreenHeight(context) * 0.5,
                  decoration: ShapeDecoration(
                      color: AppColors.mainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                  child: Image.asset(
                    Helper.getImageAssetName("landing_bg.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                Helper.getIconAssetName("circle.png"),
                width: 200,
                height: 200,
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: Helper.getScreenHeight(context) * 0.3,
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: [
                    const Flexible(
                      child: Text(
                        "Discover the best foods from over 100 restaurants and fast delivery at your doorstep!",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Spacer(flex: 2,),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: (){
                            Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                          },
                          child: const Text(
                            "Welcome Back!"
                          )),
                    ),
                    const SizedBox(height: 20,),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: (){
                            Navigator.of(context).pushReplacementNamed(NumberRegistration.routeName);
                          },
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
                          child: const Text(
                              "No Account? Join Us Today!"
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}

class CustomClipperAppBar extends CustomClipper<Path>{

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper){
    return true;
  }

  @override
  Path getClip(Size size) {
    Offset controlPoint = Offset(size.width * 0.24, size.height);
    Offset controlPoint2 = Offset(size.width * 0.3, size.height * 0.78);
    Offset controlPoint3 = Offset(size.width * 0.7, size.height * 0.78);
    Offset controlPoint4 = Offset(size.width * 0.76, size.height);
    Offset endPoint = Offset(size.width * 0.25, size.height * 0.96);
    Offset endPoint2 = Offset(size.width * 0.5, size.height * 0.78);
    Offset endPoint3 = Offset(size.width * 0.75, size.height * 0.96);
    Offset endPoint4 = Offset(size.width * 0.79, size.height);

    Path path = Path()
    ..lineTo(0, size.height)
    ..lineTo(size.width * 0.21, size.height)
    ..quadraticBezierTo(
        controlPoint.dx,
        controlPoint.dy,
        endPoint.dx,
        endPoint.dy)

    ..quadraticBezierTo(
      controlPoint2.dx,
      controlPoint2.dy,
      endPoint2.dx,
      endPoint2.dy)

    ..quadraticBezierTo(
      controlPoint3.dx,
      controlPoint3.dy,
      endPoint3.dx,
      endPoint3.dy)

    ..quadraticBezierTo(
        controlPoint4.dx,
        controlPoint4.dy,
        endPoint4.dx,
        endPoint4.dy)
    ..lineTo(size.width, size.height)
    ..lineTo(size.width, 0);
    return path;
  }
}