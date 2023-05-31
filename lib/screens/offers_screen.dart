
import 'package:flutter/material.dart';
import 'package:grab_meals/constants/colors.dart';
import 'package:grab_meals/utils/helper.dart';
import 'package:grab_meals/widgets/custom_nav_bar.dart';

class OffersScreen extends StatelessWidget {
  static const routeName = "/offersScreen";

  const OffersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              height: Helper.getScreenHeight(context),
              width: Helper.getScreenWidth(context),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Latest Offers",
                            style: Helper.getTheme(context).headline5,
                          ),
                          const Icon(Icons.shopping_cart)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: const [Text("Find discounts, Special Offers")],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 30,
                            width: Helper.getScreenWidth(context) * 0.4,
                            child: ElevatedButton(
                                onPressed: () {}, child: const Text("Check Offers")),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    OfferCard(
                      image: Image.asset(
                        Helper.getImageAssetName("breakfast.jpg"),
                        fit: BoxFit.cover,
                      ),
                      name: "Cafe de Noires",
                    ),
                    OfferCard(
                      image: Image.asset(
                        Helper.getImageAssetName("western2.jpg"),
                        fit: BoxFit.cover,
                      ),
                      name: "Isso",
                    ),
                    OfferCard(
                      image: Image.asset(
                        Helper.getImageAssetName("coffee3.jpg"),
                        fit: BoxFit.cover,
                      ),
                      name: "Cafe Beans",
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(
              offer: true,
            ),
          )
        ],
      ),
    );
  }
}

class OfferCard extends StatelessWidget {
  const OfferCard({
    Key? key,
    required String name,
    required Image image,
  })  : _image = image,
        _name = name,
        super(key: key);

  final String _name;
  final Image _image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 200, width: double.infinity, child: _image),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  _name,
                  style: Helper.getTheme(context).headline4!.copyWith(color: AppColors.primary),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: const [
                Icon(Icons.star, color: Colors.yellowAccent),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "4.9",
                  style: TextStyle(
                    color: AppColors.mainColor,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text("(124 ratings) Cafe"),
                SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    ".",
                    style: TextStyle(
                        color: AppColors.mainColor, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(" Western Food"),
              ],
            ),
          )
        ],
      ),
    );
  }
}