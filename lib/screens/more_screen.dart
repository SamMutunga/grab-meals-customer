
import 'package:flutter/material.dart';
import 'package:grab_meals/constants/colors.dart';
import 'package:grab_meals/screens/about_screen.dart';
import 'package:grab_meals/screens/inbox_screen.dart';
import 'package:grab_meals/screens/notification_screen.dart';
import 'package:grab_meals/screens/order_screen.dart';
import 'package:grab_meals/screens/payment_screen.dart';
import 'package:grab_meals/utils/helper.dart';
import 'package:grab_meals/widgets/custom_nav_bar.dart';

class MoreScreen extends StatelessWidget {
  static const routeName = "/moreScreen";

  const MoreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              height: Helper.getScreenHeight(context),
              width: Helper.getScreenWidth(context),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "More",
                        style: Helper.getTheme(context).headline5,
                      ),
                      const Icon(Icons.shopping_cart)
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MoreCard(
                    image: Image.asset(
                      Helper.getIconAssetName("income.png"),
                    ),
                    name: "Payment Details",
                    handler: () {
                      Navigator.of(context).pushNamed(PaymentScreen.routeName);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MoreCard(
                    image: Image.asset(
                      Helper.getIconAssetName("shopping_bag.png"),
                    ),
                    name: "My Orders",
                    handler: () {
                      Navigator.of(context).pushNamed(OrderScreen.routeName);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MoreCard(
                    image: Image.asset(
                      Helper.getIconAssetName("notification.png"),
                    ),
                    name: "Notifications",
                    isNoti: true,
                    handler: () {
                      Navigator.of(context)
                          .pushNamed(NotificationScreen.routeName);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MoreCard(
                    image: Image.asset(
                      Helper.getIconAssetName("mail.png"),
                    ),
                    name: "Inbox",
                    handler: () {
                      Navigator.of(context).pushNamed(InboxScreen.routeName);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MoreCard(
                    image: Image.asset(
                      Helper.getIconAssetName("info.png"),
                    ),
                    name: "About Us",
                    handler: () {
                      Navigator.of(context).pushNamed(AboutScreen.routeName);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(
              more: true,
            ),
          )
        ],
      ),
    );
  }
}

class MoreCard extends StatelessWidget {
  const MoreCard({
    Key? key,
    required String name,
    required Image image,
    bool isNoti = false,
    required VoidCallback handler,
  })  : _name = name,
        _image = image,
        _isNoti = isNoti,
        _handler = handler,
        super(key: key);

  final String? _name;
  final Image? _image;
  final bool? _isNoti;
  final VoidCallback _handler;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handler,
      child: SizedBox(
        height: 70,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              margin: const EdgeInsets.only(
                right: 20,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: AppColors.placeholderBg,
              ),
              child: Row(
                children: [
                  Container(
                      width: 50,
                      height: 50,
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(),
                        color: AppColors.placeholder,
                      ),
                      child: _image),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    _name!,
                    style: const TextStyle(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 30,
                width: 30,
                decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                  color: AppColors.placeholderBg,
                ),
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.secondary,
                  size: 17,
                ),
              ),
            ),
            if (_isNoti!)
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 20,
                  width: 20,
                  margin: const EdgeInsets.only(
                    right: 50,
                  ),
                  decoration: const ShapeDecoration(
                    shape: CircleBorder(),
                    color: Colors.red,
                  ),
                  child: const Center(
                    child: Text(
                      "15",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}