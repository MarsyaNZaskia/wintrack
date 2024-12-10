import 'package:flutter/material.dart';

class VolleyballPage extends StatefulWidget {
  const VolleyballPage({super.key});

  @override
  State<VolleyballPage> createState() => _VolleyballPageState();
}

class _VolleyballPageState extends State<VolleyballPage> {
  int homeScore = 0;
  int awayScore = 0;

  void incrementHomeScore() {
    setState(() {
      homeScore++;
    });
  }

  void incrementAwayScore() {
    setState(() {
      awayScore++;
    });
  }

  void resetHomeScore() {
    setState(() {
      homeScore = 0;
    });
  }

  void resetAwayScore() {
    setState(() {
      awayScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Volleyball Match"),
        backgroundColor: Colors.black,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/volleyball.jpg'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                const Text(
                  "HOME",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: resetHomeScore,
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(12),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.red[900]),
                      child: const Icon(
                        Icons.restart_alt,
                        size: 50,
                      ),
                    ),
                    Text(
                      "$homeScore",
                      style: const TextStyle(fontSize: 150, color: Colors.white),
                    ),
                    ElevatedButton(
                      onPressed: incrementHomeScore,
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(12),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.red[900]),
                      child: const Icon(
                        Icons.add,
                        size: 50,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "AWAY",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: resetAwayScore,
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(12),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.red[900]),
                      child: const Icon(
                        Icons.restart_alt,
                        size: 50,
                      ),
                    ),
                    Text(
                      "$awayScore",
                      style: const TextStyle(fontSize: 150, color: Colors.white),
                    ),
                    ElevatedButton(
                      onPressed: incrementAwayScore,
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(12),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.red[900]),
                      child: const Icon(
                        Icons.add,
                        size: 50,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
