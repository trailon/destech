import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_all_in_one/bloc/readlist_bloc.dart';
import 'package:flutter_all_in_one/constants/skeletons.dart';
import 'package:flutter_all_in_one/models/booklistmodel.dart';
import 'package:flutter_all_in_one/pages/bookitemwidgets.dart/bookitems.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReadListProvider extends StatelessWidget {
  const ReadListProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ReadlistBloc(), child: const ReadListBuilder());
  }
}

class ReadListBuilder extends StatefulWidget {
  const ReadListBuilder({Key? key}) : super(key: key);
  @override
  State<ReadListBuilder> createState() => _ReadListBuilderState();
}

class _ReadListBuilderState extends State<ReadListBuilder> {
  late List<Book> books;
  IconData _icon = Icons.list_alt;
  int listingType = 0;
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<ReadlistBloc>(context).add(GetReadList());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadlistBloc, ReadlistState>(
      builder: (context, state) {
        if (state is ReadlistInitial) {
          return const Center(child: ListViewPlaceHolder());
        } else if (state is ReadlistLoading) {
          return const Center(child: ListViewPlaceHolder());
        } else if (state is ReadlistLoaded) {
          return Column(
            children: [
              ElevatedButton.icon(
                  style: Theme.of(context).elevatedButtonTheme.style,
                  onPressed: () {
                    setState(() {
                      _icon =
                          _icon == Icons.list_alt ? Icons.apps : Icons.list_alt;
                      listingType = listingType == 0 ? 1 : 0;
                    });
                  },
                  icon: Icon(_icon),
                  label: const AutoSizeText("Change View")),
              ReadListView(state: state, listingType: listingType),
            ],
          );
        } else {
          return Center(child: Text((state as ReadlistError).message!));
        }
      },
    );
  }
}

class ReadListView extends StatefulWidget {
  ReadListView({Key? key, required this.state, required this.listingType})
      : super(key: key);
  ReadlistLoaded state;
  int listingType;
  @override
  State<ReadListView> createState() => _ReadListViewState();
}

class _ReadListViewState extends State<ReadListView> {
  @override
  void dispose() {
    super.dispose();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      SharedPreferences.getInstance().then((sharedPreferences) {
        List<String> reorderedReadList = [];
        for (Book book in widget.state.readlistModel) {
          reorderedReadList.add(jsonEncode(book));
        }
        sharedPreferences.setStringList('favorites', reorderedReadList);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReorderableListView(
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            final Book item = widget.state.readlistModel.removeAt(oldIndex);
            widget.state.readlistModel.insert(newIndex, item);
          });
        },
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: widget.state.readlistModel.map((book) {
          return Slidable(
              key: ValueKey(book),
              endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  dismissible: DismissiblePane(
                      key: ValueKey(book),
                      onDismissed: () {
                        widget.state.readlistModel.remove(book);
                      }),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        setState(() {
                          widget.state.readlistModel.remove(book);
                        });
                      },
                      backgroundColor: const Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ]),
              child: widget.listingType == 0
                  ? BookCard(book: book, icon: Icons.delete)
                  : BookPoster(book: book));
        }).toList(),
      ),
    );
  }
}
