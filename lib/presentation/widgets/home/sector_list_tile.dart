import 'package:flutter/material.dart';
import 'package:stocks_market/data/models/sectorPerfomance.dart';
import 'package:stocks_market/utils/color_helper.dart';
import 'package:stocks_market/utils/constants.dart';

class SectorListTile extends StatefulWidget {
  final SingleSectorPerformance singleSectorPerformance;
  const SectorListTile({
    Key? key,
    required this.singleSectorPerformance,
  }) : super(key: key);

  @override
  State<SectorListTile> createState() => _SectorListTileState();
}

class _SectorListTileState extends State<SectorListTile> {
  late final double change;
  late final double? width;
  late final changeString;
  @override
  void initState() {
    changeString =
        widget.singleSectorPerformance.change.replaceFirst(RegExp('%'), '');
    change = double.parse(changeString);
    width = change > 9.99 ? null : 75.5;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            widget.singleSectorPerformance.name,
            //style: TextStyle(color: AppColors.kLighterGray), //TODO: dark theme support
          ),
          trailing: Container(
            decoration: BoxDecoration(
              borderRadius: kSharpBorder,
              color: determineColorBasedOnChange(change),
            ),
            width: width,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              widget.singleSectorPerformance.change,
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
