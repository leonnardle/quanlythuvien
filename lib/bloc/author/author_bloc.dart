import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thuctap/bloc/author/author_event.dart';
import 'package:thuctap/bloc/author/author_state.dart';
import 'package:thuctap/model/author.dart';

class AuthorBloc extends Bloc<AuthorEvent, AuthorState> {
  AuthorBloc() : super(AuthorInitial());

  Stream<AuthorState> mapEventToState(AuthorEvent event) async* {

  }
  
  void deleteAuthor(String id) {}
  void addAuthor(Author author) {}
  void editAuthor(String id) {}
  
}