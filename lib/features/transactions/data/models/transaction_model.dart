import 'package:flutter/material.dart';

class Transaction {
  Transaction({
    required this.id,
    required this.title,
    required this.note,
    required this.amount,
    required this.date,
    required this.category,
    required this.icon,
    required this.color,
  });
  final int id;
  final String title;
  final String note;
  final int amount;
  final String date;
  final String category;
  final IconData icon;
  final Color color;
}
