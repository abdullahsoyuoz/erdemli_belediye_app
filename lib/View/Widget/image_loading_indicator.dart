import 'package:erdemli_bel_app/View/Style/colors.dart';
import 'package:flutter/material.dart';

Widget loadingIndicator(
    BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
  return loadingProgress == null
      ? child
      : Center(
          child: CircularProgressIndicator(
            value: loadingProgress.cumulativeBytesLoaded.toDouble() /
                loadingProgress.expectedTotalBytes.toDouble(),
            color: AppColors.blue,
          ),
        );
}