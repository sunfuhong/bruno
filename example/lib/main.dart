import 'package:bruno/bruno.dart';
import 'sample/l10n/l10n.dart';
import 'package:example/sample/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'sample/theme/config_test_utils.dart';

void main() {
  BrnInitializer.register(allThemeConfig: TestConfigUtils.defaultAllConfig);

  BrnIntl.add(ResourceDe.locale, ResourceDe());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return NotificationListener<ChangeLocalEvent>(
      onNotification: (_) {
        setState(() {});
        return true;
      },
      child: MaterialApp(
        locale: ChangeLocalEvent.locale,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          BrnLocalizationDelegate.delegate,
        ],
        supportedLocales: [
          Locale('en', 'US'),
          Locale('zh', 'CN'),
          Locale('de', 'DE'),
        ],
        title: 'Flutter Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
