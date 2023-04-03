import 'package:flutter/material.dart';
import 'package:healthandwellness/res/components/responsive_height_width.dart';
import 'package:healthandwellness/res/components/widget_repo.dart';

import '../colors/app_color.dart';

class PartGuideTile extends StatefulWidget {
  final String title;
  final VoidCallback goto;
  final bool clicked;
  final String image;

  const PartGuideTile({
    Key? key,
    required this.title,
    required this.goto,
    this.clicked = false,
    required this.image,
  }) : super(key: key);

  @override
  State<PartGuideTile> createState() => _PartGuideTileState();
}

class _PartGuideTileState extends State<PartGuideTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: EdgeInsets.only(bottom: displayHeight(context) * 0.009),
      width: displayWidth(context), //Constant.screenWidth,
      decoration: BoxDecoration(
        color: (widget.clicked) ? AppColors.cTheme : AppColors.lightSkyBlue,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.only(left: 10),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    widget.image,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: SizedBox(
              width:
                  displayWidth(context) * 0.65, //Constant.screenWidth * 0.65,
              child: TextInit(
                textIn: widget.title,
                fSize: 14,
              ),
            ),
          ),
          GestureDetector(
            onTap: widget.goto,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.keyboard_arrow_right_sharp,
                color: (widget.clicked) ? AppColors.cWhite : AppColors.cTheme,
              ),
            ),
          )
        ],
      ),
    );
  }
}
