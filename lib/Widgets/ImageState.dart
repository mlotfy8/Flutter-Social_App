import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jiffy/jiffy.dart';
import 'package:social_app/Widgets/imageCintainer.dart';
import 'package:social_app/Widgets/react.dart';
import 'package:social_app/Widgets/tapContainer.dart';
import '../constanse.dart';
import '../main.dart';
import 'HasTitle.dart';
import 'UpdateBackState.dart';

class ImageState extends StatelessWidget {
  final snapshot, index;

  ImageState({super.key, required this.snapshot, required this.index});

  bool islike = false;
  int likes = 0;
  double h = Get.height;
  double w = Get.width;
  var postname;

  @override
  Widget build(BuildContext context) {
    var url;
    Object? postname = name!.get('name');

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(26),
              topLeft: Radius.circular(26),
              bottomRight: Radius.circular(20),
              topRight: Radius.circular(20)),
          color: Colors.black12,
        ),
        margin: EdgeInsets.all(5),
        child: snapshot.data!.docs[index].get('postState') == 'image'
            ? Column(
                children: [
                  SizedBox(
                    height: 60,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              '${snapshot.data!.docs[index].get('profileurl') == null ? '' : snapshot.data!.docs[index].get('profileurl')}',
                            ),
                            radius: 28,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                                child: Row(
                                  children: [
                                    Text(
                                      ' ${snapshot.data!.docs[index].get('name')}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                          fontFamily: 'NotoSerif',
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      width: w - 180,
                                      child: Text(
                                          ' ${snapshot.data!.docs[index].get('location') == null ? 'set a new post' : ' is at ${snapshot.data!.docs[index].get('location')}'}',
                                          style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 13,
                                          )),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                            Icons.keyboard_control_rounded)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: w - 80,
                                height: 13,
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        //
                                        ' ${Jiffy.parse(snapshot.data!.docs[index].get('time')).fromNow()}',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  snapshot.data!.docs[index].get('aboutimage') != ''
                      ? hasTitle(snapshot: snapshot, index: index)
                      : InkWell(
                          onTap: () {
                            Get.defaultDialog(
                                radius: 10,
                                title: '',
                                content: tapContainer(
                                    snapshot: snapshot, index: index));
                          },
                          child:
                              imageContainer(snapshot: snapshot, index: index)),
                  reactcomments(snapshot: snapshot, index: index)
                ],
              )
            : UpgateBackState(
                snapshot: snapshot,
                index: index,
              ));
  }

  onlike({required String id}) async {
    await userPostes.doc('$id').get().then((value) async {
      var numperofLikes = value.get('likes');
      var inemail = value.get('list of likes');
      print('QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ$inemail');

      for (int i = 0; i <= numperofLikes; i++) {
        print('QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ$inemail');

        if (inemail.contains('$email')) {
          print(
              'QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQOLD LIKES$numperofLikes');
          print('QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ$inemail');

          inemail.remove(email);
          print('QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ$inemail');

          await userPostes.doc('$id').update({
            'likes': numperofLikes - 1,
            'list of likes': inemail, // قم بتحديثها بالقائمة الجديدة
          });
        } else if (inemail.isEmpty == true) {
          var numperofLikes = value.get('likes');

          print(
              'QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQOLD LIKES$numperofLikes');
          print('QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ$inemail');
          await userPostes
              .doc('$id')
              .update({'likes': numperofLikes + 1, 'list of likes': email});
        }
      }
    });
  }

/*
  onlike(String id) async {
    bool? updateislike;
    await getuserslikes.add({
      'id': '$id',
      'likes': likes,
      'name': '$postname',
      'imageurl': url,
    });
    await getuserslikes.doc(id).set({
      'id': '$id',
      'likes': likes,
      'name': '$postname',
      'imageurl': url,
    });
    await curentuserpostes.doc(id).update({'id': id});
    await curentuserpostes
        .where('id', isEqualTo: id)
        .get()
        .then((value) => value.docs.forEach((element) {
      setState(() {
        updateislike = element.get('islike');
      });
    }));
    print('=====================================================$updateislike');
    if (updateislike == false) {
      setState(() {
        islike = true;
        likes++;
      });
      print('+++++++++++++++++++++++');
      await curentuserpostes.doc(id).update({'likes': likes, 'islike': islike});
      await getuserslikes.doc('$id').update({
        'likes': likes,
      });
    } else if (updateislike == true) {
      print('-----------------------');
      setState(() {
        islike = false;
        likes--;
      });
      await curentuserpostes.doc(id).update({'likes': likes, 'islike': islike});
      await getuserslikes.doc('$id').update({
        'likes': likes,
      });
    } else {
      return;
    }
    return likes;
  }
 */
}
