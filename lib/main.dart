import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/home_layout/home_layout.dart';
import 'package:todo_app/pages/splash_screen/splash_page.dart';
import 'package:todo_app/provider/setting_provider.dart';
import 'package:todo_app/shared-components/theme/my_theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: splashpage.routeName,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(provider.currentlanguage),
        theme: MyTheme.lightTheme,
        routes: {
          splashpage.routeName: (context) => splashpage(),
          HomeLayout.routeName: (context) => HomeLayout(),
        });
  }
}
