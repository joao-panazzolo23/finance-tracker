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