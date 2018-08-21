import 'package:flutter/material.dart';

class MinistryPage extends StatefulWidget {
  @override
  _MinistryPageState createState() => _MinistryPageState();
}

class _MinistryPageState extends State<MinistryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ตัวชี้วัดกระทรวง'),
      ),
      body: Center(
        child: Text('ตัวชี้วัดกระทรวง'),
      ),
    );
  }
}
