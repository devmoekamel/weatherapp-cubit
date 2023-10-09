import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';

  String apiKey = 'd64f2036966d4c9b83451456230502';
  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
    http.Response response = await http.get(url);

    if (response.statusCode == 400) {
    var data  = jsonDecode(response.body);
      throw Exception(data['error']['message']);
    }
    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromJson(data);

    return weather;
  }
}
