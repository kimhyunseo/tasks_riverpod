// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:tasks/data/model/weather_model.dart';

class WeatherInfoRepository {
  final Dio _client = Dio(
    BaseOptions(
      // 설정안할 시 실패 응답 시 throw 던져서 에러남
      validateStatus: (status) => true,
    ),
  );

  Future<WeatherModel?> findWeather({
    required double lat,
    required double lng,
  }) async {
    try {
      final response = await _client.get(
        'https://api.open-meteo.com/v1/forecast',
        queryParameters: {
          'latitude': lat,
          'longitude': lng,
          'timezone': 'auto',
          'current': 'temperature_2m,is_day,wind_speed_10m,weather_code',
        },
      );
      // https://api.open-meteo.com/v1/forecast?latitude=37.5665&longitude=126.9780&current=temperature_2m,is_day,wind_speed_10m,weather_code&timezone=auto

      // {"latitude":37.55,
      //"longitude":127.0,
      //"generationtime_ms":0.06127357482910156,
      //"utc_offset_seconds":32400,
      //"timezone":"Asia/Seoul",
      //"timezone_abbreviation":"GMT+9",
      //"elevation":34.0,
      //"current_units":{"time":"iso8601",
      //"interval":"seconds",
      //"temperature_2m":"°C",
      //"is_day":"",
      //"wind_speed_10m":"km/h",
      //"weather_code":"wmo code"},
      //"current":{"time":"2026-01-10T22:30",
      //"interval":900,
      //"temperature_2m":-5.7,
      //"is_day":0,
      //"wind_speed_10m":12.4,
      //"weather_code":0}}

      if (response.statusCode == 200) {
        final json = response.data as Map<String, dynamic>;
        final currentJson = json['current'] as Map<String, dynamic>;

        return WeatherModel.fromJson(currentJson);
      }

      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
