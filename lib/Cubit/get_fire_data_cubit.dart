import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:social_app/constanse.dart';

part 'get_fire_data_state.dart';

class GetFireDataCubit extends Cubit<GetFireDataState> {
  GetFireDataCubit() : super(GetFireDataInitial());


}
