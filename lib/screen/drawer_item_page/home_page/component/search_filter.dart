import 'package:flutter/material.dart';
import 'package:home_land/custom_widget/custom_text_field.dart';

class SearchBoxFilter extends StatelessWidget {
  const SearchBoxFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 250,
              child: CustomFormField(
                hintText: 'Search Here',
                icon: Icons.search,
              ),
            ),
            Container(
              height: 45,
              width: 100,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 67, 120, 235),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.filter_list,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Filter',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
