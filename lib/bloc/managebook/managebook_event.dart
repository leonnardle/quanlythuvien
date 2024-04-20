

import '../../model/book.dart';

abstract class ManageBookEvent{}
class AddBookButtonPress extends ManageBookEvent{}
class DeleteBookButtonPress extends ManageBookEvent{}
class EditBookButtonButtonPress extends ManageBookEvent{
  final Book book;

  EditBookButtonButtonPress({required this.book});
  Book get getBook => book;

}
class FetchListBook extends ManageBookEvent{}

