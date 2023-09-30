import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner/pages/home_page.dart';
import 'package:qrscanner/pages/map_page.dart';
import 'package:qrscanner/providers/scans_list_provider.dart';
import 'package:qrscanner/providers/ui_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => ScansListProvider(), lazy: false),
        ChangeNotifierProvider(create: (context) => UiProvider(), lazy: false)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.deepPurple),
            useMaterial3: true),
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'home': (context) => const HomePage(),
          'map': (context) =>  MapaPage()
        },
      ),
    );
  }
}
