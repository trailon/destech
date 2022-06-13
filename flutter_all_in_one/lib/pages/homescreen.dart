import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/constants/bottomnavigationbarwidget.dart';
import 'package:flutter_all_in_one/cubit/homescreencubt.dart';
import 'package:flutter_all_in_one/cubit/materialappcubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomAppBarCubit(),
      child: const HomeScreenBuilder(),
    );
  }
}

class HomeScreenBuilder extends StatelessWidget {
  const HomeScreenBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<BottomAppBarCubit, Widget>(builder: (context, state) {
          return state;
        }),
        bottomNavigationBar: const MyBottomAppBar(),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.brightness_6_outlined),
            onPressed: () {
              BlocProvider.of<MaterialAppCubit>(context).toggleTheme();
            }),
      ),
    );
  }
}
