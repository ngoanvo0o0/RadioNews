import 'package:flutter/material.dart';

class Dimension {
  double height;
  double width;
  Dimension(
    this.height,
    this.width,
  );
}

class Line {
  Dimension lineDimension;
  Color lineColor;
  Line(
    this.lineDimension,
    this.lineColor,
  );
}

class IconInfor {
  String iconPath;
  Dimension iconDimension;
  Color iconColor;
  IconInfor(
    this.iconPath,
    this.iconDimension,
    this.iconColor,
  );
}

class ToggleButton {
  Dimension buttonDimension;
  IconInfor buttonIcon;
  ToggleButton(
    this.buttonDimension,
    this.buttonIcon,
  );
}

class ChangeStateButton {
  Dimension buttonDimension;
  ToggleButton normal;
  ToggleButton changed;
  ChangeStateButton(
    this.buttonDimension,
    this.normal,
    this.changed,
  );
}
