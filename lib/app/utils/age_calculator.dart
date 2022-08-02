class AgeCalculator {
  /// isLeapYear method
  static bool isLeapYear(int year) =>
      (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));

  /// daysInMonth method
  static int daysInMonth(int year, int month) =>
      (month == DateTime.february && isLeapYear(year))
          ? 29
          : _daysInMonth[month - 1];
  static const List<int> _daysInMonth = [
    31,
    28,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31
  ];

  static String calculateAge(DateTime birthDate) {
    // DateDuration duration;
    DateTime currentDate = DateTime.now();
    int years = currentDate.year - birthDate.year;
    int months = 0;
    int days = 0;
    if (birthDate.month > currentDate.month) {
      years--;
      months = (DateTime.monthsPerYear + currentDate.month - birthDate.month);

      if (birthDate.day > currentDate.day) {
        months--;
        days = daysInMonth(birthDate.year + years,
                ((birthDate.month + months - 1) % DateTime.monthsPerYear) + 1) +
            currentDate.day -
            birthDate.day;
      } else {
        days = currentDate.day - birthDate.day;
      }
    } else if (currentDate.month == birthDate.month) {
      if (birthDate.day > currentDate.day) {
        years--;
        months = DateTime.monthsPerYear - 1;
        days = daysInMonth(birthDate.year + years,
                ((birthDate.month + months - 1) % DateTime.monthsPerYear) + 1) +
            currentDate.day -
            birthDate.day;
      } else {
        days = currentDate.day - birthDate.day;
      }
    } else {
      months = (currentDate.month - birthDate.month);

      if (birthDate.day > currentDate.day) {
        months--;
        days = daysInMonth(birthDate.year + years, (birthDate.month + months)) +
            currentDate.day -
            birthDate.day;
      } else {
        days = currentDate.day - birthDate.day;
      }
    }
    String results = '';
    if (years == 0 && months == 0) {
      results = "$days hari";
    } else if (years == 0) {
      results = "$months bulan";
    } else {
      results = "$years tahun";
    }
    return results;
  }
}
