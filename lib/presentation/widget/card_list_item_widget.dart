import 'package:flutter/material.dart';

class CardListItemWidget extends StatelessWidget {
  const CardListItemWidget({
    super.key,
    required this.title,
    required this.image,
     this.onTap,
  });

  final String title;
  final ImageProvider image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8),
    child: GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        clipBehavior: Clip.hardEdge,
        elevation: 5,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: image,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).canvasColor,
                  fontSize: 20,
                  shadows: [
                    Shadow(
                      color: Theme.of(context).secondaryHeaderColor,
                      offset: Offset(1, 1),
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
