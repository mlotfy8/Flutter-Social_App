import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/Widgets/react.dart';
import 'package:social_app/Widgets/updateProfileState.dart';
import 'HasBackTitle.dart';
import 'customeCircleAvatar.dart';
import 'customeRow.dart';
import 'hasProfileTitle.dart';

class UpgateBackState extends StatelessWidget {
  const UpgateBackState(
      {super.key, required this.index, required this.snapshot});

  final snapshot, index;

  @override
  Widget build(BuildContext context) {
    return snapshot.data!.docs[index].get('postState') == 'updateBack'
        ? Column(
            children: [
              customeRow(
                index: index,
                snapshot: snapshot,
                text: 'update his backgroun picture',
              ),
              hasBackTitle(snapshot: snapshot, index: index)
            ],
          )
        : updateProfileState(
            snapshot: snapshot,
            index: index,
          );
  }
}








