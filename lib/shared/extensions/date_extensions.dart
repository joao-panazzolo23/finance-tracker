///Extensions in dart are declared at file level, not class level.
extension DateTimeRangeExtension on DateTime {
  bool isBetween(DateTime start, DateTime end) {
    return (isAfter(start) || isAtSameMomentAs(start)) &&
        (isBefore(end) || isAtSameMomentAs(end));
  }
}


DateTime firstDayOfMonth(DateTime date) {
  return DateTime(date.year, date.month, 1);
}

DateTime lastDayOfMonth(DateTime date) {
  return DateTime(date.year, date.month + 1, 0);
}

DateTime monthOffset(DateTime from, int offsetMonths) {
  final totalMonths = from.year * 12 + (from.month - 1) - offsetMonths;
  return DateTime(totalMonths ~/ 12, totalMonths % 12 + 1, 1);
}