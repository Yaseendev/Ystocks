import 'package:flutter/material.dart';

class SearchLoadingTile extends StatelessWidget {
  const SearchLoadingTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          //borderRadius: kSharpBorder,
          color: Colors.grey,
        ),
        //width: 5.5,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        child: Text(''),
      ),
      title: Container(
        decoration: BoxDecoration(
          //borderRadius: kSharpBorder,
          color: Colors.grey,
        ),
        //width: 5.5,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(''),
      ),
    );
  }
}
