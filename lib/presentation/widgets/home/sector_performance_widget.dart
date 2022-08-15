import 'package:flutter/material.dart';
import 'package:stocks_market/data/models/sectorPerfomance.dart';
import 'sector_list_tile.dart';


class SectorPerformanceWidget extends StatelessWidget {
  final SectorPerformance performanceData;

  SectorPerformanceWidget({required this.performanceData});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      addAutomaticKeepAlives: false,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: 16),
      itemCount: performanceData.sectors.length,
      itemBuilder: (BuildContext context, int index) => SectorListTile(
        singleSectorPerformance: performanceData.sectors[index],
      ),
      separatorBuilder: (context, index) => Divider(height: 2),
    );
  }
}
