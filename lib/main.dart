// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cookies_2024/provider/cookie_list_provider.dart';
import 'package:cookies_2024/provider/cookie_of_the_day_provider.dart';
import 'package:cookies_2024/service/cookie_service.dart';

import 'package:cookies_2024/pages/cookie_of_the_day_page.dart';

void main() async {
  var cookieService = CookieService();
  await cookieService.load();
  var cookieOfTheDayProvider = CookieOfTheDayProvider(cookieService);
  var cookieListProvider = CookieListProvider(cookieService);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => cookieListProvider),
      ChangeNotifierProvider(create: (_) => cookieOfTheDayProvider),
    ],
    child: const CookieApp(),
  ));
}

class CookieApp extends StatelessWidget {
  const CookieApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cookie App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CookieOfTheDayPage(),
    );
  }
}
