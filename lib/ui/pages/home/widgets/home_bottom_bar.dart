import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tasks/ui/pages/home/weather_info_view_model.dart';

class HomeBottomBar extends ConsumerWidget {
  const HomeBottomBar({
    super.key,
    required this.dateFormat,
    required this.lastUpdated,
    required this.justUpdated,
  });

  final DateFormat dateFormat;
  final DateTime? lastUpdated;
  final bool justUpdated;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(weatherInfoViewModel);
    final formatted = lastUpdated == null
        ? '-'
        : dateFormat.format(lastUpdated!);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      height: 100,
      width: double.infinity,
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: weather != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: justUpdated
                      ? Row(
                          key: const ValueKey('updated'),
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(Icons.check_rounded, size: 16),
                            const SizedBox(width: 6),
                            Text(
                              '날씨 업데이트됨',
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          key: const ValueKey('info'),
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '업데이트 시간: $formatted',
                              style: const TextStyle(fontSize: 12),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              weather.isDay == 0
                                  ? Icons.nightlight_round
                                  : Icons.sunny,
                              size: 16,
                            ),
                          ],
                        ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('날씨: ${weather.weatherDescription}'),
                    const SizedBox(width: 12),
                    Text('온도: ${weather.temperature}°C'),
                    const SizedBox(width: 12),
                    Text('풍속: ${weather.windSpeed}m/s'),
                  ],
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
