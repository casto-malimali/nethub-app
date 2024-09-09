import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String authCode = '2288';
  final String baseUrl = 'https://nethub.co.tz/demo/api/v2';

  Future<String> authenticateUser() async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/user'),
      headers: {'Authorization': 'Code $authCode'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(
          response.body)['token']; // Adjust according to the actual response
    } else {
      throw Exception('Failed to authenticate');
    }
  }

  Future<void> saveData(String item, int number) async {
    final response = await http.post(
      Uri.parse('$baseUrl/chickenHouse'),
      headers: {
        'Authorization': 'Code $authCode',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'Item': item,
        'Number': number,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to save data');
    }
  }

  Future<Map<String, dynamic>> getTodaySavingData() async {
    final response = await http.get(
      Uri.parse('$baseUrl/chicken/House/today'),
      headers: {'Authorization': 'Code $authCode'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get today saving data');
    }
  }

  Future<Map<String, dynamic>> getSavingDataByDate(String date) async {
    final response = await http.post(
      Uri.parse('$baseUrl/ChickenHouseDataDate'),
      headers: {
        'Authorization': 'Code $authCode',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'date': date}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get saving data by date');
    }
  }
}
