import 'package:flutter/material.dart';

//***************************************************************************//
// This block is used to define information for player
//***************************************************************************//

class PlayerBG {
  const PlayerBG._();
  static const backgroundColor = Colors.black;
  static const bGPath = "assets/images/recordingBG.svg";
}

class PlayerBGDark {
  const PlayerBGDark._();
  static const backgroundColor = Color(0xFF999999);
}

//***************************************************************************//
// This block is used to define information for header
//***************************************************************************//

class AppbarStyle {
  static const appNameString = "SaigonNewsRadio";
  static const appNameStyle = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const iconColor = Colors.black;
  static const iconSize = 15.0;
  static const iconPath = "assets/images/userIcon.svg";
  static const followString = "Follow";
  static const followStyle = TextStyle(
    color: Colors.black,
    fontSize: 15.0,
    fontWeight: FontWeight.normal,
  );
}

class AppbarStyleDark {
  static const appNameStyle = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const iconColor = Colors.white;
  static const followStyle = TextStyle(
    color: Colors.white,
    fontSize: 15.0,
    fontWeight: FontWeight.normal,
  );
}

class BackButtonInfor {
  static const size = 40.0;
  static const iconPath = "assets/images/downArrow.svg";
  static const bgColor = Colors.black;
  static const iconColor = Colors.white;
}

class BackButtonDarkInfor {
  static const bgColor = Color(0xFF999999);
}

class RecPlayer {
  const RecPlayer._();
  static const size = 82.0;
  static const bgColor = Colors.black;
  static const playIconPath = "assets/images/play.svg";
  static const pauseIconPath = "assets/images/pause.svg";
  static const iconColor = Colors.white;
}

class RecPlayerDark {
  const RecPlayerDark._();
  static const bgColor = Color(0xFF999999);
}

class MoveBack {
  const MoveBack._();
  static const size = 44.0;
  static const iconPath = "assets/images/goBack.svg";
  static const bgColor = Colors.black;
  static const iconColor = Colors.white;
}

class MoveBackDark {
  const MoveBackDark._();
  static const bgColor = Color(0xFF999999);
}

class MoveForward {
  const MoveForward._();
  static const size = 44.0;
  static const iconPath = "assets/images/goForward.svg";
  static const bgColor = Colors.black;
  static const iconColor = Colors.white;
}

class MoveForwardDark {
  const MoveForwardDark._();
  static const bgColor = Color(0xFF999999);
}

class SliderInfor {
  const SliderInfor._();
  static const sliderSize = 250.0;
  static const activeColor = Colors.black;
  static const inactiveColor = Color(0xFF999999);
}

class SliderInforDark {
  const SliderInforDark._();
  static const activeColor = Colors.white;
}

class WaveFormInfor {
  const WaveFormInfor._();
  static const height = 100.0;
  static const oneSliderWidth = 4.0;
  static const sliderSpace = 2.0;
  static const sliderBorder = 2.0;
  static const sliderBlock = 8.0; // sliderBorder + oneSliderWidth + sliderSpace
  static const sliderColor = Colors.black;
}

class WaveFormInforDark {
  const WaveFormInforDark._();
  static const sliderColor = Color(0xFF999999);
}
