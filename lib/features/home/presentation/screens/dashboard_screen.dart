import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../widgets/insights_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Hi, Priya! 👋',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),

              // Income and Expense Cards
              Row(
                children: <Widget>[
                  Expanded(
                    child: _buildSummaryCard(
                      context,
                      title: 'Income',
                      amount: '₹15,200',
                      icon: Icons.arrow_upward,
                      iconColor: Colors.green,
                      backgroundColor: Colors.green.shade50,
                      borderColor: Colors.green.shade100,
                      textColor: Colors.green.shade700,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildSummaryCard(
                      context,
                      title: 'Expenses',
                      amount: '₹9,850',
                      icon: Icons.arrow_downward,
                      iconColor: Colors.red,
                      backgroundColor: Colors.red.shade50,
                      borderColor: Colors.red.shade100,
                      textColor: Colors.red.shade700,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Daily Spending Limit
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Daily Spending Limit',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Text(
                              '₹500/day',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Today's spending: ₹350",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey.shade600,
                            ),
                      ),
                      const SizedBox(height: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: 0.7,
                          backgroundColor: Colors.grey.shade200,
                          minHeight: 8,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '₹0',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          Text(
                            '₹500',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Expense Trend Chart
              Card(
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
                                  getTitlesWidget:
                                      (double value, TitleMeta meta) {
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
                                  getTitlesWidget:
                                      (double value, TitleMeta meta) {
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
                                spots: const <FlSpot>[
                                  FlSpot(0, 300),
                                  FlSpot(1, 450),
                                  FlSpot(2, 200),
                                  FlSpot(3, 650),
                                  FlSpot(4, 500),
                                  FlSpot(5, 350),
                                  FlSpot(6, 250),
                                ],
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
              ),

              const SizedBox(height: 16),

              // Smart Insights
              InsightCard(
                title: 'Smart Insight',
                description:
                    // ignore: lines_longer_than_80_chars
                    "You're spending more on food than usual this week. Consider cooking at home to save money.",
                icon: Icons.auto_awesome,
                backgroundColor: Colors.purple.shade50,
                borderColor: Colors.purple.shade100,
                iconColor: Colors.purple.shade600,
                titleColor: Colors.purple.shade800,
                descriptionColor: Colors.purple.shade700,
              ),

              const SizedBox(height: 16),

              InsightCard(
                title: 'Spending Trend',
                description:
                    // ignore: lines_longer_than_80_chars
                    'Your transport expenses have decreased by 15% compared to last month. Great job!',
                icon: Icons.trending_down,
                backgroundColor: Colors.blue.shade50,
                borderColor: Colors.blue.shade100,
                iconColor: Colors.blue.shade600,
                titleColor: Colors.blue.shade800,
                descriptionColor: Colors.blue.shade700,
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard(
    BuildContext context, {
    required String title,
    required String amount,
    required IconData icon,
    required Color iconColor,
    required Color backgroundColor,
    required Color borderColor,
    required Color textColor,
  }) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: borderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  icon,
                  size: 16,
                  color: iconColor,
                ),
                const SizedBox(width: 4),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              amount,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
