part of 'booklist_bloc.dart';

@immutable
abstract class BooklistEvent extends Equatable {
  const BooklistEvent();

  @override
  List<Object> get props => [];
}

class GetBooklist extends BooklistEvent {}
