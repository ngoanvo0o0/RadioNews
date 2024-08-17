import 'package:flutter/material.dart' hide Badge;

class PlayingScreen {
  // Member variable
  final Color _iconcolor;

  // Constructor to initialize the 'name' member variable
  PlayingScreen(this._iconcolor);

  // Getter to access the 'name' member variable
  Color get iconColor => _iconcolor;
}

PlayingScreen test = PlayingScreen(Colors.red);
