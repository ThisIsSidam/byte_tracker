import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../shared/widgets/riverpod_widgets/async_widget.dart';
import '../../data/models/transaction_model.dart';
import '../providers/transactions_provider.dart';
import '../widgets/transaction_card.dart';

class TransactionsScreen extends HookConsumerWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TabController tabController = useTabController(initialLength: 3);
    final ValueNotifier<String> searchQuery = useState('');

    List<ITransactionModel> filterTransactions(
      List<ITransactionModel> transactions,
    ) {
      return transactions.where((ITransactionModel t) {
        final String query = searchQuery.value.toLowerCase();
        return t.title.toLowerCase().contains(query) ||
            (t.notes?.toLowerCase().contains(query) ?? false) ||
            t.category.toLowerCase().contains(query);
      }).toList();
    }

    List<ITransactionModel> getByCategory(
      List<ITransactionModel> list,
      String category,
    ) {
      final List<ITransactionModel> filtered = filterTransactions(list);
      if (category == 'All') return filtered;
      if (category == 'Credit') {
        return filtered.whereType<CreditModel>().toList();
      }
      return filtered.whereType<DebitModel>().toList();
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: TextField(
          onChanged: (String value) => searchQuery.value = value,
          decoration: InputDecoration(
            hintText: 'Search transactions...',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            contentPadding: EdgeInsets.zero,
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        bottom: TabBar(
          controller: tabController,
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Theme.of(context).primaryColor,
          tabs: const <Widget>[
            Tab(text: 'All'),
            Tab(text: 'Credit'),
            Tab(text: 'Debit'),
          ],
        ),
      ),
      body: AsyncValueWidget<List<ITransactionModel>>(
        value: ref.watch(getAllTransactionsProvider),
        error: (Object e, _) => Center(
          child: Text(
            e.toString(),
            style: const TextStyle(color: Colors.red),
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        data: (List<ITransactionModel> transactions) => TabBarView(
          controller: tabController,
          children: <Widget>[
            _buildTransactionList(getByCategory(transactions, 'All')),
            _buildTransactionList(getByCategory(transactions, 'Credit')),
            _buildTransactionList(getByCategory(transactions, 'Debit')),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionList(List<ITransactionModel> transactions) {
    if (transactions.isEmpty) {
      return _buildEmptyTransactions();
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: transactions.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: TransactionCard(transaction: transactions[index]),
        );
      },
    );
  }

  Widget _buildEmptyTransactions() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.account_balance_wallet_outlined,
              size: 64,
              color: Colors.grey[400],
            ),
            Text(
              'No transactions found',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            Text(
              'Start adding transactions to track your finances',
              style: TextStyle(
                color: Colors.grey[500],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
