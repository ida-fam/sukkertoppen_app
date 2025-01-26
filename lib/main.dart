import 'package:flutter/material.dart';

// Define a global list of course objects
final List<Map<String, String>> courses = [
  {
    'courseName': 'Science Kemi',
    'description':
        'Til dig, der elsker eksperimenter og vil forstå kemiens rolle i verden! På Sukkertoppen kombinerer du matematik og kemi på højt niveau, og får praktisk erfaring med at arbejde med kemiske problemstillinger inden for sundhed, miljø og teknologi.'
  },
  {
    'courseName': 'Science Fysik',
    'description':
        'for dig, der kan lide formler, facts og forsøg. På Sukkertoppen kombinerer vi matematik og fysik med spændende eksperimenter. Perfekt for dig, der vil forstå naturens love og bruge dem i praksis!'
  },
  {
    'courseName': 'Science Biologi',
    'description':
        'Er du nysgerrig på, hvordan naturen og mennesket fungerer? På Sukkertoppen kombinerer vi biologi og matematik for at forstå alt fra mikroskopiske livsformer til komplekse økosystemer. Dyk ned i bioteknologi, sundhed og miljø – og se, hvordan biologisk viden anvendes i praksis.'
  },
  {
    'courseName': 'Geoscience',
    'description':
        'For dig, der brænder for klima, miljø og en bæredygtig fremtid! På Sukkertoppen udforsker du jordens tilblivelse, naturfænomener og arbejder med geovidenskab gennem både feltture og eksperimenter. Få indsigt i de vigtige processer, der former vores verden.'
  },
  {
    'courseName': 'Arkitektur og Design:',
    'description':
        'For dig, der vil kombinere kreativitet og matematik i arbejdet med design og arkitektur.Her får du mulighed for at udvikle innovative løsninger, fordybe dig i designprocesser og udforske, hvordan matematik kan bruges som et værktøj til at forme fremtidens arkitektur.Bliv en del af et unikt studiemiljø, hvor design og matematik går hånd i hånd.'
  },
  {
    'courseName': 'Teknologi  og Design',
    'description':
        'Synes du, det lyder interessant at opfinde og designe løsninger på virkelige problemer? På Sukkertoppen lærer du at udvikle teknologiske produkter og arbejde kreativt med designprocesser – fra idé til færdigt produkt i værkstedet.'
  },
  {
    'courseName': 'Kommunikation og IT',
    'description':
        'Brænder du for at bruge kreativitet og IT til at formidle dine ideer? På Sukkertoppen lærer du at kombinere kommunikation, design og teknologi for at skabe effektive løsninger, både digitalt og trykt.'
  },
  {
    'courseName': 'Computerscience - Programmering',
    'description':
        'Er du nysgerrig på, hvordan computere virker? På Sukkertoppen lærer du at kode, forstå matematikken bag programmering og bygge dine egne programmer. Få praktisk erfaring og bliv skaber af digitale løsninger.'
  },
  {
    'courseName': 'Computerscience - Informatik',
    'description':
        'Er du nysgerrig på, hvordan IT-systemer hænger sammen? På Sukkertoppen lærer du at forstå både hardware og software, og hvordan de arbejder sammen. Få viden og færdigheder til at optimere og udvikle IT-løsninger, der gør en forskel.'
  },
];

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
          StudieretningerSide(), // Studieretninger side
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

class StudieretningerSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Studieretninger'),
      ),
      body: PageView(
        children: courses.map((course) {
          return CourseDescriptionPage(
            courseName: course['courseName']!,
            description: course['description']!,
          );
        }).toList(),
      ),
    );
  }
}

class CourseDescriptionPage extends StatelessWidget {
  final String courseName;
  final String description;

  CourseDescriptionPage({required this.courseName, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(courseName),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            description,
            style: TextStyle(fontSize: 18),
          ),
          // Add more description content here if needed
        ],
      ),
    );
  }
}
