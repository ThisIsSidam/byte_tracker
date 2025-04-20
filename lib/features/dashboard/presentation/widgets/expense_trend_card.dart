import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../shared/widgets/riverpod_widgets/async_widget.dart';
import '../providers/dashboard_details_provider.dart';

class ExpenseTrendCard extends ConsumerWidget {
  const ExpenseTrendCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget<List<double>>(
      value: ref.watch(getWeeklySpendsProvider),
      error: (Object e, _) => Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(e.toString()),
        ),
      ),
      loading: _buildSkeleton,
      data: (List<double> spots) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Expense Trend',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  'Last 7 days',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 200,
                  child: LineChart(
                    LineChartData(
                      gridData: const FlGridData(show: false),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40,
                            getTitlesWidget: (double value, TitleMeta meta) {
                              return Text(
                                '₹${value.toInt()}',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                ),
                              );
                            },
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (double value, TitleMeta meta) {
                              const List<String> days = <String>[
                                'Mon',
                                'Tue',
                                'Wed',
                                'Thu',
                                'Fri',
                                'Sat',
                                'Sun',
                              ];
                              if (value.toInt() >= 0 &&
                                  value.toInt() < days.length) {
                                return Text(
                                  days[value.toInt()],
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                                );
                              }
                              return const Text('');
                            },
                          ),
                        ),
                        rightTitles: const AxisTitles(),
                        topTitles: const AxisTitles(),
                      ),
                      borderData: FlBorderData(show: false),
                      lineBarsData: <LineChartBarData>[
                        LineChartBarData(
                          spots: List<FlSpot>.generate(
                            spots.length,
                            (int index) =>
                                FlSpot(index.toDouble(), spots[index]),
                          ),
                          isCurved: true,
                          color: Colors.red.shade400,
                          barWidth: 3,
                          isStrokeCapRound: true,
                          dotData: const FlDotData(show: false),
                          belowBarData: BarAreaData(
                            show: true,
                            color: Colors.red.shade400.withAlpha(100),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSkeleton() {
    return const Skeletonizer(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('--'),
              Text('--'),
              SizedBox(height: 16),
              SizedBox(
                height: 200,
                child: Placeholder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
