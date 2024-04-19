abstract class AuthorState{}
class AuthorInitial extends AuthorState {}
class AuthorLoading extends AuthorState{}
class AuthorLoaded extends AuthorState{}
class AuthorsLoadError extends AuthorState {
  final String message;

  AuthorsLoadError(this.message);
}
