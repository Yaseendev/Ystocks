import 'package:flutter/material.dart';
import 'package:stocks_market/utils/constants.dart';

class HomeLoadingTile extends StatelessWidget {
  const HomeLoadingTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Container(
        height: 15,
        color: Colors.grey,
      ),
      trailing: Container(
        decoration: BoxDecoration(
          borderRadius: kSharpBorder,
          color: Colors.grey,
        ),
        width: 75.5,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(''),
      ),
    );
  }
}
