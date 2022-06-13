import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_all_in_one/pages/homescreen.dart';
import 'package:flutter_all_in_one/pages/homescreenwidgets.dart/booklist.dart';
import 'package:flutter_all_in_one/pages/mybooksscreen.dart';
import 'package:flutter_all_in_one/pages/viewbook.dart';

class BottomAppBarCubit extends Cubit<Widget> {
  BottomAppBarCubit() : super(const BookListProvider());

  void navigate(index) {
    switch (index) {
      case 0:
        emit(const BookListProvider());
        break;
      case 1:
        emit(const ReadListProvider());
        break;
      default:
    }
  }
}
