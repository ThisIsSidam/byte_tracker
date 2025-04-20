import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// A dialog which shows the status of a future value
/// Different dialog states for different states of the
/// future value
class FutureResponseDialog extends HookWidget {
  const FutureResponseDialog({
    required this.futureBool,
    this.successText = 'Successfully updated',
    this.errorText = 'An error occurred',
    this.failedText = 'Update Failed',
    this.loadingText = 'Updating...',
    this.delayOnSuccess = const Duration(seconds: 1),
    this.delayOnFail = const Duration(seconds: 2),
    super.key,
  });

  final Future<bool> futureBool;
  final String successText;
  final String errorText;
  final String failedText;
  final String loadingText;
  final Duration delayOnSuccess;

  // Fail means error, or false outcome
  final Duration delayOnFail;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final ValueNotifier<Future<bool>> cachedFuture = useState(futureBool);

    useEffect(
      () {
        cachedFuture.value.then((bool result) {
          Future<void>.delayed(result ? delayOnSuccess : delayOnFail, () {
            if (context.mounted) {
              Navigator.pop(context, result);
            }
          });
        }).catchError((Object error) {
          Future<void>.delayed(delayOnFail, () {
            if (context.mounted) {
              Navigator.pop(context, false);
            }
          });
        });
        return null;
      },
      <Object?>[],
    );

    return PopScope(
      canPop: false,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: FutureBuilder<bool>(
            future: cachedFuture.value,
            builder: (
              BuildContext context,
              AsyncSnapshot<bool> snapshot,
            ) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return _loadingTile();
              } else if (snapshot.hasError) {
                return _errorTile(colorScheme);
              } else if (snapshot.hasData) {
                if (snapshot.data != null && snapshot.data!) {
                  return _successTile(colorScheme);
                } else {
                  return _failedTile(colorScheme);
                }
              } else {
                return _wentWrongTile(colorScheme);
              }
            },
          ),
        ),
      ),
    );
  }

  /// When the future is loading
  Widget _loadingTile() {
    return ListTile(
      leading: const SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(),
      ),
      title: Text(loadingText),
    );
  }

  /// When error is faced upon loading the future
  Widget _errorTile(ColorScheme colorScheme) {
    return ListTile(
      leading: Icon(Icons.error, color: colorScheme.error),
      title: Text(errorText),
    );
  }

  /// When future has returned null or false
  Widget _failedTile(ColorScheme colorScheme) {
    return ListTile(
      leading: Icon(Icons.close, color: colorScheme.primary),
      title: Text(failedText),
    );
  }

  /// When future has returned true
  Widget _successTile(ColorScheme colorScheme) {
    return ListTile(
      leading: Icon(Icons.check_circle, color: colorScheme.primary),
      title: Text(successText),
    );
  }

  /// When something unknown has happened
  Widget _wentWrongTile(ColorScheme colorScheme) {
    return ListTile(
      leading: Icon(Icons.question_mark, color: colorScheme.primary),
      title: const Text('Something went wrong!'),
    );
  }
}
