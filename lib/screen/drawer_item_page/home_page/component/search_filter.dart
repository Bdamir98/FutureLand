import 'package:flutter/material.dart';
import 'package:home_land/custom_widget/custom_text_field.dart';

class SearchBoxFilter extends StatelessWidget {
  const SearchBoxFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 55,
            width: 280,
            child: CustomFormField(
              hintText: 'Search Here',
              icon: Icons.search,
            ),
          ),
        ],
      ),
    );
  }
}
