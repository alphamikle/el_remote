typedef PresenceTest<T> = bool Function(T it);

extension ExtendedList<T> on List<T> {
  T? firstWhereOrNull(PresenceTest<T> test) {
    for (final T item in this) {
      if (test(item)) {
        return item;
      }
    }
    return null;
  }
}
