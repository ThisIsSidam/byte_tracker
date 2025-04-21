import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../core/providers/app_user_provider.dart';
import '../../../../shared/widgets/future_response_dialog.dart';
import '../../data/models/transaction_model.dart';
import '../providers/transactions_provider.dart';

class TransactionSheet extends ConsumerWidget {
  const TransactionSheet({
    required this.transaction,
    super.key,
  });
  final DebitModel transaction;

  FormGroup buildForm() {
    return FormGroup(<String, AbstractControl<void>>{
      'title': FormControl<String>(
        value: transaction.title,
        validators: <Validator<void>>[Validators.required],
      ),
      'notes': FormControl<String>(
        value: transaction.notes,
      ),
      'category': FormControl<String>(
        value: transaction.category,
        validators: <Validator<void>>[Validators.required],
      ),
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        16,
        16,
        16,
        16 + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: ReactiveFormBuilder(
        form: buildForm,
        builder: (_, __, ___) => Column(
          spacing: 16,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Edit Transaction',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ReactiveTextField<String>(
              formControlName: 'title',
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            ReactiveTextField<String>(
              formControlName: 'notes',
              decoration: const InputDecoration(
                labelText: 'Notes',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            ReactiveTextField<String>(
              formControlName: 'category',
              decoration: const InputDecoration(
                labelText: 'Category',
                border: OutlineInputBorder(),
              ),
            ),
            _buildSubmit(ref),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmit(WidgetRef ref) {
    return ReactiveFormConsumer(
      builder: (BuildContext context, FormGroup form, Widget? child) {
        return ElevatedButton(
          onPressed: () async {
            if (buildForm().valid) {
              final DebitModel newDebit = transaction.copyWith(
                title: form.control('title').value as String,
                notes: form.control('notes').value as String?,
                category: form.control('category').value as String,
              );

              final Future<bool> result =
                  ref.read(updateDebitProvider(newDebit).future);
              final bool? updateResult = await showDialog<bool>(
                context: context,
                builder: (BuildContext context) => FutureResponseDialog(
                  futureBool: result,
                ),
              );
              if (!context.mounted) return;
              if (updateResult != null && updateResult) {
                ref.invalidate(appUserProvider);
                Navigator.of(context).pop();
              }
            }
          },
          child: const Text('Save'),
        );
      },
    );
  }
}
