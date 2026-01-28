import 'dart:async';
import 'package:get_x/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:retiresmart/GoldPrice/data/models/gold_price_failure_model.dart';
import 'package:retiresmart/GoldPrice/domain/usecases/get_gold_data.dart';
import 'package:retiresmart/GoldPrice/data/models/gold_price_model.dart';

class GoldController extends GetxController {
  final GetGoldData getGoldDataUseCase;
  GoldController({required this.getGoldDataUseCase});

  var isLoading = false.obs;
  var goldPrice = Rxn<GoldPriceModel>();
  var isFromCash = false.obs;
  Rxn<FailureType> isFailed = Rxn<FailureType>();

  var isOffline = false.obs;
  var isBackOnline = false.obs;
  StreamSubscription? _networkSubscription;

  @override
  void onInit() {
    super.onInit();
    _initNetworkListener();
    getGoldData();
  }

  @override
  void onClose() {
    _networkSubscription?.cancel();
    super.onClose();
  }

  void _initNetworkListener() {
    _networkSubscription = InternetConnection().onStatusChange.listen((status) {
      if (status == InternetStatus.connected) {
        if (isOffline.value) {
          _handleBackOnline();
        }
        isOffline.value = false;
      } else {
        isOffline.value = true;
      }
    });
  }

  Future<void> _handleBackOnline() async {
    isBackOnline.value = true;
    await Future.delayed(const Duration(seconds: 1));
    getGoldData();
    isBackOnline.value = false;
  }

  Future<void> getGoldData() async {
    isLoading.value = true;

    final eitherModel = await getGoldDataUseCase.call();

    // Use fold to handle both cases safely
    eitherModel.fold(
      (failure) {
        // Logic for the 'Left' side (Failure)

        isFailed.value = failure.failureType;
        goldPrice.value = null;
      },
      (model) {
        // Logic for the 'Right' side (Success)
        // Access your model variable here
        isFromCash.value = model.isFromCash;
        isFailed.value = null;
        goldPrice.value = model;
      },
    );

    isLoading.value = false;
  }
}
