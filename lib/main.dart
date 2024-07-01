import 'package:flutter/material.dart';
import 'package:unnamed_project/l10n/l10n.dart';


import 'package:unnamed_project/screens/profile_screen.dart';
import 'screens/init_screen.dart';
import 'screens/home_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/statistics_screen.dart';


import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'notifier.dart';


void main() {
  runApp(const ProviderScope(child: KarmaApp()));
}

class KarmaApp extends ConsumerWidget {
  const KarmaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      // Поддерживаемые локализации
      supportedLocales: L10n.all,
      locale: Locale(ref.watch(language)),
      // Локализации
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],

      initialRoute: '/init',
      debugShowCheckedModeBanner: false,
      title: "Karma",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/init' : (context) => const InitialScreen(),
        '/registration' : (context) => const RegistrationScreen(),
        '/settings' : (context ) => const Profile()
        '/statistics' : (context) => const StatisticsScreen()
      },
    );
  }
}