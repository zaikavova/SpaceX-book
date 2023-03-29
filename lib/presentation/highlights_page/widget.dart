import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x_book/generated/l10n.dart';
import 'package:space_x_book/injection_container.dart';
import 'package:space_x_book/presentation/highlights_page/highlight_list_item.dart';

import 'index.dart';

class HighlightsPage extends StatefulWidget {
  @override
  State<HighlightsPage> createState() => _HighlightsPageState();
}

class _HighlightsPageState extends State<HighlightsPage> {
  late final HighlightsBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = sl<HighlightsBloc>();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).highlightsTitle),
        ),
        body: BlocConsumer<HighlightsBloc, HighlightsState>(
          bloc: _bloc,
          listener: _errorsListener,
          builder: (BuildContext context, HighlightsState state) {
            if (state.isLoading) {
              return Center(
                child: SizedBox(
                  child: CircularProgressIndicator(),
                  height: 40,
                  width: 40,
                ),
              );
            } else {
              final items = state.items;
              if (items != null && (items.isNotEmpty )) {
                return ListView.builder(
                  itemCount: state.items?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) =>
                      HighlightListItem(
                    item: items[index],
                  ),
                );
              } else {
                return Center(
                  child: Text(S.of(context).nothingToShow),
                );
              }
            }
          },
        ),
      );

  void _errorsListener(BuildContext _, HighlightsState state) {
    final error = state.error;
    if (error != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error)));
    }
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}
