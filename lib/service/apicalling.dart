import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_app/models/driver_model.dart';

class Apicalling {
  static Future<List<DriverInfo>> getAllPendingDrivers() async {
    final url = Uri.parse('http://localhost:8080/pendingdrivers');
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

  static Future<List<DriverInfo>> getAllApprovedDrivers() async {
    final url = Uri.parse('http://localhost:8080/accepteddrivers');
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

  static Future<List<DriverInfo>> getAllRejectedDrivers() async {
    final url = Uri.parse('http://localhost:8080/rejecteddrivers');
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

  static Future approved(id, DriverInfo driver) async {
    final url = Uri.parse('http://localhost:8080/acceptdriver/$id');

    final body = {
      "status": 'Accepted',
      "user_name": driver.email,
      "passwod": driver.phoneNumber
    };
    final encodeBody = jsonEncode(body);
    final response = await http.put(url,
        body: encodeBody, headers: {'Content-Type': 'application/json'});
    return response;
  }

  static Future rejected(id, DriverInfo driver) async {
    final url = Uri.parse('http://localhost:8080/rejectdriver/$id');

    final body = {
      "status": 'Rejected',
    };
    final encodeBody = jsonEncode(body);
    final response = await http.put(url,
        body: encodeBody, headers: {'Content-Type': 'application/json'});
    return response;
  }
}
