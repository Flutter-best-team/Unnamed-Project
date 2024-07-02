import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<StatefulWidget> createState() => _ProfileState();
}
class _ProfileState extends State<Profile>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.profile,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromRGBO(64, 107, 120, 1),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(
                    context,
                    '/profile/settings'
                );
              },
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              )
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(64, 107, 120, 1), Color.fromRGBO(29, 47, 56, 1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const ProfileForm(),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});
  @override
  State<StatefulWidget> createState() => _ProfileFormState();
}
class _ProfileFormState extends State<ProfileForm> {
  @override
  Widget build(BuildContext context) {
    String selectedGender = AppLocalizations.of(context)!.male;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Specify your gender',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(64, 107, 120, 1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: DropdownButtonFormField<String>(
              value: selectedGender,
              icon: const Icon(Icons.arrow_downward, color: Colors.white),
              dropdownColor: const Color.fromRGBO(64, 107, 120, 1),
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
              onChanged: (String? newValue) {},
              items: <String>[AppLocalizations.of(context)!.male, AppLocalizations.of(context)!.female, AppLocalizations.of(context)!.battle_helicopter].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(
                        color: Colors.white
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),
          buildTextField('Specify your height', '176'),
          const SizedBox(height: 16),
          buildTextField('Specify your weight', '34'),
          const SizedBox(height: 16),
          buildTextField('Specify your birhday', '21.02.1999'),
          const SizedBox(height: 32),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                textStyle: const TextStyle(color: Colors.white),
              ),
              child: const Text(
                'Save changes',
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildTextField(String label, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(64, 107, 120, 1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.white),
              suffixIcon: const Icon(Icons.edit, color: Colors.orange),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}
class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final int _selectedIndex = 2;
  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/statistics');
    }
    else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/profile');
    }
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}