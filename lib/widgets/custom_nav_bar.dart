
import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/material.dart';
import 'package:grab_meals/constants/colors.dart';
import 'package:grab_meals/screens/homescreen.dart';
import 'package:grab_meals/screens/menu_screen.dart';
import 'package:grab_meals/screens/more_screen.dart';
import 'package:grab_meals/screens/offers_screen.dart';
import 'package:grab_meals/screens/profile_screen.dart';
import 'package:grab_meals/utils/helper.dart';

class CustomNavBar extends StatelessWidget {
  final bool home;
  final bool menu;
  final bool offer;
  final bool profile;
  final bool more;

  const CustomNavBar(
      {Key? key,
        this.home = false,
        this.menu = false,
        this.offer = false,
        this.profile = false,
        this.more = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 94,
      width: Helper.getScreenWidth(context),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipShadow(
              boxShadow: const [
                BoxShadow(
                  color: AppColors.placeholder,
                  offset: Offset(
                    0,
                    -1,
                  ),
                  blurRadius: 5,
                ),
              ],
              clipper: CustomNavBarClipper(),
              child: Container(
                height: 65,
                width: Helper.getScreenWidth(context),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (!menu) {
                          Navigator.of(context)
                              .pushReplacementNamed(MenuScreen.routeName);
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          menu
                              ? Image.asset(
                            Helper.getIconAssetName(
                                "more_filled.png"),
                          )
                              : Image.asset(
                            Helper.getIconAssetName("more.png"),
                          ),
                          menu
                              ? const Text("Menu",
                              style: TextStyle(color: AppColors.mainColor))
                              : const Text("Menu"),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (!offer) {
                          Navigator.of(context)
                              .pushReplacementNamed(OffersScreen.routeName);
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          offer
                              ? const Icon(Icons.shopping_bag, color: AppColors.mainColor,)
                              : const Icon(Icons.shopping_bag_outlined),
                          offer
                              ? const Text("Offers",
                              style: TextStyle(color: AppColors.mainColor))
                              : const Text("Offers"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (!profile) {
                          Navigator.of(context)
                              .pushReplacementNamed(ProfileScreen.routeName);
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          profile
                              ? const Icon(Icons.account_circle, color: AppColors.mainColor,)
                              : const Icon(Icons.account_circle_outlined),
                          profile
                              ? const Text("Profile",
                              style: TextStyle(color: AppColors.mainColor))
                              : const Text("Profile"),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (!more) {
                          Navigator.of(context)
                              .pushReplacementNamed(MoreScreen.routeName);
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          more
                              ? const Icon(Icons.menu, color: AppColors.mainColor,)
                              : const Icon(Icons.menu_outlined),
                          more
                              ? const Text("More",
                              style: TextStyle(color: AppColors.mainColor))
                              : const Text("More"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 70,
              width: 70,
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: home ? AppColors.mainColor : AppColors.placeholder,
                onPressed: () {
                  if (!home) {
                    Navigator.of(context)
                        .pushReplacementNamed(HomeScreen.routeName);
                  }
                },
                child: Image.asset(Helper.getIconAssetName("circle.png"))
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.3, 0);
    path.quadraticBezierTo(
      size.width * 0.375,
      0,
      size.width * 0.375,
      size.height * 0.1,
    );
    path.cubicTo(
      size.width * 0.4,
      size.height * 0.9,
      size.width * 0.6,
      size.height * 0.9,
      size.width * 0.625,
      size.height * 0.1,
    );
    path.quadraticBezierTo(
      size.width * 0.625,
      0,
      size.width * 0.7,
      0.1,
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}