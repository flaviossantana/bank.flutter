import 'package:flutter/material.dart';

class ItemCardListView extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData leading;
  final Function onTap;

  ItemCardListView({
    this.leading,
    this.title,
    this.subtitle,
    @required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onTap(),
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
