import 'package:get/get.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:radio_news/core/app_asset.dart';
import 'package:radio_news/core/app_size.dart';
import 'package:radio_news/core/app_types.dart';
import 'package:radio_news/main.dart';
import 'package:radio_news/src/controller/system_controller.dart';
import 'package:radio_news/src/view/widget/custom_button.dart';
import 'package:radio_news/src/view/widget/custom_appbar.dart';
import 'package:radio_news/src/controller/player_controller.dart';

class RecordingdScreen extends StatelessWidget {
  const RecordingdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 400,
            child: AudioWaveForm(),
          ),

          //AudioWaveForm(),
          //AudioWaveForm(),
        ],
      ),
    );
  }
}

class AudioWaveForm extends StatefulWidget {
  @override
  State<AudioWaveForm> createState() => _AudioWaveForm();
}

class _AudioWaveForm extends State<AudioWaveForm> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int rectangleNum = (size.width / 8).toInt() - 1;
    List<double> rectangleHeights = generateRandomHeights(rectangleNum);
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: rectangleHeights.map((height) {
            return Container(
              height: height,
              width: 4,
              color: Colors.black,
              margin: EdgeInsets.all(2.0),
            );
          }).toList(),
        ),
      ),
      //floatingActionButton: FloatingActionButton(
      //  onPressed: () {
      //    // Cập nhật mảng chiều cao của các hình chữ nhật với giá trị ngẫu nhiên
      //    setState(() {
      //      rectangleHeights = generateRandomHeights(rectangleNum);
      //    });
      //  },
      //  child: Icon(Icons.update),
      //),
    );
  }

  List<double> generateRandomHeights(rectangleNum) {
    Random random = Random();
    List<double> heights = [];
    for (int i = 0; i < rectangleNum; i++) {
      double randomHeight =
          1 + random.nextDouble() * (100 - 1); // Giới hạn giá trị từ 1 đến 20
      heights.add(randomHeight);
    }
    return heights;
  }
}
