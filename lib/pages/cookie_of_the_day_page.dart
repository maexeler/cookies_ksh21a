// ignore_for_file: prefer_const_constructors

import 'package:cookies_2024/model/cookie.dart';
import 'package:cookies_2024/pages/cookie_maintenance_page.dart';
import 'package:cookies_2024/provider/cookie_of_the_day_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CookieOfTheDayPage extends StatelessWidget {
  const CookieOfTheDayPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Do listen for changes so we can redraw
    var cookie = Provider.of<CookieOfTheDayProvider>(context).cookieOfTheDay;
    return Scaffold(
      appBar: AppBar(
        title: Text("Cookie of the Day"),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CookieMaintenancePage()),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _CookieWidget(cookie),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.next_plan),
        onPressed: () => {
          // Do not listen to changes, only for commands, no redraw needed
          Provider.of<CookieOfTheDayProvider>(context, listen: false)
              .createNewCookieOfTheDay(),
        },
      ),
    );
  }
}

class _CookieWidget extends StatelessWidget {
  const _CookieWidget(this._cookie);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _cookie.wisdom,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Text("- ${_cookie.author}"),
      ],
    );
  }

  final Cookie _cookie;
}
