import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thuctap/bloc/type/booktype_event.dart';
import 'package:thuctap/bloc/type/booktype_state.dart';

class BookTypeBloc extends Bloc<BookTypeEvent, BookTypeState> {
  BookTypeBloc() : super(BookTypeInitial());

  Stream<BookTypeState> mapEventToState(BookTypeEvent event) async* {
    
  }
  
  void deleteBook(String id) {}
  void addBook(Type book) {}
  void editBook(String id) {}

}
