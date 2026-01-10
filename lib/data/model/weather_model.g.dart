// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) =>
    _WeatherModel(
      temperature: json['temperature_2m'] as num,
      windSpeed: json['wind_speed_10m'] as num,
      weatherDescription: _convertWeatherCode(json['weather_code'] as num),
      isDay: json['is_day'] as num,
      time: _convertToDateTime(json['time'] as String),
    );

Map<String, dynamic> _$WeatherModelToJson(_WeatherModel instance) =>
    <String, dynamic>{
      'temperature_2m': instance.temperature,
      'wind_speed_10m': instance.windSpeed,
      'weather_code': instance.weatherDescription,
      'is_day': instance.isDay,
      'time': instance.time.toIso8601String(),
    };
