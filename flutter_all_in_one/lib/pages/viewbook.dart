import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/constants/responsivity.dart';
import 'package:flutter_all_in_one/constants/textstyles.dart';
import 'package:flutter_all_in_one/constants/utilitywidgets.dart';
import 'package:flutter_all_in_one/models/booklistmodel.dart';

class ViewBook extends StatelessWidget {
  ViewBook({Key? key, required this.book}) : super(key: key);
  Book book;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: MQ.h(context) * 0.05),
                  child: AutoSizeText(book.title!,
                      style: TextStyles.title(context), maxLines: 1)),
              UtilityWidgets.textWithIcon(
                  icon: Icons.book,
                  text: "Genre: ${book.genre!}",
                  iconcolor: Colors.brown,
                  style: TextStyles.info(context),
                  maxLine: 1),
              FadeInImage(
                  image: NetworkImage(book.image!),
                  placeholder:
                      const AssetImage('lib/assets/images/placeholder.jpg')),
              AutoSizeText(book.author!,
                  style: TextStyles.subtitle(context), maxLines: 1),
              AutoSizeText("Book Description",
                  style: TextStyles.content(context)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MQ.w(context) * 0.05,
                    vertical: MQ.ar(context) * 10),
                child: AutoSizeText(book.description!,
                    style: TextStyles.content(context)),
              ),
              const Divider(),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: MQ.w(context) * 0.05),
                  child: UtilityWidgets.textWithIcon(
                      icon: Icons.date_range,
                      text: "Published: ${book.published!}",
                      style: TextStyles.info(context),
                      maxLine: 1),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: MQ.w(context) * 0.05),
                  child: UtilityWidgets.textWithIcon(
                      icon: Icons.maps_home_work,
                      text: "Publisher: ${book.publisher!}",
                      style: TextStyles.info(context),
                      maxLine: 1),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: MQ.w(context) * 0.05),
                  child: AutoSizeText("ISBN: ${book.isbn!}",
                      style: TextStyles.content(context), maxLines: 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
