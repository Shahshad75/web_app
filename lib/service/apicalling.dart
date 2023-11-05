import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_app/models/driver_model.dart';

class Apicalling {
  static Future adminlogin(String username, String password) async {
    final url = Uri.parse('http://localhost:8080/admin/login');
    final body = {"username": username, "password": password};
    final response = await http.post(url,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }

  static Future<List<DriverInfo>?> getAllPendingDrivers() async {
    final url = Uri.parse('http://localhost:8080/admin/pendingdrivers');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final dynamic jsonResponse = jsonDecode(response.body);
        final List<dynamic>? data = jsonResponse['datas'];

        if (data != null) {
          List<DriverInfo> drivers =
              data.map((json) => DriverInfo.fromJson(json)).toList();
          return drivers;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  static Future<List<DriverInfo>?> getAllApprovedDrivers() async {
    final url = Uri.parse('http://localhost:8080/admin/accepteddrivers');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final dynamic jsonResponse = jsonDecode(response.body);
        final List<dynamic>? data = jsonResponse['datas'];

        if (data != null) {
          List<DriverInfo> drivers =
              data.map((json) => DriverInfo.fromJson(json)).toList();
          return drivers;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  static Future<List<DriverInfo>?> getAllRejectedDrivers() async {
    final url = Uri.parse('http://localhost:8080/admin/rejecteddrivers');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final dynamic jsonResponse = jsonDecode(response.body);
        final List<dynamic>? data = jsonResponse['datas'];

        if (data != null) {
          List<DriverInfo> drivers =
              data.map((json) => DriverInfo.fromJson(json)).toList();
          return drivers;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  static Future approved(id, DriverInfo driver) async {
    final url = Uri.parse('http://localhost:8080/admin/acceptdriver/$id');

    final body = {
      "status": "Accepted",
      "user_name": driver.email,
      "password": driver.phoneNumber,
    };

    try {
      final response = await http.patch(url,
          body: jsonEncode(body),
          headers: {'Content-Type': 'application/json'});

      return response;
    } catch (e) {
    }
  }

  static Future rejected(id, DriverInfo driver) async {
    final url = Uri.parse('http://localhost:8080/admin/rejectdriver/$id');

    final body = {
      "status": 'Rejected',
    };
    final encodeBody = jsonEncode(body);
    final response = await http.patch(url,
        body: encodeBody, headers: {'Content-Type': 'application/json'});
    print(response.body);
    return response;
  }
}
