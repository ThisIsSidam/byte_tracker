import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../goals/presentation/screens/goals_screen.dart';
import '../../../transactions/presentation/screens/transactions_screen.dart';
import 'dashboard_screen.dart';

@immutable
class AppDashboard extends HookConsumerWidget {
  const AppDashboard({this.firstScreen = 0, super.key});

  /// Opens the dashboard with the screen of the index.
  /// Defaults to 0, opening the DashboardScreen.
  final int firstScreen;

  Widget _currentScreen(int index) {
    switch (index) {
      case 0:
        return const DashboardScreen();
      case 1:
        return const TransactionsScreen();
      case 2:
        return const GoalsScreen();
      case 3:
        // TODO: Replace with ReportsScreen
        return const DashboardScreen();
      default:
        return const DashboardScreen();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<int> currentScreen = useState<int>(firstScreen);

    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: _currentScreen(currentScreen.value),
      ),
      bottomNavigationBar: _buildNavBar(context, currentScreen),
    );
  }

  /// Build the bottom navigation bar
  BottomNavigationBar _buildNavBar(
    BuildContext context,
    ValueNotifier<int> currentScreen,
  ) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return BottomNavigationBar(
      selectedItemColor: colorScheme.primary,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          activeIcon: Icon(Icons.dashboard),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long),
          activeIcon: Icon(Icons.receipt_long),
          label: 'Transactions',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.flag),
          activeIcon: Icon(Icons.flag),
          label: 'Goals',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          activeIcon: Icon(Icons.bar_chart),
          label: 'Reports',
        ),
      ],
      currentIndex: currentScreen.value,
      onTap: (int selected) => currentScreen.value = selected,
    );
  }
}
