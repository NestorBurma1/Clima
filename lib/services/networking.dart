import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future<dynamic> getData() async {
    final http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final String data = response.body;
      final dynamic decodeData = jsonDecode(data);
      return decodeData;
    } else

      print(response.statusCode);
  }
}
