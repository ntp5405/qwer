import 'package:flutter/material.dart';
import 'package:flutterdemo/search_field.dart';

import 'icon_btn_with_counter.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            // numOfItems: 3,
            press: () {},
          ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/bell.svg",
            numOfItems: 3,
            press: () {},
          )
        ],
      ),
    );
  }
}