import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/constants/responsivity.dart';
import 'package:flutter_all_in_one/constants/textstyles.dart';
import 'package:flutter_all_in_one/constants/utilitywidgets.dart';
import 'package:flutter_all_in_one/models/booklistmodel.dart';
import 'package:flutter_all_in_one/pages/viewbook.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookCard extends StatelessWidget {
  BookCard({Key? key, required this.book, required this.icon})
      : super(key: key);
  Book book;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    var fadeInImage = FadeInImage(
      width: (kIsWeb) ? 200 : null,
      fadeInCurve: Curves.bounceIn,
      fadeOutCurve: Curves.bounceOut,
      fadeInDuration: const Duration(milliseconds: 500),
      fadeOutDuration: const Duration(milliseconds: 500),
      fit: BoxFit.contain,
      excludeFromSemantics: true,
      placeholderFit: BoxFit.contain,
      alignment: Alignment.bottomCenter,
      image: NetworkImage(book.image!, scale: 2),
      placeholder: const AssetImage('lib/assets/images/placeholder.jpg'),
    );
    return Padding(
      padding: (kIsWeb)
          ? EdgeInsets.symmetric(
              vertical: MQ.h(context) * 0.001, horizontal: MQ.w(context) * 0.15)
          : const EdgeInsets.all(0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        child: ListTile(
          minLeadingWidth: (kIsWeb) ? MQ.w(context) * 0.075 : null,
          onTap: () {
            context.router.pushWidget(ViewBook(book: book));
          },
          leading: (kIsWeb)
              ? transformCardImage(child: fadeInImage)
              : CircleAvatar(
                  radius: 30,
                  backgroundImage: Image.network(book.image!,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset('lib/assets/images/placeholder.jpg'))
                      .image),
          title: AutoSizeText(book.title!,
              style: TextStyles.custom(
                  context: context, size: 35, weight: FontWeight.bold)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              UtilityWidgets.textWithIcon(
                  icon: Icons.person_pin,
                  text: "Author: ${book.author!}",
                  /* iconcolor: Theme.of(context).brightness == Brightness.dark
                      ? null
                      : Colors.red.shade200, */
                  style: TextStyles.custom(
                      context: context, size: 30, weight: FontWeight.w400)),
              UtilityWidgets.textWithIcon(
                  icon: Icons.book,
                  text: "Genre: ${book.genre!}",
                  /* iconcolor: Theme.of(context).brightness == Brightness.dark
                      ? null
                      : Colors.brown.shade400, */
                  style: TextStyles.custom(
                      context: context, size: 30, weight: FontWeight.w400)),
              UtilityWidgets.textWithIcon(
                  icon: Icons.date_range,
                  text: "Published: ${book.published!}",
                  /* iconcolor: Theme.of(context).brightness == Brightness.dark
                      ? null
                      : Colors.red.shade300, */
                  style: TextStyles.custom(
                      context: context, size: 30, weight: FontWeight.w400),
                  maxLine: 1),
            ],
          ),
          trailing: (icon == Icons.add)
              ? InkWell(
                  onTap: () async {
                    SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    if (sharedPreferences.containsKey('favorites')) {
                      List<String> favoriteList =
                          sharedPreferences.getStringList('favorites')!;
                      if (!favoriteList.contains(jsonEncode(book.toJson()))) {
                        favoriteList.add(jsonEncode(book.toJson()));
                        sharedPreferences.setStringList(
                            'favorites', favoriteList);
                        EasyLoading.showToast('Added to Favorites',
                            duration: const Duration(seconds: 1));
                      } else {
                        EasyLoading.showToast('Already in Favorites',
                            duration: const Duration(seconds: 1));
                      }
                    }
                  },
                  child: Icon(icon))
              : null,
        ),
      ),
    );
  }

  Transform transformCardImage({required child}) {
    return Transform.translate(
      offset: const Offset(0, 35),
      child: Transform.scale(
        scale: 2.5,
        child: child,
      ),
    );
  }
}

class BookPoster extends StatelessWidget {
  BookPoster({Key? key, required this.book}) : super(key: key);
  Book book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (kIsWeb)
          ? EdgeInsets.symmetric(
              horizontal: MQ.w(context) * 0.15, vertical: MQ.h(context) * 0.01)
          : EdgeInsets.only(bottom: MQ.h(context) * 0.05),
      child: InkWell(
        onTap: () {
          context.router.pushWidget(ViewBook(book: book));
        },
        child: Card(
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0XFFEEA29A), width: 2.5),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
              gradient: const LinearGradient(
                stops: [0.05, 0.1, 1.0],
                colors: [
                  Color.fromARGB(255, 85, 58, 52),
                  Color.fromARGB(255, 77, 47, 47),
                  Color.fromARGB(153, 147, 67, 55)
                ],
                begin: Alignment.topLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  AutoSizeText(book.title!,
                      style: TextStyles.title(context), maxLines: 1),
                  Icon(Icons.bookmark, color: Colors.red.shade100)
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: MQ.w(context) * 0.05),
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16)),
                        child: FadeInImage(
                          fit: BoxFit.contain,
                          image: NetworkImage(book.image!, scale: 2),
                          placeholder: Image.asset(
                                  'lib/assets/images/placeholder.jpg',
                                  fit: BoxFit.contain)
                              .image,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: MQ.w(context) * 0.05),
                      child: Icon(
                        Icons.radio_button_checked,
                        color: Colors.grey.shade200,
                      ),
                    )
                  ],
                ),
                AutoSizeText(book.author!,
                    style: TextStyles.subtitle(context), maxLines: 1),
                Column(
                  children: [
                    AutoSizeText("Genre: ${book.genre!}",
                        style: TextStyles.info(context), maxLines: 1),
                    AutoSizeText("Published: ${book.published!}",
                        style: TextStyles.info(context), maxLines: 1)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
