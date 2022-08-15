import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WatchlistButtonWidget extends StatefulWidget {
  final Color color;
  final bool isSaved;
  final VoidCallback onPressed;
  WatchlistButtonWidget({
    Key? key,
    required this.color,
    required this.isSaved,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<WatchlistButtonWidget> createState() => _WatchlistButtonWidgetState();
}

class _WatchlistButtonWidgetState extends State<WatchlistButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        icon: Icon(FontAwesomeIcons.solidBookmark, color: widget.color),
        onPressed: widget.onPressed,
    );
  }
}
