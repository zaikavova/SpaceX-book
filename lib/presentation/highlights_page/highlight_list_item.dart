import 'package:flutter/material.dart';
import 'package:space_x_book/gen/assets.gen.dart';

import '../../domain/index.dart';
import 'index.dart';

class HighlightListItem extends StatelessWidget {
  const HighlightListItem({super.key, required this.item});

  // TODO (Volodymyr) extract PM
  final Highlight item;

  @override
  Widget build(BuildContext context) => Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Theme.of(context).dividerColor, width: 2),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 8,
            right: 8,
            top: 8,
            bottom: 4,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(item.title),
              SizedBox(
                height: 4,
              ),
              Text(item.text),
              SizedBox(
                height: 4,
              ),
              if (item.redditLink != null)
                LinkRow(
                  iconAssetPath: Assets.images.redditLogo.path,
                  link: item.redditLink ?? '',
                ),
              if (item.redditLink != null)
                SizedBox(
                  height: 4,
                ),
              if (item.pressLink != null)
                LinkRow(
                  iconAssetPath: Assets.images.pressLogo.path,
                  link: item.pressLink ?? '',
                ),
              if (item.pressLink != null)
                SizedBox(
                  height: 4,
                ),
              if (item.wikiLink != null)
                LinkRow(
                  iconAssetPath: Assets.images.wikiLogo.path,
                  link: item.wikiLink ?? '',
                ),
              if (item.wikiLink != null)
                SizedBox(
                  height: 4,
                ),
            ],
          ),
        ),
      );
}
