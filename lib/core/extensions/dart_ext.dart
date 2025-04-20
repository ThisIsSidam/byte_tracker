extension MapIterableX on Iterable<Map<String, Object?>> {
  List<T> tryMap<T>(
    T Function(Map<String, Object?>) fromJsonT, {
    int? count,
    void Function(Object e, StackTrace stk)? onError,
  }) {
    final List<T> result = <T>[];
    final Iterable<Map<String, Object?>> items = take(count ?? length);
    for (final Map<String, Object?> e in items) {
      try {
        result.add(fromJsonT(e));
      } catch (e, stk) {
        onError?.call(e, stk);
      }
    }
    return result;
  }
}
