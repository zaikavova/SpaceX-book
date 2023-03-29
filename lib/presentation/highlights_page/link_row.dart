import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LinkRow extends StatelessWidget {
  const LinkRow({super.key, required this.iconAssetPath, required this.link});

  final String iconAssetPath;
  final String link;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          iconAssetPath,
          height: 28,
          width: 28,
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: GestureDetector(
            onTap: openLink,
            child: Text(
              link,
              style: TextStyle(color: Theme.of(context).indicatorColor),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }

  void openLink() => launchUrlString(link);
}
