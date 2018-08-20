import 'package:flutter/material.dart';
import 'package:kpi/pages/home_page.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Color(0xff344955), accentColor: Color(0xfff9aa33)),
        title: 'ระบบจัดการ KPI',
        home: HomePage());
  }
}
