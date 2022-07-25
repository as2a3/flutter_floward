import 'package:flutter_floward/app/provider/connection/network_utils.dart';
import 'package:flutter_floward/app/provider/rest_client/rest_client.dart';
import 'package:get/get.dart';

const String tag = '[ApiClient]';

class ApiClient extends GetxService {
  late RestClient apiClient;

  ApiClient();

  Future<ApiClient> init() async {
    apiClient = RestClient(
      createDio(),
      // baseUrl: getApiBaseUrl(''),
    );
    return this;
  }

}
