import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/book.dart';
import 'Managebook_event.dart';
import 'managebook_state.dart';


class ManageBookBloc extends Bloc<ManageBookEvent, ManageBookState> {
  ManageBookBloc() : super(ManageBookInitial());

  Stream<ManageBookState> mapEventToState(ManageBookEvent event) async* {
    if (event is FetchListBook) {
      yield BookLoading();
      try {

        yield BookLoaded();
      } catch (error) {
        yield BooksLoadError( error.toString());

      }
    }
    else if(event is AddBookButtonPress){
      yield BookLoading();
      try{
        //addBook();
      }
      catch(error){
        yield BooksLoadError( error.toString());
      }
    }
    else if(event is DeleteBookButtonPress){
      yield BookLoading();
      try{
        //deleteBook();
      }
      catch(error){
        yield BooksLoadError( error.toString());
      }
    }
    else if(event is EditBookButtonButtonPress){
      yield BookLoading();
      try{

      }
      catch(error){
        yield BooksLoadError( error.toString());
      }
    }

    else{
      yield BookLoading();
      try{
        //editBook();
      }
      catch(error){
        yield BooksLoadError( error.toString());
      }
    }
  }

  void deleteBook(String id) {}
  void addBook(Book book) {}
  Stream<ManageBookState> _mapEditBookButtonButtonPressToState(EditBookButtonButtonPress event) async* {
    try {
      yield BookLoading();

      yield BookLoaded();
    } catch (error) {
      // Nếu có lỗi, gửi trạng thái lỗi
      yield BooksLoadError(error.toString());
    }
  }

}

