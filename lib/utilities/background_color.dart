import 'package:flutter/material.dart';
import 'package:nimbus_cast/utilities/colors.dart';

Color backGroundColorPicker(int codes){
  switch (codes) {
    case 804:
      return c1.withOpacity(0.7);

    case 803:
      return c1.withOpacity(0.7);

    case 800:
      return c1.withOpacity(0.3);

    case 731:
      return c1.withOpacity(0.8);

    case 741:
      return c1.withOpacity(0.8);

    case 700:
      return c1.withOpacity(0.8);

    case 711:
      return c1.withOpacity(0.8);

    case 721:
      return c1.withOpacity(0.8);

    case 802:
      return c1.withOpacity(0.5);

    case 801:
      return c1.withOpacity(0.5);

    case 202:
      return c1.withOpacity(0.9);

    case 232:
      return c1.withOpacity(1);

    case 200:
      return c1.withOpacity(0.9);

    case 201:
      return c1.withOpacity(0.8);

    case 230:
      return c1.withOpacity(0.9);

    case 231:
      return c1.withOpacity(0.8);

    default:
      return Colors.white;
  }
}