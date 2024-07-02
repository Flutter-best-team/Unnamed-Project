import 'package:shared_preferences/shared_preferences.dart';
class SharedPreferencesHelper {
  static double currentProgress = 0.0;
  static DateTime currentDate = DateTime.now();
  static final List<String> healthyItems = [
    'Поход в спортзал',
    'Выпил 2 л воды',
    'Сон более 8 часов',
    'Прогулка на свежем воздухе',
    'Скушал фрукты/овощи',
  ];
  static final List<String> unhealthyItems = [
    'Курение сигарет',
    'Употребление алкоголя',
    'Фастфуд',
  ];

  static List<bool> healthySelections = [false, false, false, false, false];
  static List<bool> unhealthySelections = [false, false, false];


  static Future<void> loadProgress(Function setState) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      currentProgress = prefs.getDouble('currentProgress') ?? 0.0;
      currentDate =
          DateTime.tryParse(prefs.getString('currentDate') ?? '') ?? DateTime.now();
      if (currentDate.day != DateTime.now().day) {
        currentProgress = 0.0;
        prefs.setDouble('currentProgress', 0.0);
        prefs.setString('currentDate', DateTime.now().toIso8601String());
      }
    });
  }
  static Future<void> updateProgress(Function setState, double value) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      currentProgress += value;
      if (currentProgress < -1) currentProgress = -1;
      if (currentProgress > 1) currentProgress = 1;
      prefs.setDouble('currentProgress', currentProgress);
    });
  }
  static Future<void> updateStatistics(String item, int value) async {
    final prefs = await SharedPreferences.getInstance();
    if (healthyItems.contains(item)) {
      String key = healthyItems.indexOf(item).toString();
      int currentCount = prefs.getInt(key) ?? 0;
      prefs.setInt(key, currentCount + value);
    } else if (unhealthyItems.contains(item)) {
      String key = (unhealthyItems.indexOf(item) + healthyItems.length).toString();
      int currentCount = prefs.getInt(key) ?? 0;
      prefs.setInt(key, currentCount + value);
    }
  }


}