import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  double currentProgress = 0.7;

  final List<String> healthyItems = [
    'Поход в спортзал',
    'Выпил 2 л воды',
    'Сон более 8 часов',
    'Прогулка на свежем воздухе',
    'Скушал фрукты/овощи',
  ];

  final List<String> unhealthyItems = [
    'Курение сигарет',
    'Употребление алкоголя',
    'Фастфуд',
  ];

  List<bool> healthySelections = [false, false, false, false, false];
  List<bool> unhealthySelections = [false, false, false];

  void _onItemTapped(int index) {
    if (index == 1) {
      _showAddItemModal(context);
    } else if (index == 2) {
      Navigator.pushNamed(context, '/settings');
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
              ...healthyItems.asMap().entries.map((entry) {
                int idx = entry.key;
                String item = entry.value;
                return ListTile(
                  title: Text(
                    item,
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        healthySelections[idx] = !healthySelections[idx];
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.orange),
                      backgroundColor: healthySelections[idx]
                          ? const Color.fromARGB(250, 158, 158, 158)
                          : Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                    ),
                    child: Text(
                      healthySelections[idx] ? '-' : '+',
                      style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 20,
                      ),
                    ),
                  ),
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
              ...unhealthyItems.asMap().entries.map((entry) {
                int idx = entry.key;
                String item = entry.value;
                return ListTile(
                  title: Text(
                    item,
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        unhealthySelections[idx] =
                            !unhealthySelections[idx];
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.orange),
                      backgroundColor: unhealthySelections[idx]
                          ? Colors.grey
                          : Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                    ),
                    child: Text(
                      unhealthySelections[idx] ? '-' : '+',
                      style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 20,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Karma is a bitch",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromRGBO(64, 107, 120, 1),
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
                            widthFactor: currentProgress,
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
                    '${(currentProgress * 100).toStringAsFixed(0)}%',
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
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                backgroundColor: const Color.fromRGBO(254, 243, 203, 1),
              ),
              child: const Text(
                'Customize your character',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
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
