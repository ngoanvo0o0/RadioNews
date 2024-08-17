import 'package:flutter/material.dart' hide Badge;
import 'package:radio_news/src/model/virtual_main_screen.dart';
import 'package:radio_news/core/app_asset.dart';

VirtualAppBar myAppBar = VirtualAppBar(
  80.0,
  AppAsset.radioNewsLogo,
  64.0,
  24.0,
  44.0,
  AppAsset.sun,
  Colors.white,
  AppAsset.moon,
  Colors.white,
  Colors.white,
  const Color(0xFFcdac00),
  const Color(0xFF999999),
  12.0,
);

VirtualHeader header = VirtualHeader(
  2.0,
  const Color(0xFFE1E1E1),
  "SaigonNewsRadio",
  22.0,
  94.0,
  AppAsset.user,
  Colors.white,
  10.0,
  'Follow',
  Colors.black,
);

VirtualMainRecord mainRecord = VirtualMainRecord(
  0.4,
  AppAsset.recordingBG,
  Colors.black,
  44.0,
  Colors.black,
  AppAsset.play,
  Colors.white,
);

// Create a VirtualMainScreen instance
VirtualMainScreen mainScreen = VirtualMainScreen(myAppBar, header, mainRecord);
