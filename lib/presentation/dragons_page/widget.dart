import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x_book/domain/index.dart';
import 'package:space_x_book/gen/assets.gen.dart';
import 'package:space_x_book/generated/l10n.dart';
import 'package:space_x_book/injection_container.dart';
import 'package:space_x_book/presentation/dragons_page/bloc/index.dart';
import 'package:space_x_book/presentation/widget/card_list_item_widget.dart';
import 'package:space_x_book/routing/index.dart';

@RoutePage()
class DragonsPage extends StatefulWidget {
  @override
  State<DragonsPage> createState() => _DragonsPageState();
}

class _DragonsPageState extends State<DragonsPage> {
  late final DragonsBloc _bloc = sl<DragonsBloc>();
  late final AppRouter _router = sl<AppRouter>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).dragonsTitle),
        ),
        body: BlocConsumer<DragonsBloc, DragonsState>(
          bloc: _bloc,
          listener: _errorsListener,
          builder: (BuildContext context, DragonsState state) {
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
              if (items != null && (items.isNotEmpty)) {
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) =>
                      CardListItemWidget(
                    title: items[index].name,
                    image: items[index].photos.isNotEmpty
                        ? CachedNetworkImageProvider(
                            state.items?[index].photos.first ?? '',
                          )
                        : Image.asset(Assets.images.spacexLogo.path).image,
                    onTap: () => _openDragonDetails(items[index]),
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

  void _errorsListener(BuildContext _, DragonsState state) {
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

  void _openDragonDetails(Dragon dragon) => _router.navigate(
        DragonDetailsRoute(dragon: dragon),
      );
}
