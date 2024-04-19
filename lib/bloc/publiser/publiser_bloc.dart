import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thuctap/bloc/publiser/publiser_event.dart';
import 'package:thuctap/bloc/publiser/publiser_state.dart';

import 'package:thuctap/model/Publisher.dart';

class PublisherBloc extends Bloc<PublisherEvent, PublisherState> {
  PublisherBloc() : super(PublisherInitial());

  Stream<PublisherState> mapEventToState(PublisherEvent event) async* {

  }
  
  void deletePublisher(String id) {}
  void addPublisher(Publisher publisher) {}
  void editPublisher(String id) {}
  
}

