import 'package:flutter/material.dart';
import 'package:kpi/pages/info_page.dart';
import 'package:kpi/pages/ministry_page.dart';
import 'package:kpi/pages/province_page.dart';
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

  void showMessage() {
    print('Hello world!!');
  }

  @override
  Widget build(BuildContext context) {
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
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
//          margin: EdgeInsets.all(10.0),
//          height: 100.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0), color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('กดกหดดหกดกหดดหดหด'),
                      ),
                      Text(
                        'bbbหกดกดbbb',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
//                    radius: 40.0,
                      backgroundImage: NetworkImage(
                          'https://randomuser.me/api/portraits/med/men/88.jpg'),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 1.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.attachment),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text('กหดกหดหดกหดกหดห'),
                  ],
                ),
              )
            ],
          ),
        ),
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
