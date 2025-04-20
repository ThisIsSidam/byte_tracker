import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class GoalForm extends HookConsumerWidget {
  const GoalForm({super.key});

  FormGroup buildForm() => FormGroup(<String, AbstractControl<dynamic>>{
        'title': FormControl<String>(
          value: '',
          validators: <Validator<void>>[Validators.required],
        ),
        'amount': FormControl<String>(
          value: '',
          validators: <Validator<void>>[
            Validators.required,
            Validators.number(),
          ],
        ),
        'deadline': FormControl<DateTime>(
          validators: <Validator<void>>[Validators.required],
        ),
      });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        16,
        16,
        16,
        16 + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: ReactiveForm(
        formGroup: buildForm(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Create New Goal',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ReactiveTextField<String>(
              formControlName: 'title',
              decoration: const InputDecoration(
                labelText: 'Goal Title',
                hintText: 'e.g., New Phone',
              ),
              validationMessages: <String, ValidationMessageFunction>{
                'required': (Object error) => 'Title is required',
              },
            ),
            const SizedBox(height: 16),
            ReactiveTextField<String>(
              formControlName: 'amount',
              decoration: const InputDecoration(
                labelText: 'Target Amount (₹)',
                hintText: 'e.g., 15000',
              ),
              keyboardType: TextInputType.number,
              validationMessages: <String, ValidationMessageFunction>{
                'required': (Object error) => 'Amount is required',
                'number': (Object error) => 'Please enter a valid number',
              },
            ),
            const SizedBox(height: 16),
            ReactiveDatePicker<DateTime>(
              formControlName: 'deadline',
              firstDate: DateTime.now(),
              lastDate: DateTime(2100),
              builder: (
                BuildContext context,
                ReactiveDatePickerDelegate<DateTime> picker,
                Widget? child,
              ) {
                return ReactiveTextField<DateTime>(
                  formControlName: 'deadline',
                  onTap: (_) => picker.showPicker(),
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'Target Date',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  validationMessages: <String, ValidationMessageFunction>{
                    'required': (Object error) => 'Deadline is required',
                  },
                );
              },
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 8),
                ReactiveFormConsumer(
                  builder:
                      (BuildContext context, FormGroup form, Widget? child) {
                    return ElevatedButton(
                      onPressed: form.valid
                          ? () {
                              final Map<String, Object?> value = form.value;
                              // Handle goal addition
                              Navigator.of(context).pop();
                            }
                          : null,
                      child: const Text('Create Goal'),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
