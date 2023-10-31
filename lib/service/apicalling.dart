import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:web_app/models/driver_model.dart';

class Apicalling {
  static Future<List<DriverInfo>> getAllDrivers() async {
    final url = Uri.parse('http://localhost:8080/getpending');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['datas'];

        List<DriverInfo> drivers =
            data.map((json) => DriverInfo.fromJson(json)).toList();
        return drivers;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
