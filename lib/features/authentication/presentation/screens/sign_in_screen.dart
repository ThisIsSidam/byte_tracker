import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../shared/widgets/buttons/loading_button.dart';
import '../../../../shared/widgets/riverpod_widgets/state_selector.dart';
import '../providers/auth_notifier.dart';

class SignInScreen extends HookConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<bool> showPwdNotifier = useValueNotifier<bool>(true);
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 36,
            vertical: 48,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 500,
            ),
            child: ReactiveFormBuilder(
              form: () => FormGroup(
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
                    ],
                  ),
                },
              ),
              builder: (BuildContext context, FormGroup form, Widget? child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Sign In',
                      style: theme.textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 24),
                    ReactiveTextField<String>(
                      formControlName: 'email',
                      validationMessages: <String, ValidationMessageFunction>{
                        'required': (Object error) => 'Email is required',
                        'email': (Object error) => 'Enter a valid email',
                      },
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'example@gmail.com',
                      ),
                    ),
                    const SizedBox(height: 24),
                    ValueListenableBuilder<bool>(
                      valueListenable: showPwdNotifier,
                      builder: (
                        BuildContext context,
                        bool showPwd,
                        Widget? child,
                      ) {
                        return ReactiveTextField<String>(
                          formControlName: 'password',
                          obscureText: showPwd,
                          validationMessages: <String,
                              ValidationMessageFunction>{
                            'required': (Object error) =>
                                'Password is required',
                          },
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: '******',
                            suffixIcon: IconButton(
                              icon: Icon(
                                showPwd
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                showPwdNotifier.value = !showPwd;
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    StateSelector<AsyncValue<AuthState>, Object?>(
                      selector: (AsyncValue<AuthState> state) => state.error,
                      provider: authNotifierProvider,
                      builder: (__, Object? error, _) => error != null
                          ? Column(
                              children: <Widget>[
                                Text(
                                  'The email or password is incorrect',
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
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: StateSelector<AsyncValue<AuthState>, bool>(
                        selector: (AsyncValue<AuthState> state) =>
                            state.isLoading &&
                            (state.hasValue || state.hasError),
                        provider: authNotifierProvider,
                        builder: (__, bool isLoading, Widget? child) =>
                            LoadingButton(
                          isLoading: isLoading,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 12,
                            ),
                          ),
                          onPressed: () async {
                            if (form.valid) {
                              final String email =
                                  form.control('email').value as String;
                              final String pwd =
                                  form.control('password').value as String;
                              await ref
                                  .read(authNotifierProvider.notifier)
                                  .signIn(
                                    email,
                                    pwd,
                                  );
                            } else {
                              form.markAllAsTouched();
                            }
                          },
                          child: child,
                        ),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Center(
                      child: Text(
                        "Don't have an account? ",
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
