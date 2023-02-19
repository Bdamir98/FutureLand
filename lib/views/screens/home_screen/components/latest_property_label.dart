import 'package:flutter/material.dart';
import 'package:home_land/utils/constant.dart';
import 'package:home_land/views/pages/latest_property_sell_all_list/latest_property_see_all_list.dart';
import 'package:home_land/views/widgets/custom_text.dart';

class LatestPropertyLabel extends StatelessWidget {
  const LatestPropertyLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customTitleText('Latest Property', purpleColor,20),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => LatestPropertySellAllList(),));
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
