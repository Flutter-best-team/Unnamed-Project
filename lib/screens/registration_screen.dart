import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String _selectedGender = 'Male';
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(64, 107, 120, 1), Color.fromRGBO(29, 47, 56, 1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButtonFormField(
                  value: _selectedGender,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.gender,
                    labelStyle: const TextStyle(
                      color: Colors.orange,
                      fontSize: 20
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      borderSide: BorderSide(
                        color: Colors.orange,
                      )
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      borderSide: BorderSide(
                        color: Colors.orange
                      )
                    ),
                  ),
                  icon: const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.orange,
                  ),
                  dropdownColor: const Color.fromRGBO(29, 47, 56, 1),
                  items: ['Male', 'Female', 'Battle Helicopter'].map((String value) {
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
                  onChanged: (newValue) {
                    setState(() {
                      _selectedGender = newValue!;
                    });
                  },
                ),

                const SizedBox(height: 16,),

                TextField(
                  controller: _ageController,
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.birthday,
                      labelStyle: const TextStyle(
                        color: Colors.orange,
                        fontSize: 20
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          borderSide: BorderSide(
                            color: Colors.orange,
                          )
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          borderSide: BorderSide(
                              color: Colors.orange
                          )
                      ),
                      suffixIcon: const Icon(
                        Icons.edit,
                        color: Colors.orange,
                      )
                  ),
                  keyboardType: TextInputType.datetime,
                  style: const TextStyle(
                      color: Colors.white
                  ),

                ),

                const SizedBox(height: 16),

                TextField(
                  controller: _heightController,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.height,
                    labelStyle: const TextStyle(
                        color: Colors.orange,
                        fontSize: 20
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        borderSide: BorderSide(
                          color: Colors.orange,
                        )
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        borderSide: BorderSide(
                            color: Colors.orange
                        )
                    ),
                    suffixIcon: const Icon(
                      Icons.edit,
                      color: Colors.orange,
                    )
                  ),
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                      color: Colors.white
                  ),
                ),

                const SizedBox(height: 16),

                TextField(
                  controller: _weightController,
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.weight,
                      labelStyle: const TextStyle(
                          color: Colors.orange,
                          fontSize: 20
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          borderSide: BorderSide(
                            color: Colors.orange,
                          )
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          borderSide: BorderSide(
                              color: Colors.orange
                          )
                      ),
                      suffixIcon: const Icon(
                        Icons.edit,
                        color: Colors.orange,
                      )
                  ),
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                      color: Colors.white
                  ),
                ),

                const SizedBox(height: 70),

                ElevatedButton(
                    onPressed: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(29, 47, 56, 1),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      )
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.continue_button,
                      style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 20
                      ),
                    )
                )
              ],
            ),
          ),
        )
      ),
    );
  }

}