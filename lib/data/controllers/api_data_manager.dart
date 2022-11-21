import 'package:exomind_test/data/api_module/api_response.dart';

class APIDataManager {
  late ApiResponse<Map> _apiResponse;
  ApiResponse<Map>? get apiResponse => _apiResponse;

  void loadCurrentUser() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
