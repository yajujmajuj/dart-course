// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:healthandwellness/res/components/app_sized_box.dart';
import 'package:healthandwellness/res/components/responsive_height_width.dart';
import 'package:healthandwellness/res/const_string/const_controls.dart';
import '../assets/image_assets.dart';
import '../colors/app_color.dart';

// ignore: must_be_immutable
class TextInit extends StatelessWidget {
  String textIn;
  double fSize;
  Color clr;
  FontWeight fontWeight;
  TextAlign textAlign;
  String fontFamily;

  TextInit({
    Key? key,
    required this.textIn,
    required this.fSize,
    this.clr = AppColors.cBlack,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.left,
    this.fontFamily = 'Montserrat',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textIn,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: fSize,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          color: clr),
    );
  }
}

// ignore: must_be_immutable
class GeneralButton extends StatelessWidget {
  bool clickAble = true;
  Color buttonColor;
  TextInit buttonTitle;
  double horizontalScale;
  double verticalScale;
  Function() doThis;

  GeneralButton(
      {Key? key,
      required this.clickAble,
      required this.buttonColor,
      required this.doThis,
      this.horizontalScale = 30,
      this.verticalScale = 30,
      required this.buttonTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: doThis,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(horizontalScale, verticalScale),
        backgroundColor: (clickAble) ? buttonColor : AppColors.cGrey,
        // padding:
        //     EdgeInsets.symmetric(horizontal: horizontalScale, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: buttonTitle,
    );
  }
}

// ignore: must_be_immutable
class SkipButton extends StatelessWidget {
  bool clickAble = true;
  Color buttonColor;
  TextInit buttonTitle;
  Function() doThis;

  SkipButton(
      {Key? key,
      required this.clickAble,
      required this.buttonColor,
      required this.doThis,
      required this.buttonTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: doThis,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: (clickAble) ? buttonColor : AppColors.cGrey,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        side: const BorderSide(width: 0.5, color: AppColors.cBlack),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: buttonTitle,
    );
  }
}

// ignore: must_be_immutable
class Loading extends StatelessWidget {
  Color color;

  Loading({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
        // strokeWidth: 1,
      ),
    );
  }
}
//
//

// ignore: must_be_immutable
class InputField extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  String fieldLabel;
  String fieldHint;
  double horizontalScale;
  double verticalScale;
  TextInputAction inputAction;
  bool ispassword;

  InputField({
    Key? key,
    required this.horizontalScale,
    this.verticalScale = 45,
    required this.fieldLabel,
    required this.fieldHint,
    required this.controller,
    required this.inputAction,
    this.ispassword = false,
  }) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  // ignore: non_constant_identifier_names
  bool Ispassword = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.verticalScale,
      width: widget.horizontalScale,
      child: TextFormField(
        obscureText: (Ispassword) ? true : false,
        cursorColor: AppColors.cTheme,
        textInputAction: widget.inputAction,
        controller: widget.controller,
        style: TextStyle(color: AppColors.cTheme),
        validator: (value) {
          return null;
        },
        onTap: () {
          if (widget.ispassword) {
            setState(() {
              Ispassword = true;
            });
          }
        },
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.symmetric(vertical: 0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.cGrey, width: 2.0),
            borderRadius: BorderRadius.circular(15.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.cTheme, width: 2.0),
            borderRadius: BorderRadius.circular(15.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.cRed, width: 2.0),
            borderRadius: BorderRadius.circular(15.0),
          ),
          contentPadding: const EdgeInsets.only(left: 20),
          fillColor: AppColors.cWhite,
          filled: true,
          labelText: widget.fieldLabel,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(color: AppColors.cGrey),
          hintText: widget.fieldHint,
          hintStyle: TextStyle(
            color: AppColors.cGrey,
          ),
          suffixIcon: (widget.ispassword)
              ? IconButton(
                  icon: Image.asset(
                    ImagePath.obsecureIcon,
                    color: Ispassword ? AppColors.cGrey : AppColors.cTheme,
                    height: 15,
                  ),
                  onPressed: () {
                    setState(() {
                      Ispassword = !Ispassword;
                    });
                  },
                )
              : const Text(''),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DropInField extends StatelessWidget {
  double verticalScale;
  double horizontalScale;
  TextInit hintText;

  DropInField({
    super.key,
    required this.horizontalScale,
    this.verticalScale = 45,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: verticalScale,
      width: horizontalScale,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: AppColors.cGrey),
          borderRadius: BorderRadius.circular(15)),
      child: DropdownButton(
        underline: Container(),
        borderRadius: BorderRadius.circular(15),
        hint: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: hintText,
        ),
        isExpanded: true,
        menuMaxHeight: 150,

        // value: 'c',
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: AppColors.cGrey,
        ),
        items: Constant.dummyList.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (String? value) {},
      ),
    );
  }
}

// ignore: must_be_immutable
class TileCard extends StatelessWidget {
  ImageIcon tileIcon;
  TextInit titleInfo;
  TextInit subtitleInfo;

