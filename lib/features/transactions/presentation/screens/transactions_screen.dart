import 'package:flutter/material.dart';

import '../../data/models/transaction_model.dart';
import '../widgets/transaction_card.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';

  final List<Transaction> transactions = <Transaction>[
    Transaction(
      id: 1,
      title: 'Cafe Coffee Day',
      note: 'Coffee with friends',
      amount: -180,
      date: 'Today, 10:30 AM',
      category: 'Food',
      icon: Icons.coffee,
      color: Colors.orange,
    ),
    Transaction(
      id: 2,
      title: 'Metro Ticket',
      note: 'College commute',
      amount: -50,
      date: 'Today, 8:15 AM',
      category: 'Transport',
      icon: Icons.directions_bus,
      color: Colors.blue,
    ),
    Transaction(
      id: 3,
      title: 'Stipend',
      note: 'Internship payment',
      amount: 5000,
      date: 'Yesterday, 6:00 PM',
      category: 'Income',
      icon: Icons.work,
      color: Colors.green,
    ),
    Transaction(
      id: 4,
      title: "Domino's Pizza",
      note: 'Dinner with roommates',
      amount: -450,
      date: 'Yesterday, 8:30 PM',
      category: 'Food',
      icon: Icons.restaurant,
      color: Colors.orange,
    ),
    Transaction(
      id: 5,
      title: 'Steam Games',
      note: 'Weekend entertainment',
      amount: -299,
      date: 'Jul 15, 3:45 PM',
      category: 'Entertainment',
      icon: Icons.sports_esports,
      color: Colors.purple,
    ),
    Transaction(
      id: 6,
      title: 'Uber Ride',
      note: 'Late night return',
      amount: -120,
      date: 'Jul 15, 11:30 PM',
      category: 'Transport',
      icon: Icons.directions_car,
      color: Colors.blue,
    ),
    Transaction(
      id: 7,
      title: 'Stationery',
      note: 'Project supplies',
      amount: -250,
      date: 'Jul 14, 4:20 PM',
      category: 'Misc',
      icon: Icons.shopping_bag,
      color: Colors.grey,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Transaction> get filteredTransactions {
    return transactions.where((Transaction transaction) {
      return transaction.title
              .toLowerCase()
              .contains(_searchQuery.toLowerCase()) ||
          transaction.note.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          transaction.category
              .toLowerCase()
              .contains(_searchQuery.toLowerCase());
    }).toList();
  }

  List<Transaction> getTransactionsByCategory(String category) {
    if (category == 'All') {
      return filteredTransactions;
    } else if (category == 'Misc') {
      return filteredTransactions
          .where(
            (Transaction t) =>
                !<String>['Food', 'Transport', 'Income'].contains(t.category),
          )
          .toList();
    } else {
      return filteredTransactions
          .where((Transaction t) => t.category == category)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: TextField(
          onChanged: (String value) {
            setState(() {
              _searchQuery = value;
            });
          },
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
          controller: _tabController,
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Theme.of(context).primaryColor,
          tabs: const <Widget>[
            Tab(text: 'All'),
            Tab(text: 'Food'),
            Tab(text: 'Transport'),
            Tab(text: 'Misc'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          _buildTransactionList(getTransactionsByCategory('All')),
          _buildTransactionList(getTransactionsByCategory('Food')),
          _buildTransactionList(getTransactionsByCategory('Transport')),
          _buildTransactionList(getTransactionsByCategory('Misc')),
        ],
      ),
    );
  }

  Widget _buildTransactionList(List<Transaction> transactions) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: transactions.length,
      itemBuilder: (BuildContext context, int index) {
        final Transaction transaction = transactions[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: TransactionCard(transaction: transaction),
        );
      },
    );
  }
}
