import 'package:flutter/material.dart';
import 'dart:async';

class BasketballPage extends StatefulWidget {
  const BasketballPage({super.key});

  @override
  State<BasketballPage> createState() => _BasketballPageState();
}

class _BasketballPageState extends State<BasketballPage> {
  int homeScore = 0;
  int awayScore = 0;
  bool isTimerRunning = false;
  int seconds = 2700; // 45 menit dalam detik
  late String timerDisplay;
  Timer? timer;

  final TextEditingController homeTeamController = TextEditingController();
  final TextEditingController awayTeamController = TextEditingController();

  @override
  void initState() {
    super.initState();
    timerDisplay = formatTime(seconds);
  }

  String formatTime(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int secs = totalSeconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}";
  }

  void startTimer() {
    if (!isTimerRunning) {
      setState(() {
        isTimerRunning = true;
      });
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (seconds > 0) {
          setState(() {
            seconds--;
            timerDisplay = formatTime(seconds);
          });
        } else {
          stopTimer();
        }
      });
    }
  }

  void stopTimer() {
    setState(() {
      isTimerRunning = false;
    });
    timer?.cancel();
  }

  void incrementHomeScore() {
    setState(() {
      homeScore++;
    });
  }

  void decrementHomeScore() {
    setState(() {
      if (homeScore > 0) homeScore--;
    });
  }

  void incrementAwayScore() {
    setState(() {
      awayScore++;
    });
  }

  void decrementAwayScore() {
    setState(() {
      if (awayScore > 0) awayScore--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basketball Match"),
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
                image: AssetImage('images/basketball.jpg'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildTeamSection("Home Team", homeTeamController, homeScore, incrementHomeScore, decrementHomeScore),
                const SizedBox(height: 40),
                _buildTeamSection("Away Team", awayTeamController, awayScore, incrementAwayScore, decrementAwayScore),
                const SizedBox(height: 40),
                Center(
                  child: Text(
                    timerDisplay,
                    style: const TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 30),
                _buildControlButtons(),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                    child: const Text(
                      "Save Match",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamSection(String label, TextEditingController controller, int score, VoidCallback increment, VoidCallback decrement) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(color: Colors.white),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 10),
        Text(
          controller.text.isEmpty ? label : controller.text,
          style: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildScoreButton(Icons.remove, decrement, Colors.red),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "$score",
                style: const TextStyle(fontSize: 80, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            _buildScoreButton(Icons.add, increment, Colors.green),
          ],
        ),
      ],
    );
  }

  Widget _buildScoreButton(IconData icon, VoidCallback onPressed, Color color) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
        backgroundColor: color,
      ),
      child: Icon(icon, size: 40, color: Colors.white),
    );
  }

  Widget _buildControlButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: startTimer,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          child: const Text("Start", style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: stopTimer,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: const Text("Stop", style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
      ],
    );
  }
}
