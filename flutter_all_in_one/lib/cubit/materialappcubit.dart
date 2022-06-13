import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class MaterialAppCubit extends Cubit<ThemeData> {
  MaterialAppCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
      bottomAppBarColor: Colors.amber,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.amber),
        foregroundColor: MaterialStateProperty.all(Colors.black),
      )),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
      ),
      brightness: Brightness.light,
      fontFamily: 'Regular');

  static final _darkTheme = ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
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
