part of 'readlist_bloc.dart';

abstract class ReadlistEvent extends Equatable {
  const ReadlistEvent();

  @override
  List<Object> get props => [];
}

class GetReadList extends ReadlistEvent {}
