abstract class AppHelper {
  AppHelper._();

  static bool isOneDayBefore(DateTime deadlineTime) {
    DateTime today = DateTime.now();
    DateTime oneDayBeforeDeadline = deadlineTime.subtract(const Duration(days: 1));

    return today.year == oneDayBeforeDeadline.year && today.month == oneDayBeforeDeadline.month && today.day == oneDayBeforeDeadline.day;
  }
}
