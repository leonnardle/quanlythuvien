abstract class ReaderState{}
class ReaderInitial extends ReaderState {}
class ReaderLoading extends ReaderState{}
class ReaderLoaded extends ReaderState{}
class ReadersLoadError extends ReaderState {
  final String message;

  ReadersLoadError(this.message);
}
