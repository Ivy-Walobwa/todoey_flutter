import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';
import 'models/tasks_data.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_)=>TasksData(),
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'), // English
        ],
        home: TasksScreen(),
      ),
    );
  }
}
