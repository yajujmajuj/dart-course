import 'package:flutter/material.dart';
import 'package:healthandwellness/res/components/responsive_height_width.dart';
import '../const_string/const_controls.dart';
import 'widget_repo.dart';
import '../colors/app_color.dart';

class LogBookDrinkItem extends StatefulWidget {
  final String title;
  final VoidCallback goto;
  final bool clicked;
  final AssetImage assetImage;

  const LogBookDrinkItem({
    Key? key,
    required this.title,
    required this.goto,
    this.clicked = false,
    required this.assetImage,
  }) : super(key: key);

  @override
  State<LogBookDrinkItem> createState() => _LogBookItemTitleState();
}

class _LogBookItemTitleState extends State<LogBookDrinkItem> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.only(left: 10),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              image: DecorationImage(image: widget.assetImage),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 15),
            width: 60,
            alignment: Alignment.center,
            child: TextInit(
              textIn: widget.title,
              fSize: 14,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20, left: width * 0.165),
            height: 50,
            width: 130,
            decoration: BoxDecoration(
              color: AppColors.cWhite,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.cTheme),
                  child: Icon(
                    Icons.add,
                    color: AppColors.cWhite,
                  ),
                ),
                TextInit(textIn: '0', fSize: 14, fontWeight: FontWeight.bold),
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.cTheme),
                  child: Icon(
                    Icons.remove,
                    color: AppColors.cWhite,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
