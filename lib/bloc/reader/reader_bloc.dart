

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thuctap/bloc/reader/reader_event.dart';
import 'package:thuctap/bloc/reader/reader_state.dart';
import 'package:thuctap/model/reader.dart';

class ReaderBloc extends Bloc<ReaderEvent, ReaderState> {
  ReaderBloc() : super(ReaderInitial());

  Stream<ReaderState> mapEventToState(ReaderEvent event) async* {

  }
  
  void deleteReader(String id) {}
  void addReader(Reader Reader) {}
  void editReader(String id) {}
  
}