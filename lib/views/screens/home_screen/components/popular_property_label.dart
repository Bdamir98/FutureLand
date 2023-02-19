import 'package:flutter/material.dart';
import 'package:home_land/utils/constant.dart';
import 'package:home_land/views/pages/popular_property_see_all_list/popular_property_see_all_list.dart';
import 'package:home_land/views/widgets/custom_text.dart';

class PopularPropertyLabel extends StatelessWidget {
  const PopularPropertyLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customTitleText('Popular Property', purpleColor, 20),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PopularPropertySellAllList(),
            ));
          },
          child: Text(
            'See All',
            style: TextStyle(
                color: scaffoldBackgroundColor,
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
