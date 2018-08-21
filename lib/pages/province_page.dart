import 'package:flutter/material.dart';

class ProvincePage extends StatefulWidget {
  @override
  _ProvincePageState createState() => _ProvincePageState();
}

class _ProvincePageState extends State<ProvincePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ตัวชี้วัดจังหวัด'),
      ),
      body: Center(
        child: Text('ตัวชี้วัดจังหวัด'),
      ),
    );
  }
}
