import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_news/core/app_size.dart';
import 'package:radio_news/src/controller/radio_live_controller.dart';
import 'package:radio_news/src/view/widget/card_media_type_1.dart';
import 'package:radio_news/src/view/widget/custom_appbar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int currentPage = 1;
  static const int itemsPerPage = 10;

  @override
  Widget build(BuildContext context) {
    final RadioLiveController controller = Get.find<RadioLiveController>();

    final totalItems = controller.radioLiveData?.length ?? 0;
    final totalPages = (totalItems / itemsPerPage).ceil();
    final startIndex = (currentPage - 1) * itemsPerPage;
    final endIndex = (startIndex + itemsPerPage).clamp(0, totalItems);

    final paginatedItems =
        controller.radioLiveData?.sublist(startIndex, endIndex) ?? [];

    return Scaffold(
      endDrawer: const MyDrawer(),
      appBar: AppBar(
        toolbarHeight: AppBarDimension.toolBar,
        title: const CustomAppBar(),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: paginatedItems.length,
              itemBuilder: (context, index) {
                final item = paginatedItems[index];
                return CardMediaType1(
                  title: item['name'] ?? 'Unknown Title',
                  date: item['date'] ?? 'Unknown Date',
                  link: item['link'],
                );
              },
            ),
          ),
          if (totalPages > 1) _buildPagination(totalPages),
        ],
      ),
    );
  }

  Widget _buildPagination(int totalPages) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalPages, (index) {
          final pageNumber = index + 1;
          return InkWell(
            onTap: () {
              setState(() {
                currentPage = pageNumber;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: currentPage == pageNumber ? Colors.blue : Colors.grey,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                pageNumber.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        }),
      ),
    );
  }
}
