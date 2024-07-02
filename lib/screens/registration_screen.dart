import 'package:flutter/material.dart';
import 'package:unnamed_project/screens/profile_screen.dart';
import '../storage/profile_storage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  @override
  State<StatefulWidget> createState() => _RegistrationScreenState();
}
class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();


  @override
  void dispose() {
    _heightController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    _nameController.dispose();
    super.dispose();
  }


  void _showIncompleteProfileDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(29, 47, 56, 1)
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context)!.incomplited_profile,
                      style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      AppLocalizations.of(context)!.incomplited_profile_messege,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        child: const Text('OK',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }





  @override
  Widget build(BuildContext context) {
    String selectedGender = AppLocalizations.of(context)!.male;
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
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.name,
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
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                        color: Colors.white
                    ),
                  ),

                  const SizedBox(height: 16),

                  DropdownButtonFormField(
                    value: selectedGender,
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
                    onChanged: (newValue) {
                      setState(() {
                        selectedGender = newValue!;
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
                        List<String> porfileInfo = [];
                        if((_nameController.text) == ""){
                          _showIncompleteProfileDialog();
                          return;
                        }
                        porfileInfo.add(_nameController.text);
                        if(selectedGender == AppLocalizations.of(context)!.male){
                          porfileInfo.add("Male");
                        } else if (selectedGender == AppLocalizations.of(context)!.female){
                          porfileInfo.add("Female");
                        } else {
                          porfileInfo.add("Battle helicopter");
                        }
                        if((_heightController.text) == ""){
                          _showIncompleteProfileDialog();
                          return;
                        }
                        porfileInfo.add(_heightController.text);
                        if((_weightController.text) == ""){
                          _showIncompleteProfileDialog();
                          return;
                        }
                        porfileInfo.add(_weightController.text);
                        if((_ageController.text) == ""){
                          _showIncompleteProfileDialog();
                          return;
                        }
                        porfileInfo.add(_ageController.text);


                        ProfileStorage.toRegistrete();
                        ProfileStorage.setProfile(porfileInfo);
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