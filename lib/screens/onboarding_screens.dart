
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grab_meals/main.dart';
import 'package:grab_meals/screens/landing_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreens extends StatelessWidget {
  const OnboardingScreens({super.key});

  static const routeName = "/onBoardingScreens";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "Select a Restaurant",
              body: "Praesent luctus accumsan malesuada. spendisse rutrum pretium consequat.Pellentesque accumsan euismod tortor aliquam facilisis. In facilisis lacus leo, sit amet laoreet lectus facilisis quis.Sed tristique dictum mi, sit amet dignissim erat malesuada et.",
              image: buildSvgImage("assets/icons/slider-1.svg"),
              decoration: getPageDecoration()
            ),
            PageViewModel(
                title: "Choose Your Food",
                body: "Praesent luctus accumsan malesuada. spendisse rutrum pretium consequat.Pellentesque accumsan euismod tortor aliquam facilisis. In facilisis lacus leo, sit amet laoreet lectus facilisis quis.Sed tristique dictum mi, sit amet dignissim erat malesuada et.",
                image: buildImage("assets/icons/slider-2.png"),
                decoration: getPageDecoration()
            ),
            PageViewModel(
                title: "Secure Payment",
                body: "Praesent luctus accumsan malesuada. spendisse rutrum pretium consequat.Pellentesque accumsan euismod tortor aliquam facilisis. In facilisis lacus leo, sit amet laoreet lectus facilisis quis.Sed tristique dictum mi, sit amet dignissim erat malesuada et.",
                image: buildSvgImage("assets/icons/slider-3.svg"),
                decoration: getPageDecoration()
            ),
            PageViewModel(
                title: "Delivery To Your Door",
                body: "Praesent luctus accumsan malesuada. spendisse rutrum pretium consequat.Pellentesque accumsan euismod tortor aliquam facilisis. In facilisis lacus leo, sit amet laoreet lectus facilisis quis.Sed tristique dictum mi, sit amet dignissim erat malesuada et.",
                image: buildSvgImage("assets/icons/slider-4.svg"),
                decoration: getPageDecoration()
            ),
            PageViewModel(
                title: "Get 24/7 Support",
                body: "Praesent luctus accumsan malesuada. spendisse rutrum pretium consequat.Pellentesque accumsan euismod tortor aliquam facilisis. In facilisis lacus leo, sit amet laoreet lectus facilisis quis.Sed tristique dictum mi, sit amet dignissim erat malesuada et.",
                image: buildSvgImage("assets/icons/slider-5.svg"),
                decoration: getPageDecoration()
            ),
          ],
          showNextButton: true,
          next: const Icon(Icons.arrow_forward_ios_outlined),
          nextFlex: 0,
          showSkipButton: true,
          skip: const Text("Skip", style: TextStyle(fontSize: 18),),
          skipOrBackFlex: 0,
          dotsDecorator: getDotsDecoration(),
          isProgressTap: false,
          
          done: const Text(
          "Let's Go!",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            letterSpacing: 2
          ),
        ),
          onDone: ()=> goToHome(context),
        ));
  }

  Widget buildSvgImage(String path) {
    return Center(
      child: SvgPicture.asset(path, width: 350),
    );
  }
  Widget buildImage(String path){
    return Center(
      child: Image.asset(path, width: 350,),
    );
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      letterSpacing: 2),
      bodyTextStyle: TextStyle(fontSize: 20, letterSpacing: 2),
      bodyPadding: EdgeInsets.all(16.0),
      imagePadding: EdgeInsets.all(24.0),
      pageColor: Colors.white
    );
  }

  goToHome(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(LandingScreen.routeName);
  }

  DotsDecorator getDotsDecoration() {
    return DotsDecorator(
      activeColor: const Color(0xff4276B2),
      size: const Size(10, 10),
      activeSize: const Size(22, 10),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24)
        )
    );
  }
}