  TileCard({
    super.key,
    required this.tileIcon,
    required this.titleInfo,
    required this.subtitleInfo,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: AppColors.cAvatarImage,
      leading: tileIcon,
      title: titleInfo,
      // contentPadding: EdgeInsets.non,
      minLeadingWidth: 0,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      subtitle: subtitleInfo,
    );
  }
}

class GuideBookTile extends StatefulWidget {
  final String title;
  final VoidCallback goto;
  final bool clicked;
  String leading;

  GuideBookTile({
    super.key,
    required this.title,
    required this.goto,
    required this.leading,
    this.clicked = false,
  });

  @override
  State<GuideBookTile> createState() => _GuideBookTileState();
}

class _GuideBookTileState extends State<GuideBookTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
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
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.only(left: 10),
            height: 50,
            width: 40,
            child: Image.asset(
              widget.leading,
              color: (widget.clicked) ? AppColors.cWhite : AppColors.cTheme,
            ),
          ),
          Expanded(
            child: Padding(
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
          ),
          GestureDetector(
            onTap: widget.goto,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
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

class TileRadioDate extends StatelessWidget {
  const TileRadioDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: displayWidth(context) * 0.10, //Constant.screenWidth * 0.10,
      child: Column(
        children: <Widget>[
          TextInit(textIn: '9:00 AM', fSize: 14),
          Radio(
            value: 'd',
            groupValue: 'd',
            onChanged: ((value) {}),
          ),
        ],
      ),
    );
  }
}

// make sure to wrap with the PreferredSize widget and min: Size should be 96 also
// wrap the bottom widget with defined 'bottomHeight' so appBar don't get disturbed.
// ignore: must_be_immutable
class TitleBar extends StatelessWidget {
  TextInit barTitle;
  List<Widget> barActions;
  Widget bottomWidgets;
  double bottomHeight;
  bool leadingStatus;
  Widget barLeading;

  TitleBar({
    super.key,
    required this.barTitle,
    required this.barActions,
    required this.bottomWidgets,
    this.bottomHeight = 40,
    this.leadingStatus = false,
    this.barLeading = const Text(''),
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: barLeading,
      // toolbarHeight: 100,
      elevation: 0,
      backgroundColor: AppColors.cTheme,
      title: barTitle,
      actions: barActions,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(bottomHeight),
        child: bottomWidgets,
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  TextInit barTitle;
  List<Widget> barActions;

  CustomAppBar({
    super.key,
    required this.barTitle,
    required this.barActions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.cTheme,
      title: barTitle,
      actions: barActions,
    );
  }
}

class HomeAppBar extends StatelessWidget {
  TextInit barTitle;
  List<Widget> barActions;
  Widget bottomWidgets;
  double bottomHeight;
  bool leadingStatus;
  Widget barLeading;

  HomeAppBar({
    super.key,
    required this.barTitle,
    required this.barActions,
    required this.bottomWidgets,
    this.bottomHeight = 40,
    this.leadingStatus = false,
    this.barLeading = const Text(''),
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.cTheme,
      elevation: 0,
      leading: const Center(),
      title: barTitle,
      leadingWidth: 0,
      actions: barActions,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(bottomHeight),
        child: bottomWidgets,
      ),
    );
  }
}

// Toggle Button for Day and Week

class GoBack extends StatelessWidget {
  const GoBack({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_rounded),
      onPressed: (() {
        Navigator.of(context).pop();
      }),
    );
  }
}

// ignore: must_be_immutable

class ProgramsTile extends StatelessWidget {
  final String title;
  final String workoutCount;
  final VoidCallback goto;

  const ProgramsTile({
    super.key,
    required this.title,
    required this.workoutCount,
    required this.goto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                    width: displayWidth(context) *
                        0.65, //Constant.screenWidth * 0.65,
                    child: TextInit(textIn: title, fSize: 14)),
                TextInit(
                  textIn: workoutCount,
                  fSize: 12,
                  clr: AppColors.cGrey,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, right: 10, bottom: 5),
            height: 70,
            decoration: BoxDecoration(
              color: AppColors.cWhite,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: GestureDetector(
              onTap: goto,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.keyboard_arrow_right_sharp),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProgramOverviewContainsHelper extends StatelessWidget {
  final String pathImage;
  final String type;

  const ProgramOverviewContainsHelper({
    super.key,
    required this.pathImage,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context) * 0.37, //Constant.screenWidth * 0.37,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.cAvatarImage,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        children: <Widget>[
          ImageIcon(
            AssetImage(pathImage),
            color: AppColors.cTheme,
            size: 15,
          ),
          5.pw, //horizontalCavity(5),
          TextInit(
            textIn: '05',
            fSize: 14,
            fontWeight: FontWeight.bold,
          ),
          5.pw, //horizontalCavity(5),
          TextInit(
            textIn: type,
            fSize: 14,
            clr: AppColors.cGrey,
          ),
        ],
      ),
    );
  }
}

