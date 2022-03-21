import 'package:food_delivery/logic/data/api/api_client.dart';
import 'package:food_delivery/utils/constants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(Constants.popularProductUri);
  }
}
