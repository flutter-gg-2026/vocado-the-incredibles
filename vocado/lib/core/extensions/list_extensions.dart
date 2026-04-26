extension ListExtensions<t> on Iterable<t> {
  int countIf(bool Function(t element) condition) {
    return fold(
      0,
      (previousValue, element) => condition(element) ? 1 : previousValue,
    );
  }

  double countIfAvg(bool Function(t element) condition) {
    return fold(
          0,
          (previousValue, element) =>
              condition(element) ? previousValue + 1 : previousValue,
        ) /
        length *
        100;
  }
}
