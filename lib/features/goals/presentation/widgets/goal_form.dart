import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../core/providers/app_user_provider.dart';
import '../../../../shared/widgets/future_response_dialog.dart';
import '../../data/model/goal_model.dart';
import '../providers/goal_providers.dart';

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
        'isShortTerm': FormControl<bool>(
          value: false,
        ),
        'priority': FormControl<int>(
          value: 1,
          validators: <Validator<void>>[
            Validators.min(1),
            Validators.max(5),
          ],
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
      child: ReactiveFormBuilder(
        form: buildForm,
        builder: (BuildContext context, FormGroup form, Widget? child) {
          return Column(
            spacing: 12,
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
                    onTap: (_) async {
                      picker.showPicker();
                    },
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
              _buildPriorityField(),
              ListTile(
                trailing: ReactiveSwitch(
                  formControlName: 'isShortTerm',
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                title: const Text(
                  'Is a short term goal',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 8),
                  _buildSubmit(ref),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPriorityField() {
    return ReactiveFormConsumer(
      builder: (BuildContext context, FormGroup form, Widget? child) {
        return ListTile(
          title: const Text('Productivity level'),
          shape: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.outline),
            borderRadius: BorderRadius.circular(8),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: (form.control('priority').value as int? ?? 0) > 1
                    ? () {
                        final int currentLevel =
                            form.control('priority').value as int;
                        form.control('priority').value = currentLevel - 1;
                      }
                    : null,
              ),
              ReactiveValueListenableBuilder<int>(
                formControlName: 'priority',
                builder: (
                  BuildContext context,
                  AbstractControl<int> control,
                  Widget? child,
                ) {
                  return Text(
                    '${control.value}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: (form.control('priority').value as int? ?? 0) < 5
                    ? () {
                        final int currentLevel =
                            form.control('priority').value as int;
                        form.control('priority').value = currentLevel + 1;
                      }
                    : null,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSubmit(WidgetRef ref) {
    return ReactiveFormConsumer(
      builder: (BuildContext context, FormGroup form, Widget? child) {
        return ElevatedButton(
          onPressed: form.valid
              ? () async {
                  final GoalModel newGoal = GoalModel(
                    isShortTermed:
                        form.control('isShortTerm').value as bool? ?? false,
                    priority: form.control('priority').value as int? ?? 1,
                    title: form.control('title').value as String? ?? '',
                    amount: double.parse(
                      form.control('amount').value as String? ?? '0',
                    ),
                    currentlySaved: 0,
                    createdAt: DateTime.now(),
                    remaindAt: form.control('deadline').value as DateTime? ??
                        DateTime.now(),
                  );

                  final Future<bool> result =
                      ref.read(addGoalProvider(newGoal).future);
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
              : null,
          child: const Text('Create Goal'),
        );
      },
    );
  }
}
