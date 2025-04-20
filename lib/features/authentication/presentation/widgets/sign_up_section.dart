import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../app/router/router.dart';
import '../providers/sign_up_provider.dart';

class SignUpSection extends ConsumerWidget {
  const SignUpSection({required this.onNext, super.key});

  final VoidCallback onNext;

  FormGroup formGroup() => FormGroup(<String, AbstractControl<void>>{
        'fullName': FormControl<String>(
          validators: <Validator<void>>[Validators.required],
        ),
        'email': FormControl<String>(
          validators: <Validator<void>>[Validators.required, Validators.email],
        ),
        'aadhaar': FormControl<String>(
          validators: <Validator<void>>[Validators.required],
        ),
      });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ReactiveFormBuilder(
      form: formGroup,
      builder: (BuildContext context, FormGroup form, Widget? child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTitle(),
            _buildFullNameField(),
            _buildEmailField(),
            _buildAadhaarField(),
            _buildNextButton(context, ref, form),
            _buildSignInText(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return const Text(
      'Sign Up',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildFullNameField() {
    return ReactiveTextField<String>(
      formControlName: 'fullName',
      decoration: const InputDecoration(
        labelText: 'Full Name',
      ),
      validationMessages: <String, ValidationMessageFunction>{
        ValidationMessage.required: (_) => 'Full Name is required',
      },
    );
  }

  Widget _buildEmailField() {
    return ReactiveTextField<String>(
      formControlName: 'email',
      decoration: const InputDecoration(
        labelText: 'Email Address',
        hintText: 'example@gmail.com',
      ),
      validationMessages: <String, ValidationMessageFunction>{
        ValidationMessage.required: (_) => 'Email is required',
        ValidationMessage.email: (_) => 'Invalid email format',
      },
    );
  }

  Widget _buildAadhaarField() {
    return ReactiveTextField<String>(
      formControlName: 'aadhaar',
      decoration: const InputDecoration(
        labelText: 'Aadhaar Id',
        hintText: '1234 5678 9012 3456',
      ),
      validationMessages: <String, ValidationMessageFunction>{
        ValidationMessage.required: (_) => 'Aadhaar is required',
      },
    );
  }

  Widget _buildNextButton(BuildContext context, WidgetRef ref, FormGroup form) {
    return ReactiveFormConsumer(
      builder: (BuildContext context, FormGroup form, Widget? child) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: form.valid
                ? () async {
                    final String email = form.control('email').value as String;

                    ref.read(newUserStateProvider.notifier).updateUser(
                          email: email,
                          name: form.control('fullName').value as String,
                          aadhaar: form.control('aadhaar').value as String,
                        );
                    onNext();
                  }
                : null,
            child: const Text(
              'Next',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSignInText(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Already have an account? ',
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                context,
                AppRoute.signIn.path,
              );
            },
            child: Text(
              'Sign In',
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
