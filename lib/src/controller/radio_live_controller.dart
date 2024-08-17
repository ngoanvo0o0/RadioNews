import 'package:get/get.dart';
import 'package:radio_news/services/web_scraper_service.dart';

class RadioLiveController extends GetxController {
  var radioLiveData = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchRadioLiveData();
  }

  Future<void> fetchRadioLiveData() async {
    try {
      isLoading(true);
      radioLiveData.value = await WebScraperService().fetchAndConvertToJson();
    } finally {
      isLoading(false);
    }
  }
}
