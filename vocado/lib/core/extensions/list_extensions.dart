extension ListExtensions<t> on Iterable<t> {
  int countIf(bool Function(t element) condition) {
   return fold(0, (previousValue, element) => condition(element) ? 1 : 0);
  }

  double countIfAvg(bool Function(t element) condition) {
   return (fold(0, (previousValue, element) => condition(element) ? 1 : 0)) / length;
  }
}
