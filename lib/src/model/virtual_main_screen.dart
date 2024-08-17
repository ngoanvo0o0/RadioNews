import 'package:flutter/material.dart';

class VirtualMainScreen {
  final VirtualAppBar virtualAppBar;
  final VirtualHeader virtualHeader;
  final VirtualMainRecord virtualMainRecord;

  VirtualMainScreen(
      this.virtualAppBar, this.virtualHeader, this.virtualMainRecord);
}

class VirtualAppBar {
  // Definition for appbar size
  final double _appbarSize;

  // Definition for app icon
  final String _iconPath;
  final double _iconSize;

  // Definition for theme button
  final double _themeHeight;
  final double _themeWidth;
  final String _sunpath;
  final Color _sunColor;
  final String _moonpath;
  final Color _moonColor;
  final Color _pointerColor;
  final Color _lightColor;
  final Color _darkColor;
  final double _themeIconSize;

  VirtualAppBar(
    this._appbarSize,
    this._iconPath,
    this._iconSize,
    this._themeHeight,
    this._themeWidth,
    this._sunpath,
    this._sunColor,
    this._moonpath,
    this._moonColor,
    this._pointerColor,
    this._lightColor,
    this._darkColor,
    this._themeIconSize,
  );

  // Getters
  double getAppbarSize() => _appbarSize;
  String getIconPath() => _iconPath;
  double getIconSize() => _iconSize;
  double getThemeButtonHeight() => _themeHeight;
  double getThemeButtonWidth() => _themeWidth;
  String getSunpath() => _sunpath;
  Color getSunColor() => _sunColor;
  String getMoonpath() => _moonpath;
  Color getMoonColor() => _moonColor;
  Color getPointerColor() => _pointerColor;
  Color getLightColor() => _lightColor;
  Color getDarkColor() => _darkColor;
  double getThemeIconSize() => _themeIconSize;
}

class VirtualHeader {
  // Definition for seperate line
  final double _lineSize;
  final Color _lineColor;

  // Definition for app icon
  final String _appName;

  // Definition for follow button
  final double _followBtHeight;
  final double _followBtWidth;
  final String _followIconPath;
  final Color _followIconColor;
  final double _iconSize;
  final String _followString;
  final Color _followBGColor;

  VirtualHeader(
    this._lineSize,
    this._lineColor,
    this._appName,
    this._followBtHeight,
    this._followBtWidth,
    this._followIconPath,
    this._followIconColor,
    this._iconSize,
    this._followString,
    this._followBGColor,
  );

  // Getters
  double getLineSize() => _lineSize;
  Color getLineColor() => _lineColor;
  String getAppName() => _appName;
  double getIconSize() => _iconSize;
  double getFollowButtonHeight() => _followBtHeight;
  double getFollowButtonWidth() => _followBtWidth;
  String getFollowIconPath() => _followIconPath;
  String getFollowString() => _followString;
  Color getFollowBGColor() => _followBGColor;
  Color getFollowIconColor() => _followIconColor;
}

class VirtualMainRecord {
  final double
      _viewport; // the percent base of the screen size for this element.
  final String _backgroundPath;
  final Color _backgroundfilter;

  // Definition for the play button in the middle.
  final double _buttonDimension;
  final Color _buttontColor;
  final String _playIconPath;
  final Color _playIconColor;

  VirtualMainRecord(
    this._viewport,
    this._backgroundPath,
    this._backgroundfilter,
    this._buttonDimension,
    this._buttontColor,
    this._playIconPath,
    this._playIconColor,
  );

  // Getters
  double getViewPort() => _viewport;
  String getBackgroundPath() => _backgroundPath;
  Color getBackgroundFilter() => _backgroundfilter;
  double getPlayButtonDimention() => _buttonDimension;
  Color getPlayButtonBGColor() => _buttontColor;
  String getPlayIconPath() => _playIconPath;
  Color getPlayIconColor() => _playIconColor;
}

// class VirtualCarousel {
//   final String _carouseHeaderR;
//   final TextStyle _crslHeaaderRStyle;
//   final String _carouseHeaderL;
//   final TextStyle _crslHeaaderLStyle;

//   // Definition for the play button in the middle.
//   final double _buttonDimension;
//   final Color _buttontColor;
//   final String _playIconPath;
//   final Color _playIconColor;

//   VirtualCarousel(
//     this._viewport,
//     this._backgroundPath,
//     this._backgroundfilter,
//     this._buttonDimension,
//     this._buttontColor,
//     this._playIconPath,
//     this._playIconColor,
//   );

//   // Getters
//   double getViewPort() => _viewport;
//   String getBackgroundPath() => _backgroundPath;
//   Color getBackgroundFilter() => _backgroundfilter;
//   double getPlayButtonDimention() => _buttonDimension;
//   Color getPlayButtonBGColor() => _buttontColor;
//   String getPlayIconPath() => _playIconPath;
//   Color getPlayIconColor() => _playIconColor;
// }
