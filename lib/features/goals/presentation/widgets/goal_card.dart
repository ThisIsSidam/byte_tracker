import 'package:flutter/material.dart';

import '../../../../core/extensions/date_ext.dart';
import '../../../../core/extensions/num_ext.dart';
import '../../data/model/goal_model.dart';

class GoalCard extends StatelessWidget {
  const GoalCard({
    required this.goal,
    super.key,
  });
  final GoalModel goal;

  @override
  Widget build(BuildContext context) {
    final double progress = goal.currentlySaved / goal.amount;
    final bool isCompleted = goal.currentlySaved >= goal.amount;

    return Card(
      shape: isCompleted
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.green.shade200),
            )
          : null,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  goal.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                if (isCompleted)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      'Completed!',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.green.shade800,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: <Widget>[
                Icon(
                  Icons.calendar_today,
                  size: 12,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: 4),
                Text(
                  goal.remainderAt.friendly,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey.shade200,
                color: isCompleted ? Colors.green : null,
                minHeight: 8,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '₹${goal.amount.toCurrency()} saved',
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  '₹${goal.amount} goal',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text(isCompleted ? 'Withdraw Funds' : 'Add Money'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
