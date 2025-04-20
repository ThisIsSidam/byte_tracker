import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../app/router.dart';
import '../providers/sign_up_provider.dart';
import '../widgets/add_pwd_section.dart';
import '../widgets/sign_up_section.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(newUserStateProvider, (_, __) {});
    final ValueNotifier<bool> showFirst = useState(true);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Navigator.pushReplacementNamed(context, AppRoute.signIn.path);
      },
      child: Scaffold(
        body: AnimatedCrossFade(
          firstChild: SignUpSection(
            onNext: () => showFirst.value = false,
          ),
          secondChild: AddPasswordSection(
            toPrevious: () => showFirst.value = true,
          ),
          crossFadeState: showFirst.value
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 300),
        ),
      ),
    );
  }
}
