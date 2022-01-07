// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class se extends StatefulWidget {
  const se({Key? key}) : super(key: key);

  @override
  _seState createState() => _seState();
}

class _seState extends State<se> {
  @override
  Widget build(BuildContext context) {
    print('Good !!!');
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        color: Colors.green,
        child: Column(
          children: [
            Slidable(
              actionPane: const SlidableDrawerActionPane(),
              child: Card(
                child: Container(
                  child: const Text(
                    'ahmed',
                    style: TextStyle(fontSize: 50),
                    textDirection: TextDirection.ltr,
                  ),
                  color: Colors.blue,
                ),
              ),
              actions: const [
                Card(
                  child: IconSlideAction(
                    caption: 'Archive',
                    color: Colors.red,
                    icon: Icons.archive,
                    // onTap: () => _showSnackBar('Archive'),
                  ),
                ),
                Card(
                  child: IconSlideAction(
                    caption: '99999',
                    color: Colors.red,
                    icon: Icons.archive,
                    // onTap: () => _showSnackBar('Archive'),
                  ),
                ),
              ],
            ),
            Slidable(
              actionPane: const SlidableDrawerActionPane(),
              child: Container(
                child: const Text(
                  'ahmed',
                  style: TextStyle(fontSize: 50),
                  textDirection: TextDirection.ltr,
                ),
                color: Colors.blue,
              ),
              actions: const [
                IconSlideAction(
                  caption: 'Archive',
                  color: Colors.red,
                  icon: Icons.archive,
                  // onTap: () => _showSnackBar('Archive'),
                ),
                IconSlideAction(
                  caption: '99999',
                  color: Colors.red,
                  icon: Icons.archive,
                  // onTap: () => _showSnackBar('Archive'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
