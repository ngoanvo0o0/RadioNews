import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:radio_news/core/app_about_data.dart';
import 'package:radio_news/core/app_recording_data.dart';
import 'package:radio_news/core/app_event_data.dart';
import 'package:radio_news/core/app_theme.dart';
import 'package:radio_news/core/app_types.dart';
import 'package:radio_news/src/model/recording.dart';
import 'package:radio_news/src/model/event.dart';
import 'package:radio_news/src/model/about.dart';

class SystemController extends GetxController {
  RxList<int> screenIndex = <int>[].obs;

  RxList<Recording> recordingList = <Recording>[].obs;
  Rx<Recording> latestRecord =
      Recording("", "", "", "", 0, "2023-01-01T02:10:55.184Z", "").obs;

  RxList<Event> eventList = AppEventData.eventChannel.obs;
  Rx<Event> latestEvent = Event("", "", "", DateTime(2023, 1, 1), "").obs;

  Rx<About> latestInfor = About("", 0, 0, "", "").obs;

  RxInt followers = AppAboutData.aboutApp.last.followers.obs;

  RxInt recordingIndex = 0.obs;

  Rx<ThemeData> theme = AppTheme.lightTheme.obs;

  RxBool isFooterBarVisible = false.obs;

  bool isLightTheme = true;

  bool isJSONUpdated = true;

//****************************************************************//
// Determine screen index, home/play/event/recording/about
// comes with enum ScreenIndex //
//****************************************************************//
  void switchScreenIndex(int currentIndex) {
    const int maxUndoScreen = 5;
    const int firstElementIndex = 0;
    if (screenIndex.isEmpty) {
      screenIndex.add(currentIndex);
      return;
    }

    if (screenIndex.last == currentIndex) {
      return;
    }

    if (screenIndex.length >= maxUndoScreen) {
      screenIndex.removeAt(firstElementIndex);
    }
    screenIndex.add(currentIndex);
  }

//****************************************************************//
// Return screen index, home/play/event/recording/about
// comes with enum ScreenIndex //
//****************************************************************//
  int getScreenIndex() {
    if (screenIndex.isEmpty) {
      return ScreenIndex.home.index;
    }
    return screenIndex.last;
  }

//****************************************************************//
// We have recordings and should be display in a
// scrollable row, because performance we just display
// maximum 10 items, the rest we can find out in recording screen
//****************************************************************//
  int calculateSliderItems() {
    fetchRecordingList();
    const int maxItems = 10;
    const int minItems = 0;

    if (recordingList.toList().isEmpty) {
      return minItems;
    }

    if (recordingList.toList().length > maxItems) {
      return maxItems;
    }

    return recordingList.toList().length;
  }

//****************************************************************//
// Before we get the latest recording, refesh data which is
// converted from JSON, the latest data should be used.
//****************************************************************//
  Recording getAppLatestRecording() {
    fetchRecordingList();
    if (recordingList.toList().isNotEmpty) {
      latestRecord.value = recordingList.toList().first;
    }
    return latestRecord.value;
  }

//****************************************************************//
// Before we get the recording list, refesh data which is
// converted from JSON, the latest data should be used.
//****************************************************************//
  List<Recording> getAppRecordingList() {
    fetchRecordingList();
    return recordingList.toList();
  }

//****************************************************************//
// Get index to read recording from recording list
//****************************************************************//
  int getRecordingIndex() {
    return recordingIndex.value;
  }

//****************************************************************//
// Set index to read recording from recording list
//****************************************************************//
  void setRecordingIndex(index) {
    recordingIndex.value = index;
  }

//****************************************************************//
// Before we calculate the slider items, refesh data which is
// converted from JSON, the latest data should be used.
//****************************************************************//
  void fetchRecordingList() {
    if (AppRecordingData.recordItems.isEmpty) {
      return;
    }
    // one more condition, we do it at the first time and json update
    recordingList.assignAll(AppRecordingData.recordItems);
  }

//****************************************************************//
// About screen needs need to use some information from JSON
//****************************************************************//
  About getAppInformation() {
    fetchAppInformation();
    return latestInfor.value;
  }

//****************************************************************//
// Before we get information, refesh data which is
// converted from JSON, the latest data should be used.
//****************************************************************//
  void fetchAppInformation() {
    if (AppAboutData.aboutApp.isEmpty || !isFetchDataNeeded()) {
      return;
    }
    latestInfor.value = AppAboutData.aboutApp.first;
  }

//****************************************************************//
// Before we get information, refesh data which is
// converted from JSON, the latest data should be used.
//****************************************************************//
  bool isFetchDataNeeded() {
    if (!isJSONUpdated) {
      return false;
    }
    isJSONUpdated = false;
    return true;
  }

//****************************************************************//
// This function use to check if FooterBar is needed
//****************************************************************//
  bool isFooterBarNeeded() {
    return isFooterBarVisible.value;
  }

//****************************************************************//
// This function use to set to turn on FooterBar
//****************************************************************//
  void setFooterBarRequest(bool isVisible) {
    isFooterBarVisible.value = isVisible;
  }

//****************************************************************//
// Dark mode or Light mode?
//****************************************************************//
  void changeTheme() {
    if (theme.value == AppTheme.darkTheme) {
      theme.value = AppTheme.lightTheme;
      isLightTheme = true;
    } else {
      theme.value = AppTheme.darkTheme;
      isLightTheme = false;
    }
  }
  //// base on api, we will implement the way to get JSON.
}
