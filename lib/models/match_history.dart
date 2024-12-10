class MatchHistory {
  final String homeTeam;
  final String awayTeam;
  final int homeScore;
  final int awayScore;
  final String matchTime;
  final String sportType;

  MatchHistory({
    required this.homeTeam,
    required this.awayTeam,
    required this.homeScore,
    required this.awayScore,
    required this.matchTime,
    required this.sportType,
  });

  Map<String, dynamic> toJson() {
    return {
      'home_team': homeTeam,
      'away_team': awayTeam,
      'home_score': homeScore,
      'away_score': awayScore,
      'match_time': matchTime,
      'sport_type': sportType,
    };
  }

  factory MatchHistory.fromJson(Map<String, dynamic> json) {
    return MatchHistory(
      homeTeam: json['home_team'],
      awayTeam: json['away_team'],
      homeScore: json['home_score'],
      awayScore: json['away_score'],
      matchTime: json['match_time'],
      sportType: json['sport_type'],
    );
  }
}
