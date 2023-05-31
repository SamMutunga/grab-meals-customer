
import 'package:flutter/material.dart';
import 'package:grab_meals/constants/colors.dart';

class SearchBar extends StatelessWidget {
  final String title;
  const SearchBar({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          color: AppColors.placeholderBg,
        ),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.search_outlined),
            hintText: title,
            hintStyle: const TextStyle(
              color: AppColors.placeholder,
              fontSize: 18,
            ),
            contentPadding: const EdgeInsets.only(
              top: 17,
            ),
          ),
        ),
      ),
    );
  }
}