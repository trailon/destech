import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_all_in_one/bloc/booklist_bloc.dart';
import 'package:flutter_all_in_one/constants/responsivity.dart';
import 'package:flutter_all_in_one/constants/skeletons.dart';
import 'package:flutter_all_in_one/constants/textstyles.dart';
import 'package:flutter_all_in_one/pages/bookitemwidgets.dart/bookitems.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookListProvider extends StatelessWidget {
  const BookListProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BooklistBloc(),
      child: const BookListBuilder(),
    );
  }
}

class BookListBuilder extends StatefulWidget {
  const BookListBuilder({Key? key}) : super(key: key);

  @override
  State<BookListBuilder> createState() => _BookListBuilderState();
}

class _BookListBuilderState extends State<BookListBuilder> {
  IconData _icon = Icons.list_alt;
  int listingType = 0;
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<BooklistBloc>(context).add(GetBooklist());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooklistBloc, BooklistState>(builder: (context, state) {
      if (state is BooklistInitial) {
        return const Center(child: ListViewPlaceHolder());
      } else if (state is BooklistLoading) {
        return const Center(child: ListViewPlaceHolder());
      } else if (state is BooklistLoaded) {
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
            BookListView(state: state, listingType: listingType),
          ],
        );
      } else {
        return const Center(
          child: Text("An Error Occured"),
        );
      }
    });
  }
}

class BookListView extends StatelessWidget {
  BookListView({Key? key, required this.state, required this.listingType})
      : super(key: key);
  BooklistLoaded state;
  int listingType;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: state.bookListModel.data!.map((book) {
          return listingType == 0
              ? BookCard(book: book,icon: Icons.add,)
              : BookPoster(book: book);
        }).toList(),
      ),
    );
  }
}
