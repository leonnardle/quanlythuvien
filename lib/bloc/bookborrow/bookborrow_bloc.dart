import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thuctap/bloc/bookborrow/bookborrow_event.dart';
import 'package:thuctap/bloc/bookborrow/bookborrow_state.dart';
import 'package:thuctap/model/book.dart';

class BookBorrowBloc extends Bloc<BookBorrowEvent, BookBorrowState> {
  BookBorrowBloc() : super(BookBorrowInitial());

  Stream<BookBorrowState> mapEventToState(BookBorrowEvent event) async* {

  }
  
  void deleteBookBorrow(String id) {}
  void addBookBorrow(Book b) {}
  void editBookBorrow(String id) {}
  
}
