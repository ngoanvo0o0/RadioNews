enum ScreenIndex {
  home,
  event,
  recording,
  about,
  playing,
}

String formatDateString(String dateString) {
  // Parse the input string into a DateTime object
  DateTime dateTime = DateTime.parse(dateString);

  // Format the DateTime object into the desired string format
  String formattedDate =
      "${_getMonthName(dateTime.month)} ${dateTime.day}, ${dateTime.year}";

  return formattedDate;
}

String _getMonthName(int month) {
  List<String> convertString = [
    "",
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  if (month >= 12) {
    month = 12;
  }
  return convertString[month];
}
