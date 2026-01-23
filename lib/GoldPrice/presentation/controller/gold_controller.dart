import 'package:get_x/get.dart';
import 'package:retiresmart/GoldPrice/domain/models/gold_price_model.dart';
import 'package:retiresmart/GoldPrice/domain/repo/gold_repo.dart';

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
    goldPrice.value = await Get.find<GoldRepo>().getGoldPrices();
    isLoading.value = false;
    //   isLoading.value = true;
    //   String url = "https://www.goldapi.io/api/";
    //   String symbol = "XAU";
    //   String currencyCode = "EGP";
    //   // data must be like this 20260118.
    //   // String date = DateTime.now().toString().split(" ")[0].replaceAll("-", "");

    //   String apiKey = dotenv.env["GOLD_API_KEY"] ?? "";

    //   if (apiKey.isEmpty) {
    //     print("Error: GOLD_API_KEY not found");
    //     return;
    //   }
    //   try {
    //     var response = await http.get(
    //       Uri.parse("$url$symbol/$currencyCode"),
    //       headers: {"x-access-token": apiKey},
    //     );

    //     print("Response: ${response.body}");
    //     if (response.statusCode == 200) {
    //       goldPrice.value = GoldPriceModel.fromJson(jsonDecode(response.body));
    //     } else {
    //       print("Error fetching data: ${response.statusCode}");
    //     }
    //   } catch (e) {
    //     print("Error: $e");
    //   } finally {
    //     isLoading.value = false;
    //   }
    // }
  }
}
