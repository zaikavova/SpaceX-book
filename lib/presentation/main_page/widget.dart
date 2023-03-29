import 'package:flutter/material.dart';
import 'package:space_x_book/presentation/widget/card_list_item_widget.dart';
import 'package:space_x_book/routing/index.dart';

import '../../gen/assets.gen.dart';
import '../../generated/l10n.dart';
import '../../injection_container.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final router = sl<AppRouter>();

  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.mainTitle),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CardListItemWidget(
            title: strings.dragonsChapterTitle,
            image: Image.asset(Assets.images.dragonChapter.path).image,
            onTap: () => router.navigate(DragonsRoute()),
          ),
          CardListItemWidget(
            title: strings.highlightsChapterTitle,
            image: Image.asset(Assets.images.highlightsChapter.path).image,
            onTap: () => router.navigate(HighlightsRoute()),
          ),
        ],
      ),
    );
  }
}
