import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unnamed_project/notifier.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsScreenState();

}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  String _currentLanguage = "Русский";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.settings,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color.fromRGBO(64, 107, 120, 1),
          centerTitle: true,
        ),
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
                    value: _currentLanguage,
                    dropdownColor: const Color.fromRGBO(29, 47, 56, 1),
                    items: <String>['Русский', 'English'].map((String value) {
                      return DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                                color: Colors.orange
                            ),
                          )
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      if (newValue == "English"){
                        ref.read(language.notifier).state = "en";
                      } else {
                        ref.read(language.notifier).state = "ru";
                      }
                      setState(() {
                        _currentLanguage = newValue!;
                      });
                    },
                    decoration: InputDecoration(
                        label: Text(
                          AppLocalizations.of(context)!.language,
                          style: const TextStyle(
                              color: Colors.white
                          ),
                        ),
                        focusColor: Colors.orange
                    ),
                  ),

                  const SizedBox(height: 40,),

                  TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)!.no,
                                      style: const TextStyle(
                                          color: Colors.white
                                      ),
                                    )
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      AppLocalizations.of(context)!.yes,
                                      style: const TextStyle(
                                          color: Colors.white
                                      ),
                                    )
                                ),
                              ],
                              title: Text(
                                AppLocalizations.of(context)!.delete_all_saves_title,
                              ),
                              content: Text(
                                AppLocalizations.of(context)!.delete_all_saves_content,
                                style: const TextStyle(
                                    color: Colors.white
                                ),
                              ),
                              titleTextStyle: const TextStyle(
                                  color: Colors.orange,
                                  fontSize: 20
                              ),
                              backgroundColor: const Color.fromRGBO(29, 47, 56, 1),
                            )
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.delete_all_saves,
                        style: const TextStyle(
                            color: Colors.white
                        ),
                      )
                  )
                ],
              ),
            ),
          ),
        )

    );
  }

}