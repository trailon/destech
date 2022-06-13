part of 'booklist_bloc.dart';

@immutable
abstract class BooklistState extends Equatable{
  const BooklistState();

  @override
  List<Object> get props => [];
}

class BooklistInitial extends BooklistState {

}

class BooklistLoading extends BooklistState {

}

class BooklistLoaded extends BooklistState {
  final BookList bookListModel;
  const BooklistLoaded(this.bookListModel);
}

class BooklistError extends BooklistState {
  final String? message;
  const BooklistError(this.message);
}
