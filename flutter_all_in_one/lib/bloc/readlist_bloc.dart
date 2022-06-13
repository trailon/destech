import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_all_in_one/models/booklistmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'readlist_event.dart';
part 'readlist_state.dart';

class ReadlistBloc extends Bloc<ReadlistEvent, ReadlistState> {
  ReadlistBloc() : super(ReadlistInitial()) {
    on<GetReadList>((event, emit) async {
      try {
        emit(ReadlistLoading());
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        List<String> booksAsStrings =
            sharedPreferences.getStringList('favorites')!;
        List<Book> books = [];
        for (String bookString in booksAsStrings) {
          books.add(Book.fromJson(jsonDecode(bookString)));
        }
        emit(ReadlistLoaded(books));
      } catch (e) {
        emit(const ReadlistError("Okuma Listesi Yüklenirken Bir Hata Oluştu"));
      }
    });
  }
}
