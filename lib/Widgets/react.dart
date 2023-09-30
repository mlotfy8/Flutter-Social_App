import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constanse.dart';

class reactcomments extends StatelessWidget {
  const reactcomments({super.key, required this.snapshot, required this.index});

  final snapshot, index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Column(
        children: [
          Divider(),
          Row(children: [
            SizedBox(
              width: w - 340,
            ),
            IconButton(
                onPressed: () {
                  // onlike(id: snapshot.data!.docs[index].id);
                },
                icon: Icon(Icons.recommend)),
            Text(
              'likes',
              style: TextStyle(fontSize: 16),
            ),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.mode_comment_outlined)),
            Text(
              'comments',
              style: TextStyle(fontSize: 16),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.shortcut)),
            Text(
              'share',
              style: TextStyle(fontSize: 16),
            ),
          ]),
        ],
      ),
    );
  }
}