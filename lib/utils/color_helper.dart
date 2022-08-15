import 'package:flutter/material.dart';
import 'constants.dart';

Color determineColorBasedOnChange(double change ) {
  return change < 0 
    ? AppColors.kNegativeColor 
    : AppColors.kPositiveColor;
}

TextStyle determineTextStyleBasedOnChange(double change ) {
  return change < 0 
    ?  TextStyles.kNegativeChange
    : TextStyles.kPositiveChange;
}

