import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'home_loading_tile.dart';

class HomeLoadingWidget extends StatelessWidget {
  const HomeLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      enabled: true,
      child:
          //  height: (MediaQuery.of(context).size.height * .77) - kToolbarHeight,
          ListView.separated(
        shrinkWrap: true,
        addAutomaticKeepAlives: false,
        physics: NeverScrollableScrollPhysics(),
        padding:
            const EdgeInsets.only(left: 8, right: 8, top: 16),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) => HomeLoadingTile(),
        separatorBuilder: (context, index) => Divider(height: 12),
      ),
    );
  }
}
