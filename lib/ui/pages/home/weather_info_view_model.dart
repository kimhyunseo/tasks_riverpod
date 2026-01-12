// ignore_for_file: avoid_print

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/data/core/geolocator_helper.dart';
import 'package:tasks/data/model/weather_model.dart';
import 'package:tasks/data/repository/weather_info_repository.dart';

class WeatherInfoViewModel extends Notifier<WeatherModel?> {
  @override
  WeatherModel? build() {
    return null;
  }

  final weatherInfoRepository = WeatherInfoRepository();

  // 날씨 위치 정보 가져오기
  Future<void> updateWeather() async {
    try {
      final position = await GeolocatorHelper.getPosition();

      if (position != null) {
        final result = await weatherInfoRepository.findWeather(
          lat: position.latitude,
          lng: position.longitude,
        );
        state = result;
      }
    } catch (e) {
      print('날씨 정보 갱신 실패: $e');
    }
  }
}

final weatherInfoViewModel =
    NotifierProvider.autoDispose<WeatherInfoViewModel, WeatherModel?>(() {
      return WeatherInfoViewModel();
    });
