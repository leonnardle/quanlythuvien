
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thuctap/bloc/Regis/regis_event.dart';
import 'package:thuctap/bloc/Regis/regis_state.dart';

class RegisBloc extends Bloc<RegisEvent, RegisState> {
  RegisBloc() : super(RegisInitial());

  Stream<RegisState> mapEventToState(RegisEvent event) async* {
    if (event is RegisButtonPressed) {
      yield RegisLoading();
      try {
        await Future.delayed(Duration(seconds: 2)); 
        yield RegisSuccess();
      } catch (error) {
        yield RegisFailure(error: error.toString());
      }
    }
  }
}