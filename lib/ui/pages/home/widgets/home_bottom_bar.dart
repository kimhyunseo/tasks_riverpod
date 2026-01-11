import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tasks/ui/pages/home/weather_info_view_model.dart';

class HomeBottomBar extends ConsumerWidget {
  const HomeBottomBar({
    super.key,
    required this.dateFormat,
    required this.themeMode,
    required this.onReload,
    required this.lastUpdated,
  });

  final DateFormat dateFormat;
  final ThemeMode themeMode;
  final VoidCallback onReload;
  final DateTime? lastUpdated;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(weatherInfoViewModel);
    final isLight = themeMode == ThemeMode.light;
    final formatted = lastUpdated == null
        ? '-'
        : dateFormat.format(lastUpdated!);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      width: double.infinity,
      height: 100,
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: weather != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("업데이트 시간: $formatted"),
                    SizedBox(width: 8),
                    Icon(
                      weather.isDay == 0 ? Icons.nightlight_round : Icons.sunny,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("날씨: ${weather.weatherDescription}"),
                    SizedBox(width: 12),
                    Text("온도: ${weather.temperature}°C"),
                    SizedBox(width: 12),
                    Text("풍속: ${weather.windSpeed}m/s"),
                  ],
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
