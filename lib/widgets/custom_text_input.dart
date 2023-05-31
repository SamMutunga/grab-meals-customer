import 'package:flutter/material.dart';
import 'package:grab_meals/constants/colors.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    required String hintText,
    Key? key,
    EdgeInsets padding = const EdgeInsets.only(left: 40),
  }) : _hintText = hintText, _padding = padding, super(key: key);

  final String _hintText;
  final EdgeInsets _padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const BoxDecoration(
        color: AppColors.placeholderBg,
      ),
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.placeholder,
            ),
          ),
          hintText: _hintText,
          hintStyle: const TextStyle(
              color: AppColors.placeholder
          ),
          contentPadding: _padding,

        ),
      ),
    );
  }
}