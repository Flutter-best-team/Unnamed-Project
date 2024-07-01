import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fl_chart/fl_chart.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {

  final int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/profile');
    }
  }

  String _selectedPeriod = 'day';
  Map<String, int> healthyCounts = {
    'sport': 0,
    'water': 0,
    'sleep': 0,
    'walk': 0,
    'food': 0,
  };
  Map<String, int> unhealthyCounts = {
    'smoking': 0,
    'alcohol': 0,
    'fastfood': 0,
  };

  @override
  void initState() {
    super.initState();
    _loadStatistics();
  }

  Future<void> _loadStatistics() async {
    final prefs = await SharedPreferences.getInstance();
    Map<String, int> newHealthyCounts = {};
    Map<String, int> newUnhealthyCounts = {};

    newHealthyCounts['sport'] = prefs.getInt('0') ?? 0;
    newHealthyCounts['water'] = prefs.getInt('1') ?? 0;
    newHealthyCounts['sleep'] = prefs.getInt('2') ?? 0;
    newHealthyCounts['walk'] = prefs.getInt('3') ?? 0;
    newHealthyCounts['food'] = prefs.getInt('4') ?? 0;

    newUnhealthyCounts['smoking'] = prefs.getInt('5') ?? 0;
    newUnhealthyCounts['alcohol'] = prefs.getInt('6') ?? 0;
    newUnhealthyCounts['fastfood'] = prefs.getInt('7') ?? 0;

    setState(() {
      healthyCounts = newHealthyCounts;
      unhealthyCounts = newUnhealthyCounts;
    });
  }

  void _onPeriodSelected(String period) {
    setState(() {
      _selectedPeriod = period;
    });
    _loadStatistics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(29, 47, 56, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(64, 107, 120, 1),
        title: const Text("Статистика"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(64, 107, 120, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildPeriodButton('day', 'День'),
                  _buildPeriodButton('week', 'Неделя'),
                  _buildPeriodButton('month', 'Месяц'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildBarChart('Полезные действия', healthyCounts),
            const SizedBox(height: 16),
            _buildBarChart('Вредные действия', unhealthyCounts),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.orange,
              width: 2.0,
            ),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color.fromRGBO(29, 47, 56, 1),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.add_chart),
              label: 'Statistic',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromRGBO(250, 121, 13, 1),
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Widget _buildPeriodButton(String period, String text) {
    bool isSelected = _selectedPeriod == period;
    return ElevatedButton(
      onPressed: () => _onPeriodSelected(period),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.orange : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.orange,
        ),
      ),
    );
  }

  Widget _buildBarChart(String title, Map<String, int> counts) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(64, 107, 120, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                barTouchData: BarTouchData(),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        const style = TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        );
                        String text;
                        switch (value.toInt()) {
                          case 0:
                            text = 'спорт';
                            break;
                          case 1:
                            text = 'вода';
                            break;
                          case 2:
                            text = 'сон';
                            break;
                          case 3:
                            text = 'прогулка';
                            break;
                          case 4:
                            text = 'еда';
                            break;
                          case 5:
                            text = 'курение';
                            break;
                          case 6:
                            text = 'алкоголь';
                            break;
                          case 7:
                            text = 'фастфуд';
                            break;
                          default:
                            text = '';
                            break;
                        }
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(text, style: style),
                        );
                      },
                      reservedSize: 28,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                barGroups: counts.entries
                    .map(
                      (entry) => BarChartGroupData(
                        x: _mapLabelToIndex(entry.key),
                        barRods: [
                          BarChartRodData(
                            toY: entry.value.toDouble(),
                            color: Colors.orange,
                            width: 16,
                            borderRadius: BorderRadius.zero,
                            backDrawRodData: BackgroundBarChartRodData(
                              show: true,
                              toY: 10,
                              color: Colors.white24,
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  int _mapLabelToIndex(String label) {
    switch (label) {
      case 'sport':
        return 0;
      case 'water':
        return 1;
      case 'sleep':
        return 2;
      case 'walk':
        return 3;
      case 'food':
        return 4;
      case 'smoking':
        return 5;
      case 'alcohol':
        return 6;
      case 'fastfood':
        return 7;
      default:
        return -1;
    }
  }
}
