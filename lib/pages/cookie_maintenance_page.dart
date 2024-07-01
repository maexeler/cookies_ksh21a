// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cookies_2024/provider/cookie_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CookieMaintenancePage extends StatelessWidget {
  const CookieMaintenancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cookie maintenance")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _CookieListWidget()),
            _CookieEditWidget(),
          ],
        ),
      ),
    );
  }
}

class _CookieListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cookieList = Provider.of<CookieListProvider>(context).cookies;
    return ListView.builder(
        itemCount: cookieList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cookieList[index].wisdom),
                    Text("- ${cookieList[index].author}")
                  ]),
            ),
          );
        });
  }
}

class _CookieEditWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CookieEditState();
}

class _CookieEditState extends State<_CookieEditWidget> {
  final _formKey = GlobalKey<FormState>();

  final _wisdomController = TextEditingController();
  final _authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _wisdomController,
                decoration: InputDecoration(
                  hintText: 'enter a wisdom',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'A wisdom is needed';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _authorController,
                decoration: InputDecoration(
                  hintText: 'enter an author',
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Provider.of<CookieListProvider>(context, listen: false)
                          .addCookie(
                              _wisdomController.text, _authorController.text);
                      _wisdomController.clear();
                      _authorController.clear();
                    }
                  },
                  child: Text('Create cookie'))
            ],
          ),
        ),
      ),
    );
  }
}
