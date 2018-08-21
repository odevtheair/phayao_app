import 'package:flutter/material.dart';

class RegionPage extends StatefulWidget {
  @override
  _RegionPageState createState() => _RegionPageState();
}

class _RegionPageState extends State<RegionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ตัวชี้วัดเขต'),
      ),
      body: Center(
        child: Text('ตัวชี้วัดเขต'),
      ),
    );
  }
}
