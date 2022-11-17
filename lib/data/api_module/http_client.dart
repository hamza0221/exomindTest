import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:publicis_test/data/api_module/api_exception.dart';

class HttpClient {
  static final HttpClient _singleton = HttpClient();

  static HttpClient get instance => _singleton;

  final _APIBase = "";

  //Implementation des requette http en POST avec un header de type JSON
  Future<dynamic> postData(String url, dynamic body,
      {showLoading = true, String? token, String? userToken}) async {
    var responseJson;
    var header = (token == null && userToken == null)
        ? null
        : {
            "authentication": 'auth $token',
            HttpHeaders.authorizationHeader: "Bearer $userToken",
          };
    print(header);
    var uri = Uri.parse(_APIBase + url);
    print(uri);
    print(body);
    try {
      if (showLoading) EasyLoading.show(status: 'chargement...');
      final response = await http
          .post(uri, body: body, headers: header)
          .timeout(const Duration(seconds: 10));
      responseJson =
          _returnResponse(response, json.decode(response.body.toString()));
      print(">>>> responseJson <<<<<");
      print(responseJson);
    } on SocketException {
      print("Erreur");
      EasyLoading.showError('problème de connexion');
      throw FetchDataException('Pas de connexion internet');
    } on TimeoutException {
      print("Erreur");
      EasyLoading.showError('problème de connexion');
      throw FetchDataException('Pas de connexion internet');
    }
    return responseJson;
  }

  //Adapter des reponses selon le statut code
  dynamic _returnResponse(http.Response response, Map responseDecode) {
    print(">>> Return Reponse <<<");
    print(responseDecode.toString());
    switch (response.statusCode) {
      case 200:
        return responseDecode;
      case 201:
        return responseDecode;
      case 400:
        throw BadRequestException(responseDecode["message"]);
      case 401:
        throw BadRequestException(responseDecode["message"]);
      case 403:
        throw UnauthorisedException(responseDecode["message"]);
      case 422:
        throw BadRequestException(responseDecode["message"]);
      case 500:
      default:
        throw FetchDataException(
            'Erreur lors de la communication au server : ${response.statusCode}');
    }
  }
}
