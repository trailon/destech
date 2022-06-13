import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_all_in_one/db/requests.dart';
import 'package:flutter_all_in_one/models/booklistmodel.dart';
import 'package:meta/meta.dart';

part 'booklist_event.dart';
part 'booklist_state.dart';

class BooklistBloc extends Bloc<BooklistEvent, BooklistState> {
  BooklistBloc() : super(BooklistInitial()) {
    on<GetBooklist>((event, emit) async {
      emit(BooklistLoading());
      try {
        final bookList = await Requests.getBookList();
        emit(BooklistLoaded(bookList));
      } catch (e) {
        emit(const BooklistError("Kitap Listesi Yüklenirken Bir Hata Oluştu"));
      }
    });
  }
}

class BooklistCubit extends Cubit<BooklistState> {
  BooklistCubit() : super(BooklistInitial());

  void trytogetdata() async{
     emit(BooklistLoading());
      try {
        final bookList = await Requests.getBookList();
        await Future.delayed(const Duration(seconds: 2));
        emit(BooklistLoaded(bookList));
      } catch (e) {
        emit(const BooklistError("Kitap Listesi Yüklenirken Bir Hata Oluştu"));
      }
  }
}
