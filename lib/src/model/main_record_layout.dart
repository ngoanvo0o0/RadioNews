import 'layout_components.dart';

class Appbar {
  Dimension appBarDimension;
  IconInfor logoIcon;
  ChangeStateButton themeButton;
  Appbar(
    this.appBarDimension,
    this.logoIcon,
    this.themeButton,
  );
}

class Header {
  String appName;
  ToggleButton followButton;
  Line line;
  Header(
    this.appName,
    this.followButton,
    this.line,
  );
}

class MainRecord {
  double mainRecordViewPort;
  IconInfor background;
  ToggleButton playButton;
  MainRecord(
    this.mainRecordViewPort,
    this.background,
    this.playButton,
  );
}

class Carousel {
  String mainRecord;
  String viewAll;
  Dimension cardDimension;
  String recordingName;
  String releaseDate;
  IconInfor background;
  ToggleButton playButton;
  Carousel(
    this.mainRecord,
    this.viewAll,
    this.cardDimension,
    this.recordingName,
    this.releaseDate,
    this.background,
    this.playButton,
  );
}

class FooterBar {
  Dimension footerBarDimension;
  ChangeStateButton playPauseButton;
  ToggleButton quitXButton;
  FooterBar(
    this.footerBarDimension,
    this.playPauseButton,
    this.quitXButton,
  );
}

class MainRecordLayout {
  Appbar appBar;
  Header header;
  MainRecord mainRecord;
  Carousel carousel;
  FooterBar footerBar;
  MainRecordLayout(
    this.appBar,
    this.header,
    this.mainRecord,
    this.carousel,
    this.footerBar,
  );
}
