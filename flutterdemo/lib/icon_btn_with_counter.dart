import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    Key? key,
    required this.svgSrc,
    this.numOfItems = 0,
    required this.press,

  }) : super(key: key);

  final String svgSrc;
  final int numOfItems;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        // overflow: Overflow.visible,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              color: Colors.black12,
              shape: BoxShape.circle,
              
              ),
              child: SvgPicture.asset(svgSrc),
          ),
          if (numOfItems != 0)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                color: Color(0xFFFF4848),
                shape: BoxShape.circle,
                border: Border.all(width: 1.5, color: Colors.white),
              ),
              child: Center(
                child: Text("$numOfItems",
                style: TextStyle(
                  fontSize: 9,
                  height: 1,
                  color: Colors.white,
                  fontWeight: FontWeight.w600, 
                ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
