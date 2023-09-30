import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter/material.dart';
import 'package:social_app/Cubit/get_fire_data_cubit.dart';
import 'package:social_app/Widgets/showModelButtomSheet.dart';
import 'package:social_app/constanse.dart';
import 'package:social_app/main.dart';

class SetBackgroundPic extends StatefulWidget {
  const SetBackgroundPic({super.key});

  @override
  State<SetBackgroundPic> createState() => _SetBackgroundPicState();
}

class _SetBackgroundPicState extends State<SetBackgroundPic> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetFireDataCubit, GetFireDataState>(
      listener: (context, state) {
        if (state is GetbackImage) {
          print('QQQQQQQQQQQQQQQQQQQQQQQQQQQ${BackUrl!.get('back')}');
          print('QQQQQQQQQQQQQQQQQQQQQQQQQQQ${state.BackImage}');
        }
      },
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.black45,
            image: DecorationImage(
                image: NetworkImage('${BackUrl!.get('back')}'),
                fit: BoxFit.fill),
          ),
          width: double.infinity,
          height: 250,
          child: showModelButtomSheet(
            text: 'Chooes Your Back Ground ',stat: 'updateBack',hint: 'say something about picture !',
            url: BackUrl!.get('back'),
            buttonText: 'Back Ground',
          ),
        );
      },
    );
  }
}
