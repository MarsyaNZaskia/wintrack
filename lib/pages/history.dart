import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wintrack/models/match_history.dart';

class HistoryPage extends StatelessWidget {
  final List<MatchHistory> matchHistories;

  const HistoryPage({super.key, required this.matchHistories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Match History"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('match_history').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!.docs.map((doc) => MatchHistory.fromJson(doc.data() as Map<String, dynamic>)).toList();

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final match = data[index];
              return ListTile(
                title: Text('${match.homeTeam} vs ${match.awayTeam}'),
                subtitle: Text('Score: ${match.homeScore} - ${match.awayScore}, Time: ${match.matchTime}, Sport: ${match.sportType}'),
              );
            },
          );
        },
      ),
    );
  }
}
