import 'package:flutter/material.dart' hide Badge;
import 'package:radio_news/src/model/main_record_layout.dart';
import 'package:radio_news/src/model/layout_components.dart';
import 'package:radio_news/core/app_asset.dart';

List<MainRecordLayout> mainRecordLayout = [
  // For the screen size <>
  MainRecordLayout(
    Appbar(
      Dimension(
        80.0,
        80.0,
      ),
      IconInfor(
        AppAsset.radioNewsLogo,
        Dimension(
          64.0,
          64.0,
        ),
        Colors.transparent,
      ),
      ChangeStateButton(
        Dimension(
          24.0,
          44.0,
        ),
        ToggleButton(
          Dimension(12.0, 12.0),
          IconInfor(
            AppAsset.moon,
            Dimension(12.0, 12.0),
            Colors.white,
          ),
        ),
        ToggleButton(
          Dimension(10.0, 10.0),
          IconInfor(
            AppAsset.sun,
            Dimension(10.0, 10.0),
            Colors.white,
          ),
        ),
      ),
    ),
    Header(
      "SaigonNewsRadio",
      ToggleButton(
        Dimension(22.0, 94.0),
        IconInfor(
          AppAsset.user,
          Dimension(12.0, 12.0),
          Colors.white,
        ),
      ),
      Line(Dimension(2.0, 2.0), const Color(0xFFE1E1E1)),
    ),
    MainRecord(
      0.4,
      IconInfor(
        AppAsset.recordingBG,
        Dimension(
          0.0,
          0.0,
        ),
        Colors.black,
      ),
      ToggleButton(
        Dimension(
          44.0,
          44.0,
        ),
        IconInfor(
          AppAsset.play,
          Dimension(
            22.0,
            22.0,
          ),
          Colors.black,
        ),
      ),
    ),
    Carousel(
      "Latest recording",
      "View all",
      Dimension(
        200,
        300,
      ),
      "updated by API", //this one should be updated via API
      "updated by API",
      IconInfor(
        AppAsset.recordingBG,
        Dimension(
          0.0,
          0.0,
        ),
        Colors.black,
      ),
      ToggleButton(
        Dimension(
          44.0,
          44.0,
        ),
        IconInfor(
          AppAsset.play,
          Dimension(
            22.0,
            22.0,
          ),
          Colors.black,
        ),
      ),
    ),
    FooterBar(
      Dimension(
        60.0,
        800.0,
      ),
      ChangeStateButton(
        Dimension(
          50.0,
          50.0,
        ),
        ToggleButton(
          Dimension(25.0, 25.0),
          IconInfor(
            AppAsset.play,
            Dimension(25.0, 25.0),
            Colors.black,
          ),
        ),
        ToggleButton(
          Dimension(25.0, 25.0),
          IconInfor(
            AppAsset.pause,
            Dimension(25.0, 25.0),
            Colors.black,
          ),
        ),
      ),
      ToggleButton(
        Dimension(
          50.0,
          50.0,
        ),
        IconInfor(
          AppAsset.quitX,
          Dimension(
            25.0,
            25.0,
          ),
          Colors.black,
        ),
      ),
    ),
  ),
];

class AppReference {
  AppReference._();
  static MainRecordLayout mainRecordPage = mainRecordLayout[0];
}
