import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/data/models/app_user_model.dart';
import '../../../../core/providers/app_user_provider.dart';
import '../../../../shared/widgets/riverpod_widgets/async_widget.dart';
import '../../data/model/goal_model.dart';
import '../widgets/goal_card.dart';
import '../widgets/goal_form.dart';

class GoalsScreen extends HookConsumerWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Goals',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: <Widget>[
          OutlinedButton.icon(
            onPressed: () => showAddGoalSheet(context),
            icon: const Icon(Icons.add_circle_outline, size: 16),
            label: const Text('New Goal'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
      body: AsyncValueWidget<AppUser?>(
        value: ref.watch(appUserProvider),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (Object e, _) => Center(
          child: Text(
            e.toString(),
            style: const TextStyle(color: Colors.red),
          ),
        ),
        data: (AppUser? user) {
          if (user == null) {
            return const Center(
              child: Text('No user found'),
            );
          }
          return _buildBody(context, user.goals);
        },
      ),
    );
  }

  void showAddGoalSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) => const PopScope(
        canPop: false,
        child: GoalForm(),
      ),
    );
  }

  Widget _buildBody(BuildContext context, List<GoalModel> goals) {
    if (goals.isEmpty) {
      return _buildEmptyState(context);
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: goals.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: GoalCard(goal: goals[index]),
        );
      },
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.flag_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(height: 16),
          Text(
            'No Goals Yet',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Set your first goal and start tracking!',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => showAddGoalSheet(context),
            icon: const Icon(Icons.add, size: 18),
            label: const Text('Create Goal'),
          ),
        ],
      ),
    );
  }
}
