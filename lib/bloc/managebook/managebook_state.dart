abstract class ManageBookState{}
class ManageBookInitial extends ManageBookState {}
class BookLoading extends ManageBookState{}
class BookLoaded extends ManageBookState{}
class BooksLoadError extends ManageBookState {
  final String message;

  BooksLoadError(this.message);
}
