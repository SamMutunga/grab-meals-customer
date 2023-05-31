
import 'package:flutter/material.dart';
import 'package:grab_meals/constants/colors.dart';
import 'package:grab_meals/utils/helper.dart';
import 'package:grab_meals/widgets/custom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = "/profileScreen";

  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SizedBox(
              height: Helper.getScreenHeight(context),
              width: Helper.getScreenWidth(context),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Profile",
                            style: Helper.getTheme(context).headline5,
                          ),
                          const Icon(Icons.shopping_cart)
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ClipOval(
                        child: Stack(
                          children: [
                            const SizedBox(
                              height: 80,
                              width: 80,
                              child: Icon(Icons.account_circle)
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: 20,
                                width: 80,
                                color: Colors.black.withOpacity(0.3),
                                child: const Icon(Icons.camera_alt,)
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.edit, color: AppColors.mainColor,),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Edit Profile",
                            style: TextStyle(color: AppColors.mainColor),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: Helper.getScreenHeight(context) * 0.6,
                        width: Helper.getScreenWidth(context),
                        child: Stack(
                          children: [
                            Container(
                              height: double.infinity,
                              width: 100,
                              decoration: const ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                    ),
                                  ),
                                  color: AppColors.mainColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Hi there Emilia!",
                                    style: Helper.getTheme(context).headline4!.copyWith(color: AppColors.primary,),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text("Sign Out"),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  const CustomFormInput(
                                    label: "Name",
                                    value: "Emilia Clarke",
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const CustomFormInput(
                                    label: "Email",
                                    value: "emiliaclarke@email.com",
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const CustomFormInput(
                                    label: "Mobile No",
                                    value: "emiliaclarke@email.com",
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const CustomFormInput(
                                    label: "Address",
                                    value: "No 23, 6th Lane, Colombo 03",
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const CustomFormInput(
                                    label: "Password",
                                    value: "Emilia Clarke",
                                    isPassword: true,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const CustomFormInput(
                                    label: "Confirm Password",
                                    value: "Emilia Clarke",
                                    isPassword: true,
                                  ),

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Save"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(
              profile: true,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomFormInput extends StatelessWidget {
  const CustomFormInput({
    Key? key,
    required String label,
    required String value,
    bool isPassword = false,
  })  : _label = label,
        _value = value,
        _isPassword = isPassword,
        super(key: key);

  final String _label;
  final String _value;
  final bool _isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.only(left: 40),
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        color: AppColors.placeholderBg,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: _label,
          contentPadding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
        ),
        obscureText: _isPassword,
        initialValue: _value,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}