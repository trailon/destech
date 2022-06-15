import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class MaterialAppCubit extends Cubit<ThemeData> {
  MaterialAppCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
      bottomAppBarColor: const Color.fromARGB(255, 252, 222, 225),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color(0xFFc94c4c)),
        foregroundColor: MaterialStateProperty.all(Colors.black),
      )),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white, backgroundColor: Color(0xFFc94c4c)),
      brightness: Brightness.light,
      fontFamily: 'Regular');

  static final _darkTheme = ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(ThemeData.dark().bottomAppBarColor),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      )),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.black,
      ),
      brightness: Brightness.dark,
      fontFamily: 'Regular');

  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}
