import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/Widgets/showModelButtomSheet.dart';
import 'package:social_app/main.dart';

class updateProfile extends StatelessWidget {
  updateProfile({super.key});

  TextEditingController mind = TextEditingController();
  GlobalKey<FormState> form = new GlobalKey<FormState>();
  var imagepostname, image;

  @override
  Widget build(BuildContext context) {
    File file;
    Object? username = name!.get('name');
    return showModelButtomSheet(
      text: 'Chooes Your Profile Profile',
      buttonText: 'Profile',
      stat: 'updateProfile',hint: 'say something about picture !',
      url: ProfileUrl!.get('url'),
    );
  }
}
