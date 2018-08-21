import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kpi/api_provider.dart';

class QofPage extends StatefulWidget {
  @override
  _QofPageState createState() => _QofPageState();
}

class _QofPageState extends State<QofPage> {
  List items = [];
  bool isLoading = true;

  ApiProvider apiProvider = ApiProvider();

  Future fetchQof() async {
    try {
      var response = await apiProvider.getQof();
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print(jsonResponse);
        setState(() {
          isLoading = false;
          items = jsonResponse;
        });
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchQof();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ตัวชี้วัด QOF'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'ตัวชี้วัดคุณภาพการให้บริการ (QOF)',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      var item = items[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 5.0,
                          right: 5.0,
                          top: 5.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: ListTile(
                            title: Text(item['name']),
                            trailing: Icon(Icons.keyboard_arrow_right),
                            leading: CircleAvatar(
                              backgroundColor: Colors.pink,
                              child: Text(item['id']),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: items != null ? items.length : 0,
                  ),
          )
        ],
      ),
    );
  }
}
