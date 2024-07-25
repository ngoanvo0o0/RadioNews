import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:radio_news/core/app_style.dart';
import 'package:radio_news/src/model/food.dart';
import 'package:radio_news/core/app_color.dart';
import 'package:radio_news/core/app_extension.dart';
import 'package:radio_news/src/controller/food_controller.dart';
import 'package:radio_news/src/view/screen/food_detail_screen.dart';
import 'package:radio_news/src/view/widget/custom_page_route.dart';

final FoodController controller = Get.put(FoodController());

class FoodListView extends StatelessWidget {
  const FoodListView({
    super.key,
    required this.foods,
    this.isReversedList = false,
  });

  final List<Food> foods;
  final bool isReversedList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 20, left: 10),
        scrollDirection: Axis.horizontal,
        itemCount: isReversedList ? 3 : foods.length,
        itemBuilder: (_, index) {
          Food food =
              isReversedList ? foods.reversed.toList()[index] : foods[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                CustomPageRoute(child: FoodDetailScreen(food: food)),
              );
            },
            child: Container(
              width: 160,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: controller.isLightTheme
                    ? Colors.white
                    : DarkThemeColor.primaryLight,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(food.image, scale: 6),
                    Text(
                      "\$${food.price}",
                      style: h3Style.copyWith(color: LightThemeColor.accent),
                    ),
                    Text(
                      food.name,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ).fadeAnimation(0.7),
              ),
            ),
          );
        },
        separatorBuilder: (_, __) {
          return const Padding(padding: EdgeInsets.only(right: 50));
        },
      ),
    );
  }
}
