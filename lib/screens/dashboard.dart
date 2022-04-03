import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:web_api/functions/functions.dart';
import 'package:web_api/screens/contacts_list.dart';
import 'package:web_api/widget/custom_padding.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double scale = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          Container(
            height: 100 * scale,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CustomPadding(
                  label: 'Transfer',
                  icon: Icons.monetization_on,
                  function: () => navigateTo<ContactsList, Void>(
                      context: context, widget: ContactsList()),
                ),
                CustomPadding(
                  label: 'Transaction feed',
                  icon: Icons.monetization_on,
                  function: () => navigateTo<ContactsList, Void>(
                      context: context, widget: ContactsList()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
