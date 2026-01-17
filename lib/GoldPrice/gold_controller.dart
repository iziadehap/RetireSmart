import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_x/get.dart';
import 'package:http/http.dart' as http;
import 'package:retiresmart/GoldPrice/gold_response_model.dart';

class GoldController extends GetxController {
  var isLoading = false.obs;
  var goldPrice = Rxn<GoldPriceModel>();

  @override
  void onInit() {
    super.onInit();
    getGoldData();
  }

  Future<void> getGoldData() async {
    isLoading.value = true;
    String url = "https://www.goldapi.io/api/";
    String symbol = "XAU";
    String currencyCode = "EGP";
    // data must be like this 20260118.
    // String date = DateTime.now().toString().split(" ")[0].replaceAll("-", "");

    String apiKey = dotenv.env["GOLD_API_KEY"] ?? "";

    if (apiKey.isEmpty) {
      print("Error: GOLD_API_KEY not found");
      return;
    }
    try {
      var response = await http.get(
        Uri.parse("$url$symbol/$currencyCode"),
        headers: {"x-access-token": apiKey},
      );

      print("Response: ${response.body}");
      if (response.statusCode == 200) {
        goldPrice.value = GoldPriceModel.fromJson(jsonDecode(response.body));
      } else {
        print("Error fetching data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
