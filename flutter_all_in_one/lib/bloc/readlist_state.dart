part of 'readlist_bloc.dart';

abstract class ReadlistState extends Equatable {
  const ReadlistState();
  
  @override
  List<Object> get props => [];
}

class ReadlistInitial extends ReadlistState {}


class ReadlistLoading extends ReadlistState {}

class ReadlistLoaded extends ReadlistState {
  final List<Book> readlistModel;
  const ReadlistLoaded(this.readlistModel);
}

class ReadlistError extends ReadlistState {
  final String? message;
  const ReadlistError(this.message);
}