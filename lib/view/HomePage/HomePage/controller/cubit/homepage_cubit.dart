import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'homepage_state.dart';

class HomepageCubit extends Cubit<HomepageState> {
  HomepageCubit() : super(HomepageInitial());

  int index = 0;

  changeCurrentIndex(value) {
    index = value;

    emit(ChangeCurrentIndexState());
  }

  getUserToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    tokenValue = pref.getString('token')!;
    print('////////////////////////// >>>>>>>>>> $tokenValue');
    emit(GetToken());
  }
}

String tokenValue = 'null';
