import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:project_inventory/models/item.dart';
import 'package:project_inventory/screens/menu.dart';
import 'package:project_inventory/widgets/left_drawer.dart';
import 'package:provider/provider.dart';

class ItemDetailPage extends StatelessWidget {
  final Item item;

  // Constructor to receive item data
  ItemDetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Detail'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Display Item Name
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                item.fields.name,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            Text("${item.fields.amount}", style: TextStyle(fontSize: 16.0)),
            // Display Item Description
            Text(item.fields.description, style: TextStyle(fontSize: 16.0)),

            // Add a button to go back to the list page
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the list page
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}