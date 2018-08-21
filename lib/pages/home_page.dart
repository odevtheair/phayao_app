import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kpi/api_provider.dart';
import 'package:kpi/pages/info_page.dart';
import 'package:kpi/pages/ministry_page.dart';
import 'package:kpi/pages/province_page.dart';
import 'package:kpi/pages/qof_page.dart';
import 'package:kpi/pages/region_page.dart';
import 'package:kpi/pages/setting_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = 'Flutter';
  int age = 20;
  double height = 160.0;
  bool isSuccess = true;
  List fruits = ['Apple', 'Mango', 'Banana']; // array
  Map fruit = {'Apple': 'red', 'Banana': 'Yellow'}; // object

  List items = [];
  bool isLoading = true;

  ApiProvider apiProvider = ApiProvider();

  Future fetchUsers() async {
    try {
      var response = await apiProvider.getUsers();
      if (response.statusCode == 200) {
        print(response.body);
        var jsonResponse = json.decode(response.body);
        setState(() {
          isLoading = false;
          items = jsonResponse['results'];
        });
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print(error);
    }
  }

  void showMessage() {
    print('Hello world!!');
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    Future<Null> _showConfirm() async {
      return showDialog<Null>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('ยืนยัน'),
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  new Text('ต้องการออก ใช่หรือไม่?.'),
                ],
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text(
                  'ใช่',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  exit(0);
                },
              ),
              new FlatButton(
                child: new Text('ไม่ใช่'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('ตัวชี้วัด'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SettingPage(),
                        fullscreenDialog: true));
              }),
          IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InfoPage()));
              }),
        ],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                'Satit Rianpit',
                style: TextStyle(fontSize: 20.0),
              ),
              accountEmail: Text('rianpit@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/med/men/90.jpg'),
              ),
            ),
            ListTile(
              title: Text('ตัวชี้วัด QOF'),
              subtitle: Text('ตัวชี้วัดคุณภาพการให้บริการ'),
              leading:
                  IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QofPage()));
              },
            ),
            Divider(),
            ListTile(
              title: Text('ตัวชี้วัดจังหวัด'),
              subtitle: Text('รายการตัวชี้วัดระดับจังหวัด'),
              leading: IconButton(icon: Icon(Icons.group), onPressed: () {}),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProvincePage()));
              },
            ),
            ListTile(
              title: Text('ตัวชี้วัดเขต'),
              subtitle: Text('รายการตัวชี้วัดระดับเขต'),
              leading:
                  IconButton(icon: Icon(Icons.dashboard), onPressed: () {}),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegionPage()));
              },
            ),
            ListTile(
              title: Text('ตัวชี้วัดกระทรวง'),
              subtitle: Text('รายการตัวชี้วัดระดับกระทรวง'),
              leading: IconButton(icon: Icon(Icons.pages), onPressed: () {}),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MinistryPage()));
              },
            ),
            Divider(),
            ListTile(
              title: Text('ออกจากแอปพลิเคชัน'),
//              leading: IconButton(icon: Icon(Icons.pages), onPressed: () {}),
              trailing: Icon(Icons.exit_to_app),
              onTap: () {
                _showConfirm();
              },
            ),
          ],
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                var item = items[index];

                return ListTile(
                  title: Text(
                      '${item['name']['title']} ${item['name']['first']} ${item['name']['last']}'),
                  subtitle: Text('${item['email']}'),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(item['picture']['thumbnail']),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                );
              },
              itemCount: items != null ? items.length : 0,
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Color(0xff344955),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.dashboard,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                ],
              ),
              Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.star,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                ],
              )
            ],
          )),
    );
  }

  showAlert() {
    Person person = Person('Flutter');
    person.showName();
  }
}

class Person {
  String name;
  Person(this.name);

  showName() {
    print('Hello, $name');
  }
}
