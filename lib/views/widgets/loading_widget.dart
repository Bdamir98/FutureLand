import 'package:flutter/cupertino.dart';
import 'package:home_land/utils/constant.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

showLoadingDialog(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (context) => Center(
      child: LoadingAnimationWidget.bouncingBall(color: purpleColor, size: 20),
    ),
  );
}
