import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../app/router/router.dart';
import '../providers/auth_notifier.dart';
import '../providers/sign_up_provider.dart';

class AddPasswordSection extends ConsumerWidget {
  const AddPasswordSection({required this.toPrevious, super.key});

  final VoidCallback toPrevious;

  FormGroup formGroup() => FormGroup(
        <String, AbstractControl<void>>{
          'password': FormControl<String>(
            validators: <Validator<void>>[
              Validators.required,
              Validators.minLength(6),
              Validators.pattern('(?=.*[A-Z])'),
              Validators.pattern('(?=.*[a-z])'),
              Validators.pattern(r'(?=.*\d)'),
              Validators.pattern(r'(?=.*[@$!%*?&])'),
            ],
          ),
          'cnf-password': FormControl<String>(
            validators: <Validator<void>>[
              Validators.required,
            ],
          ),
        },
        validators: <Validator<void>>[
          Validators.mustMatch('password', 'cnf-password'),
        ],
      );

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
            _buildTitle(context),
            _buildPasswordField(),
            _buildConfirmPasswordField(),
            _buildNextButton(context, ref, form),
            _buildSignInText(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: toPrevious,
        ),
        const Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return HookBuilder(
      builder: (BuildContext context) {
        final ValueNotifier<bool> showPwd = useState<bool>(true);
        return ReactiveTextField<String>(
          formControlName: 'password',
          obscureText: showPwd.value,
          decoration: InputDecoration(
            labelText: 'Password',
            suffixIcon: IconButton(
              icon: Icon(
                showPwd.value ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                showPwd.value = !showPwd.value;
              },
            ),
          ),
          validationMessages: <String, ValidationMessageFunction>{
            ValidationMessage.required: (_) => 'Password is required',
            ValidationMessage.minLength: (_) =>
                'Password must be at least 6 characters long',
            ValidationMessage.pattern: (_) =>
                // ignore: lines_longer_than_80_chars
                'Must contain at least one uppercase letter\nMust contain at least one lowercase letter\nMust contain at least one number\nMust contain at least one special character (@\$!%*?&)',
          },
        );
      },
    );
  }

  Widget _buildConfirmPasswordField() {
    return HookBuilder(
      builder: (BuildContext context) {
        final ValueNotifier<bool> showPwd = useState<bool>(true);
        return ReactiveTextField<String>(
          formControlName: 'cnf-password',
          obscureText: showPwd.value,
          decoration: InputDecoration(
            labelText: 'Confirm Password',
            suffixIcon: IconButton(
              icon: Icon(
                showPwd.value ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                showPwd.value = !showPwd.value;
              },
            ),
          ),
          validationMessages: <String, ValidationMessageFunction>{
            ValidationMessage.required: (_) => 'Confirm password is required',
            ValidationMessage.mustMatch: (_) => 'Passwords must match',
          },
        );
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
                    ref.read(newUserStateProvider.notifier).updateUser(
                          password: form.control('password').value as String,
                        );
                    final bool status =
                        await ref.read(authNotifierProvider.notifier).signUp();
                    if (!status) {
                      // AppUtils.showToast(msg: 'Something went wrong!');
                    }
                  }
                : null,
            child: const Text(
              'Sign Up',
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
