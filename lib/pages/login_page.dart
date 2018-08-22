import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kpi/api_provider.dart';
import 'package:kpi/helper.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Helper helper = Helper();
  ApiProvider apiProvider = ApiProvider();

  TextEditingController ctrlUsername = TextEditingController();
  TextEditingController ctrlPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
//            color: Color(0xff344955),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg.jpg'),
                    fit: BoxFit.fill)),
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
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: ctrlUsername,
                          validator: (value) {
                            if (!helper.isEmail(value)) {
                              return 'ระบุชื่อผู้ใช้งาน';
                            }
                          },
//                      maxLength: 10,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              filled: true,
                              errorStyle:
                                  TextStyle(fontSize: 16.0, color: Colors.pink),
                              fillColor: Colors.white70,
                              labelText: 'ชื่อผู้ใช้งาน'),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: ctrlPassword,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          validator: (value) {
                            if (helper.isEmpty(value)) {
                              return 'ระบุรหัสผ่าน';
                            }
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
//                              border: OutlineInputBorder(
//                                  borderSide: BorderSide(
//                                      color: Colors.white,
//                                      style: BorderStyle.solid),
//                                  borderRadius: BorderRadius.circular(10.0)),
                              errorStyle:
                                  TextStyle(fontSize: 16.0, color: Colors.pink),
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
                                onPressed: () => _login(),
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

  Future _login() async {
    print(ctrlUsername.text + ', ' + ctrlPassword.text);

    if (_formKey.currentState.validate()) {
      // valid
      try {
        var response =
            await apiProvider.doLogin(ctrlUsername.text, ctrlPassword.text);
        if (response.statusCode == 200) {
          print(response.body);
        } else {
          print('Error');
        }
      } catch (error) {
        print(error);
      }
    } else {
      // popup
    }
  }
}
