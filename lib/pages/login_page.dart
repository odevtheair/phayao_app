import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Color(0xff344955),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png',
                width: 130.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'ตัวชี้วัดเขตสุขภาพที่ ๑',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                    child: Column(
                  children: <Widget>[
                    TextFormField(
//                      maxLength: 10,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          filled: true,
                          fillColor: Colors.white70,
                          labelText: 'ชื่อผู้ใช้งาน'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          filled: true,
                          fillColor: Colors.white70,
                          labelText: 'รหัสผ่าน'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RaisedButton.icon(
                            color: Colors.pink,
                            textColor: Colors.white,
                            onPressed: () {},
                            icon: Icon(Icons.send),
                            label: Text('เข้าใช้งานระบบ')),
                        RaisedButton.icon(
                            color: Colors.teal,
                            textColor: Colors.white,
                            onPressed: () {},
                            icon: Icon(Icons.person_add),
                            label: Text('ลงทะเบียนใหม่')),
                      ],
                    )
                  ],
                )),
              )
            ],
          )
        ],
      ),
    );
  }
}
