import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@freezed
abstract class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    @JsonKey(name: 'temperature_2m') required num temperature,
    @JsonKey(name: 'wind_speed_10m') required num windSpeed,
    @JsonKey(name: 'weather_code', fromJson: _convertWeatherCode)
    required String weatherDescription,
    @JsonKey(name: 'is_day') required num isDay,
    @JsonKey(fromJson: _convertToDateTime) required DateTime time,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, Object?> json) =>
      _$WeatherModelFromJson(json);
}

DateTime _convertToDateTime(String timeString) {
  return DateTime.parse(timeString);
}

String _convertWeatherCode(num code) {
  final int c = code.toInt();
  if (c == 0) return '맑음';
  if ([1, 2, 3].contains(c)) return '부분 흐림 또는 구름 많음';
  if ([45, 48].contains(c)) return '안개';
  if ([51, 53, 55].contains(c)) return '이슬비';
  if ([56, 57].contains(c)) return '언 이슬비';
  if ([61, 63, 65].contains(c)) return '비';
  if ([66, 67].contains(c)) return '언 비';
  if ([71, 73, 75].contains(c)) return '눈';
  if (c == 77) return '눈송이';
  if ([80, 81, 82].contains(c)) return '소나기';
  if ([85, 86].contains(c)) return '눈 소나기';
  if (c == 95) return '천둥 번개';
  if ([96, 99].contains(c)) return '번개와 우박';
  return '알 수 없음';
}
