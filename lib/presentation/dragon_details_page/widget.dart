import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:space_x_book/domain/index.dart';

class DragonDetailsPage extends StatelessWidget {
  const DragonDetailsPage({super.key, required this.dragon});

  //TODO(Volodymyr) extract PM
  final Dragon dragon;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(dragon.name),
        ),
        body: ListView(
          children: [
            ...dragon.photos
                .map(
                  (String link) => Card(
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: link,
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      );
}
