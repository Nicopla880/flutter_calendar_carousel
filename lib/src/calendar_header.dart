import 'package:flutter/material.dart';
import 'default_styles.dart' show defaultHeaderTextStyle;

class CalendarHeader extends StatelessWidget {
  /// Passing in values for [leftButtonIcon] or [rightButtonIcon] will override [headerIconColor]
  CalendarHeader(
      {@required this.headerTitle,
      this.headerMargin,
      this.showHeader,
      this.headerTextStyle,
      this.showHeaderButtons,
      this.headerIconColor,
      this.leftButtonIcon,
      this.rightButtonIcon,
      this.headerColor,
      @required this.onLeftButtonPressed,
      @required this.onRightButtonPressed,
      this.isTitleTouchable,
      @required this.onHeaderTitlePressed});

  final String headerTitle;
  final EdgeInsetsGeometry headerMargin;
  final bool showHeader;
  final TextStyle headerTextStyle;
  final bool showHeaderButtons;
  final Color headerIconColor;
  final Widget leftButtonIcon;
  final Color headerColor;
  final Widget rightButtonIcon;
  final VoidCallback onLeftButtonPressed;
  final VoidCallback onRightButtonPressed;
  final bool isTitleTouchable;
  final VoidCallback onHeaderTitlePressed;

  TextStyle get getTextStyle =>
      headerTextStyle != null ? headerTextStyle : defaultHeaderTextStyle;

  Widget _leftButton() => IconButton(
        onPressed: onLeftButtonPressed,
        icon: leftButtonIcon ?? Icon(Icons.chevron_left, color: headerIconColor),
      );

  Widget _rightButton() => IconButton(
        onPressed: onRightButtonPressed,
        icon: rightButtonIcon ?? Icon(Icons.chevron_right, color: headerIconColor),
      );

  Widget _headerTouchable() => FlatButton(
        onPressed: onHeaderTitlePressed,
        child: Text(headerTitle, 
          semanticsLabel: headerTitle,
          style: getTextStyle,
        ),
      );

  @override
  Widget build(BuildContext context) => showHeader
      ? Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Container(
            margin: headerMargin,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 4.0,
                      offset: Offset(0, 4))
                ],
                borderRadius: BorderRadius.circular(10),
                color: headerColor),
            child: DefaultTextStyle(
                style: getTextStyle,
                child: Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        showHeaderButtons ? _leftButton() : Container(),
                        isTitleTouchable
                            ? _headerTouchable()
                            : Text(headerTitle, style: getTextStyle),
                        showHeaderButtons ? _rightButton() : Container(),
                      ]),
                )),
          ),
      )
      : Container();
}
