import 'package:flutter/material.dart';

class ItemCardListView extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData leading;

  ItemCardListView({
    this.leading,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: leading != null ? Icon(leading) : null,
        title: Text(
          title,
          style: TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
