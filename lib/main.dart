import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wintrack/models/match_history.dart';
import 'package:wintrack/pages/soccer.dart';
import 'package:wintrack/pages/volleyball.dart';
import 'package:wintrack/pages/basketball.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAafiSuVzQjCvm3_4SUdvWfIxWTpyFsqbY",
            authDomain: "scoreboard-96e47.firebaseapp.com",
            projectId: "scoreboard-96e47",
            storageBucket: "scoreboard-96e47.firebasestorage.app",
            messagingSenderId: "807218771721",
            appId: "1:807218771721:web:23323829ffa05a6c3445d8",
            measurementId: "G-ZREQHNN6Z1"));
  } else {
    await Firebase.initializeApp();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/soccer': (context) => const SoccerPage(),
        '/volleyball': (context) => const VolleyballPage(),
        '/basketball': (context) => const BasketballPage(),
      },
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    HistoryPage(
      matchHistories: [],
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF77CDFF),
      appBar: AppBar(
        title: const Text("ScoreBoard Apps"),
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, // Change your color here
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      child: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/soccer');
            },
            child: const CustomCard(
              title: 'Soccer Match',
              image: 'images/soccer.jpg',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/volleyball');
            },
            child: const CustomCard(
              title: 'Volleyball Match',
              image: 'images/volleyball.jpg',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/basketball');
            },
            child: const CustomCard(
              title: 'Basketball Match',
              image: 'images/basketball.jpg',
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key, required List<MatchHistory> matchHistories});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'History Page',
        style: TextStyle(fontSize: 24, color: Colors.black),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final String image;

  const CustomCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 25,
                color: Colors.blue[900],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
