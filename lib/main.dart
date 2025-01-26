import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = ColorScheme(
      primary: const Color.fromARGB(255, 226, 218, 218),
      secondary: const Color.fromARGB(255, 69, 70, 70),
      surface: const Color.fromARGB(224, 16, 5, 77),
      error: Colors.red,
      onPrimary: const Color.fromARGB(255, 13, 13, 13),
      onSecondary: const Color.fromARGB(255, 41, 41, 42),
      onSurface: const Color.fromARGB(255, 225, 224, 245),
      onError: Colors.white,
      brightness: Brightness.light,
    );

    final ThemeData theme = ThemeData(
      colorScheme: colorScheme,
      primaryColor: colorScheme.primary,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSecondary,
        backgroundColor: colorScheme.onSurface,
      ),
    );

    return MaterialApp(
      theme: theme,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: [
          PostItPicturesPage(), // Home page with Post-it pictures
          SkemaSide(), // Skema page
          Placeholder(), // Studieretninger side
          Placeholder(), // Social media side
          // Add other pages here
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Skema',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Studieretninger',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.interests_sharp),
            label: 'Social',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
    );
  }
}

class SkemaSide extends StatelessWidget {
  const SkemaSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skema'),
        centerTitle: true,
      ),
      body: PageView(
        children: [
          ScheduleView(
            schedule: '1g-Klasse',
            timeSlots: [
              '08:15 - 09:45: Matematik',
              '10:00 - 11:30: Engelsk',
              '12:45 - 14:15: Biologi',
              '14:30 - 16:00: Dansk',
            ],
          ),
          ScheduleView(
            schedule: '2g-Klasse',
            timeSlots: [
              '08:15 - 09:45: Fysik',
              '10:00 - 11:30: Kemi',
              '12:45 - 14:15: Idehistroie',
            ],
          ),
          ScheduleView(
            schedule: '3g-Klasse',
            timeSlots: [
              '10:00 - 11:30: Valgfag',
              '12:45 - 14:15: Matematik',
              '14:30 - 16:00: Kemi',
            ],
          ),
        ],
      ),
    );
  }
}

class ScheduleView extends StatelessWidget {
  final String schedule;
  final List<String> timeSlots;

  const ScheduleView(
      {super.key, required this.schedule, required this.timeSlots});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            schedule,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 20),
          ...timeSlots.map((timeSlot) =>
              Text(timeSlot, style: Theme.of(context).textTheme.bodyMedium)),
        ],
      ),
    );
  }
}

class PostItPicturesPage extends StatelessWidget {
  const PostItPicturesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of image paths
    final List<String> images = [
      'assets/images/metal.png',
      'assets/images/skate.png',
      'assets/images/celle.png',
      'assets/images/aften.png',
      'assets/images/fest.png',
      // Add more image paths as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('SUKKERTOPPEN'),
            Text('Opslagstavle',
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(images[index]),
          );
        },
      ),
    );
  }
}
