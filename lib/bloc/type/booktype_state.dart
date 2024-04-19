abstract class BookTypeState{}
class BookTypeInitial extends BookTypeState {}
class BookTypeLoading extends BookTypeState{}
class BookTypeLoaded extends BookTypeState{}
class BookTypeLoadError extends BookTypeState {
  final String message;

  BookTypeLoadError(this.message);
}
