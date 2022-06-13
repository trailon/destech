import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/constants/animations.dart';
import 'package:flutter_all_in_one/constants/responsivity.dart';
import 'package:flutter_all_in_one/constants/tweens.dart';
import 'package:flutter_all_in_one/cubit/homescreencubt.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBottomAppBar extends StatefulWidget {
  const MyBottomAppBar({Key? key}) : super(key: key);
  @override
  State<MyBottomAppBar> createState() => _MyBottomAppBarState();
}

class _MyBottomAppBarState extends State<MyBottomAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;
  int _currentIndex = 0;
  final iconList = <IconData>[Icons.home, Icons.my_library_books_outlined];
  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    curve = Animations.bottomAppBarAnimation(parent: _animationController);
    animation = Tweens.bottomAppBarTween.animate(curve);
    Future.delayed(
      const Duration(seconds: 1),
      () => _animationController.forward(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        icons: iconList,
        activeColor: Theme.of(context).toggleableActiveColor,
        activeIndex: _currentIndex,
        notchAndCornersAnimation: animation,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        gapLocation: GapLocation.none,
        leftCornerRadius: MQ.ar(context) * 70,
        rightCornerRadius: MQ.ar(context) * 70,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          context.read<BottomAppBarCubit>().navigate(index);
        });
  }
}
