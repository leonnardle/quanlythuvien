abstract class PublisherState{}
class PublisherInitial extends PublisherState {}
class PublisherLoading extends PublisherState{}
class PublisherLoaded extends PublisherState{}
class PublishersLoadError extends PublisherState {
  final String message;

  PublishersLoadError(this.message);
}
