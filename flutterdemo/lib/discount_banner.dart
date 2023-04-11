import 'package:flutter/material.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15
        ),
      width: double.infinity,
      // height: 90,
      decoration: BoxDecoration(
        color: Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          text: "Khuyến mãi mô hình đón Giáng Sinh\n",
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(
              text: "Giảm 20%",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            )
          ]
          )
        ),
    );
  }
}
