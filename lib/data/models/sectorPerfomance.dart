class SectorPerformance {
  final List<SingleSectorPerformance> sectors;

  SectorPerformance({required this.sectors});

  factory SectorPerformance.fromJson(Map<String, dynamic> json) {
    return SectorPerformance(
        sectors: json.entries
            .map((entry) =>
                SingleSectorPerformance(change: entry.value, name: entry.key))
            .toList());
  }
}

class SingleSectorPerformance {
  final String name;
  final String change;

  SingleSectorPerformance({required this.name, required this.change});


  
}
