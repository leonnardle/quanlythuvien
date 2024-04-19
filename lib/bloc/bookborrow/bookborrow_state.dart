abstract class BookBorrowState{}
class BookBorrowInitial extends BookBorrowState {}
class BookBorrowLoading extends BookBorrowState{}
class BookBorrowLoaded extends BookBorrowState{}
class BookBorrowsLoadError extends BookBorrowState {
  final String message;

  BookBorrowsLoadError(this.message);
}
