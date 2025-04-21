import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:restart_app/restart_app.dart';

import '../../../../shared/widgets/buttons/loading_button.dart';
import '../../../../shared/widgets/future_response_dialog.dart';
import '../providers/connect_bank_provider.dart';

class ConnectBankScreen extends HookConsumerWidget {
  const ConnectBankScreen({super.key});

  FormGroup _formGroup() => FormGroup(
        <String, AbstractControl<void>>{
          'firstName': FormControl<String>(
            validators: <Validator<void>>[
              Validators.required,
              Validators.pattern(r'^[a-zA-Z]+$'),
            ],
          ),
          'lastName': FormControl<String>(
            validators: <Validator<void>>[
              Validators.required,
              Validators.pattern(r'^[a-zA-Z]+$'),
            ],
          ),
          'aadhaar': FormControl<String>(
            validators: <Validator<void>>[
              Validators.required,
              Validators.pattern(r'^\d{12}$'),
            ],
          ),
        },
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ReactiveFormBuilder(
        form: _formGroup,
        builder: (BuildContext context, FormGroup form, Widget? child) =>
            Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 40),
              _buildHeader(),
              const SizedBox(height: 24),
              _buildFirstNameField(),
              const SizedBox(height: 16),
              _buildLastNameField(),
              const SizedBox(height: 16),
              _buildAadhaarField(),
              const SizedBox(height: 24),
              _buildConnectButton(context, ref, form),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Connect Bank Account',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          // ignore: lines_longer_than_80_chars
          'Your bank account is not connected. Please fill in the details below.',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildFirstNameField() {
    return ReactiveTextField<String>(
      formControlName: 'firstName',
      decoration: const InputDecoration(
        labelText: 'First Name',
        hintText: 'Enter your first name',
      ),
      validationMessages: <String, ValidationMessageFunction>{
        ValidationMessage.required: (_) => 'First name is required',
        ValidationMessage.pattern: (_) => 'Please enter valid first name',
      },
    );
  }

  Widget _buildLastNameField() {
    return ReactiveTextField<String>(
      formControlName: 'lastName',
      decoration: const InputDecoration(
        labelText: 'Last Name',
        hintText: 'Enter your last name',
      ),
      validationMessages: <String, ValidationMessageFunction>{
        ValidationMessage.required: (_) => 'Last name is required',
        ValidationMessage.pattern: (_) => 'Please enter valid last name',
      },
    );
  }

  Widget _buildAadhaarField() {
    return ReactiveTextField<String>(
      formControlName: 'aadhaar',
      decoration: const InputDecoration(
        labelText: 'Aadhaar Number',
        hintText: 'Enter your 12-digit Aadhaar number',
      ),
      keyboardType: TextInputType.number,
      validationMessages: <String, ValidationMessageFunction>{
        ValidationMessage.required: (_) => 'Aadhaar number is required',
        ValidationMessage.pattern: (_) =>
            'Please enter valid 12-digit Aadhaar number',
      },
    );
  }

  Widget _buildConnectButton(
    BuildContext context,
    WidgetRef ref,
    FormGroup form,
  ) {
    return ReactiveFormConsumer(
      builder: (BuildContext context, FormGroup form, Widget? child) {
        return SizedBox(
          width: double.infinity,
          child: LoadingButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: form.valid
                ? () async {
                    // Handle form submission here
                    final String firstName =
                        form.control('firstName').value as String;
                    final String lastName =
                        form.control('lastName').value as String;
                    final String aadhaar =
                        form.control('aadhaar').value as String;

                    final Future<bool> updateStatus = ref.read(
                      connectToBankProvider(
                        firstName,
                        lastName,
                        aadhaar,
                      ).future,
                    );

                    final bool? updateResult = await showDialog<bool>(
                      context: context,
                      builder: (BuildContext context) => FutureResponseDialog(
                        futureBool: updateStatus,
                      ),
                    );

                    if (true == updateResult) {
                      await Restart.restartApp();
                    }
                  }
                : null,
            child: const Text(
              'Connect Bank Account',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
