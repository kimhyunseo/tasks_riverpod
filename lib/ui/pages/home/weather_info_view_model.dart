import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/data/model/weather_model.dart';
import 'package:tasks/data/repository/weather_info_repository.dart';

class WeatherInfoViewModel extends Notifier<WeatherModel?> {
  @override
  WeatherModel? build() {
    return null;
  }

  final weatherInfoRepository = WeatherInfoRepository();

  void getWeatherInfo(double lat, double lng) async {
    final result = await weatherInfoRepository.findWeather(lat: lat, lng: lng);
    state = result;
  }
}

final weatherInfoViewModel =
    NotifierProvider.autoDispose<WeatherInfoViewModel, WeatherModel?>(() {
      return WeatherInfoViewModel();
    });
