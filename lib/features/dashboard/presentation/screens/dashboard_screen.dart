import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/data/models/app_user_model.dart';
import '../../../../core/providers/app_user_provider.dart';
import '../../../../shared/widgets/riverpod_widgets/async_widget.dart';
import '../widgets/daily_expense_card.dart';
import '../widgets/expense_trend_card.dart';
import '../widgets/insights_card.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: AsyncValueWidget<AppUser?>(
          value: ref.watch(appUserProvider),
          data: (AppUser? user) {
            if (user == null) {
              return const Center(
                child: Text('No user data available'),
              );
            }
            return _buildBody(context, user);
          },
          error: (Object e, _) => Center(
            child: Text(e.toString()),
          ),
          loading: CircularProgressIndicator.new,
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, AppUser user) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Hi, ${user.firstName}! 👋',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
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
          const DailyExpenseCard(),
          const ExpenseTrendCard(),
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
        ],
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