class ProgramOverviewContains extends StatelessWidget {
  const ProgramOverviewContains({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      runSpacing: 5,
      children: [
        ProgramOverviewContainsHelper(
          pathImage: ImagePath.programOverviewSection,
          type: 'Section',
        ),
        ProgramOverviewContainsHelper(
          pathImage: ImagePath.programOverviewExercise,
          type: 'Exercices',
        ),
        ProgramOverviewContainsHelper(
          pathImage: ImagePath.programOverviewCircuit,
          type: 'Circuit',
        ),
      ],
    );
  }
}

class ProgramStarterContainsHelper extends StatelessWidget {
  final String pathImage;

  const ProgramStarterContainsHelper({
    super.key,
    required this.pathImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.iconImage, borderRadius: BorderRadius.circular(25)),
      child: ImageIcon(
        AssetImage(pathImage),
        color: AppColors.cTheme,
        size: 15,
      ),
    );
  }
}

class ProgramStarterContainer extends StatelessWidget {
  const ProgramStarterContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 202,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.cWhite,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 10,
            decoration: BoxDecoration(
              color: AppColors.cTheme,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextInit(
                textIn: 'Foam Roll Quadriceps',
                fSize: 16,
                fontWeight: FontWeight.bold,
                clr: AppColors.textColor1,
              ),
              const SizedBox(height: 10),
              TextInit(
                textIn:
                    'Sets: 3, Reps: 10 passes ea, Time: 45, Tempo: Med, Rest: None',
                fSize: 9,
                fontWeight: FontWeight.normal,
                clr: AppColors.textColor2,
              ),
              SizedBox(
                width: 270,
                child: Divider(
                  thickness: 1,
                  color: AppColors.dividerColor,
                ),
              ),
              const SizedBox(height: 5),
              TextInit(
                textIn: 'Notes',
                fSize: 16,
                fontWeight: FontWeight.bold,
                clr: AppColors.textColor1,
              ),
              const SizedBox(height: 5),
              TextInit(
                textIn:
                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed',
                fSize: 9,
                fontWeight: FontWeight.normal,
                clr: AppColors.textColor2,
              ),
              SizedBox(
                width: 270,
                child: Divider(
                  thickness: 1,
                  color: AppColors.dividerColor,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  TextInit(
                    textIn: 'Set Saved: 0',
                    fSize: 9,
                    fontWeight: FontWeight.normal,
                    clr: AppColors.textColor2,
                  ),
                  const SizedBox(
                    width: 90,
                  ),
                  ProgramStarterContainsHelper(
                      pathImage: ImagePath.programStartIconEx),
                  const SizedBox(
                    width: 10,
                  ),
                  ProgramStarterContainsHelper(
                      pathImage: ImagePath.programStartIconDash),
                  const SizedBox(
                    width: 10,
                  ),
                  ProgramStarterContainsHelper(
                      pathImage: ImagePath.programStartIconInfo),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class SnackBarButtonWidget extends StatefulWidget {
  Color clr;
  double borderWidth;
  bool isButtonSelected;
  Function() func;

  SnackBarButtonWidget({
    Key? key,
    this.clr = AppColors.textColor2,
    this.borderWidth = 1.0,
    required this.isButtonSelected,
    required this.func,
  }) : super(key: key);

  @override
  State<SnackBarButtonWidget> createState() => _SnackBarButtonWidgetState();
}

class _SnackBarButtonWidgetState extends State<SnackBarButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.func,
      child: Container(
        height: size.height * .06,
        width: size.width * .3,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(40),
          border: (widget.isButtonSelected)
              ? Border.all(width: 0, color: Colors.white)
              : Border.all(
                  color: widget.clr,
                  width: widget.borderWidth,
                ),
        ),
        child: Center(
          child: TextInit(
            textIn: 'Stopwatch',
            fSize: 12,
            clr: AppColors.textColor1,
          ),
        ),
      ),
    );
  }
}

class LogBookTile extends StatefulWidget {
  final String title;
  final VoidCallback goto;
  final bool clicked;

  const LogBookTile({
    super.key,
    required this.title,
    required this.goto,
    this.clicked = false,
  });

  @override
  State<LogBookTile> createState() => _LogBookTileState();
}

class _LogBookTileState extends State<LogBookTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
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
                    (widget.clicked)
                        ? ImagePath.foodDiaryIcon2
                        : ImagePath.foodDiaryIcon,
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

class LogBookItemTitle extends StatefulWidget {
  final String title;
  final VoidCallback goto;
  final bool clicked;

  const LogBookItemTitle({
    Key? key,
    required this.title,
    required this.goto,
    this.clicked = false,
  }) : super(key: key);

  @override
  State<LogBookItemTitle> createState() => _LogBookItemTitleState();
}

class _LogBookItemTitleState extends State<LogBookItemTitle> {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: displayWidth(context),
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
                    (widget.clicked)
                        ? ImagePath.foodDiaryIcon2
                        : ImagePath.foodDiaryIcon,
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
