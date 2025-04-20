import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../app/router/router.dart';
import '../../../../shared/widgets/buttons/loading_button.dart';
import '../../../../shared/widgets/riverpod_widgets/state_selector.dart';
import '../providers/auth_notifier.dart';
import '../providers/sign_up_provider.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({super.key});

  FormGroup _formGroup() => FormGroup(
        <String, AbstractControl<void>>{
          'email': FormControl<String>(
            validators: <Validator<void>>[
              Validators.required,
              Validators.email,
            ],
          ),
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
            validators: <Validator<void>>[Validators.required],
          ),
        },
        validators: <Validator<void>>[
          Validators.mustMatch('password', 'cnf-password'),
        ],
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Navigator.pushReplacementNamed(context, AppRoute.signIn.path);
      },
      child: Scaffold(
        body: ReactiveFormBuilder(
          form: _formGroup,
          builder: (BuildContext context, FormGroup form, Widget? child) =>
              Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _buildEmailField(),
                _buildPasswordField(),
                _buildConfirmPasswordField(),
                _buildError(theme),
                _buildSignUpButton(context, ref, form),
                _buildSignInText(context),
              ],
            ),
          ),
        ),
      ),
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
              onPressed: () => showPwd.value = !showPwd.value,
            ),
          ),
          validationMessages: <String, ValidationMessageFunction>{
            ValidationMessage.required: (_) => 'Password is required',
            ValidationMessage.minLength: (_) =>
                'Password must be at least 6 characters long',
            ValidationMessage.pattern: (_) =>
                // ignore: lines_longer_than_80_chars
                'Password must contain uppercase, lowercase, number and special character',
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
              onPressed: () => showPwd.value = !showPwd.value,
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

  Widget _buildError(ThemeData theme) {
    return StateSelector<AsyncValue<AuthState>, Object?>(
      selector: (AsyncValue<AuthState> state) => state.error,
      provider: authNotifierProvider,
      builder: (__, Object? error, _) => error != null
          ? Column(
              children: <Widget>[
                Text(
                  error is FirebaseAuthException
                      ? error.message ?? 'Something went wrong'
                      : 'Something went wrong',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.red,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            )
          : const SizedBox.shrink(),
    );
  }

  Widget _buildSignUpButton(
    BuildContext context,
    WidgetRef ref,
    FormGroup form,
  ) {
    return ReactiveFormConsumer(
      builder: (BuildContext context, FormGroup form, Widget? child) {
        return SizedBox(
          width: double.infinity,
          child: StateSelector<AsyncValue<AuthState>, bool>(
            selector: (AsyncValue<AuthState> state) =>
                state.isLoading && (state.hasValue || state.hasError),
            provider: authNotifierProvider,
            builder: (__, bool isLoading, Widget? child) => LoadingButton(
              isLoading: isLoading,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: form.valid
                  ? () async {
                      ref.read(newUserStateProvider.notifier).updateUser(
                            email: form.control('email').value as String,
                            password: form.control('password').value as String,
                          );
                      final bool status = await ref
                          .read(authNotifierProvider.notifier)
                          .signUp();
                      if (!status) {
                        // Handle error
                      }
                    }
                  : null,
              child: const Text(
                'Sign Up',
                style: TextStyle(color: Colors.white),
              ),
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
          const Text('Already have an account? '),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoute.signIn.path);
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
