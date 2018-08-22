import 'package:flutter/material.dart';
import 'package:kpi/pages/home_page.dart';
import 'package:kpi/pages/login_page.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Athiti',
            scaffoldBackgroundColor: Color(0xffe9ebee),
            primaryColor: Color(0xff344955),
            accentColor: Color(0xfff9aa33)),
        title: 'ระบบจัดการ KPI',
        home: LoginPage());
  }
}
