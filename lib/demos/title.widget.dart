import 'package:flutter/material.dart';
import 'package:pilbear_app/theme.dart';

Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Hello World',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              'Hahahaha',
              style: TextStyle(color: PilbearColors.primaryColor),
            )
          ],
        ),
      ),
      Icon(
        Icons.star,
        color: PilbearColors.primaryColor,
      ),
      Text('41')
    ],
  ),
);