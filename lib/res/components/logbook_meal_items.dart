import 'package:flutter/material.dart';
import 'package:healthandwellness/res/colors/app_color.dart';
import 'package:healthandwellness/res/components/responsive_height_width.dart';
import '../const_string/const_controls.dart';
import 'widget_repo.dart';

class LogBookMealItem extends StatefulWidget {
  final String title;
  final VoidCallback goto;
  final bool clicked;
  final AssetImage assetImage;

  const LogBookMealItem({
    Key? key,
    required this.title,
    required this.goto,
    this.clicked = false,
    required this.assetImage,
  }) : super(key: key);

  @override
  State<LogBookMealItem> createState() => _LogBookItemTitleState();
}

class _LogBookItemTitleState extends State<LogBookMealItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: displayWidth(context), //Constant.screenWidth,
      decoration: BoxDecoration(
        color: AppColors.lightSkyBlue,
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
                image: DecorationImage(image: widget.assetImage),
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
