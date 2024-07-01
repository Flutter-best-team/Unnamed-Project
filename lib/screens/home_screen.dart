import 'package:flutter/material.dart';
import 'statistics_screen.dart';
import 'package:unnamed_project/storage/shared_preferences_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.loadProgress(setState);
  }

  void _updateProgress(double value) {
    SharedPreferencesHelper.updateProgress(setState, value);
  }

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/statistics');
    } else if (index == 1) {
      _showAddItemModal(context);
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/profile');
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _showAddItemModal(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: const Color.fromRGBO(29, 47, 56, 1),
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
    isScrollControlled: true,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Полезные действия',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Divider(color: Colors.orange),
                ...SharedPreferencesHelper.healthyItems.asMap().entries.map((entry) {
                  int idx = entry.key;
                  String item = entry.value;
                  return CheckboxListTile(
                    title: Text(
                      item,
                      style: const TextStyle(color: Colors.white),
                    ),
                    value: SharedPreferencesHelper.healthySelections[idx],
                    onChanged: (bool? value) {
                      setState(() {
                        SharedPreferencesHelper.healthySelections[idx] = value!;
                        if (value) {
                          _updateProgress(0.2);
                          SharedPreferencesHelper.updateStatistics(item, 1);
                        } else {
                          _updateProgress(-0.2);
                          SharedPreferencesHelper.updateStatistics(item, -1);
                        }
                      });
                    },
                    checkColor: Colors.white,
                    activeColor: Colors.orange,
                  );
                }).toList(),
                const SizedBox(height: 10),
                const Text(
                  'Вредные действия',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Divider(color: Colors.orange),
                ...SharedPreferencesHelper.unhealthyItems.asMap().entries.map((entry) {
                  int idx = entry.key;
                  String item = entry.value;
                  return CheckboxListTile(
                    title: Text(
                      item,
                      style: const TextStyle(color: Colors.white),
                    ),
                    value: SharedPreferencesHelper.unhealthySelections[idx],
                    onChanged: (bool? value) {
                      setState(() {
                        SharedPreferencesHelper.unhealthySelections[idx] = value!;
                        if (value) {
                          _updateProgress(-0.2);
                          SharedPreferencesHelper.updateStatistics(item, 1);
                        } else {
                          _updateProgress(0.2);
                          SharedPreferencesHelper.updateStatistics(item, -1);
                        }
                      });
                    },
                    checkColor: Colors.white,
                    activeColor: Colors.orange,
                  );
                }).toList(),
              ],
            ),
          );
        },
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Karma",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromRGBO(64, 107, 120, 1),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(64, 107, 120, 1),
              Color.fromRGBO(29, 47, 56, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    width: 350,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[800],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                            ),
                          ),
                          FractionallySizedBox(
                            widthFactor: (SharedPreferencesHelper.currentProgress + 1) / 2,
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromRGBO(250, 121, 13, 1),
                                    Color.fromRGBO(252, 195, 129, 1),
                                    Color.fromRGBO(254, 243, 203, 1),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.topCenter,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${((SharedPreferencesHelper.currentProgress + 1) * 50).toStringAsFixed(0)}%',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 400,
              height: 400,
              child: Image.asset(
                'assets/images/img1.png',
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
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
              icon: Icon(Icons.add),
              label: 'Add item',
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
}
