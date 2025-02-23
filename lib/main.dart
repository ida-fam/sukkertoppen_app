import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Define a global list of course objects
final List<Map<String, dynamic>> courses = [
  {
    'courseName': 'Science Kemi',
    'description':
        'Til dig, der elsker eksperimenter og vil forstå kemiens rolle i verden! På Sukkertoppen kombinerer du matematik og kemi på højt niveau, og får praktisk erfaring med at arbejde med kemiske problemstillinger inden for sundhed, miljø og teknologi.',
    'icon': Icons.science,
  },
  {
    'courseName': 'Science Fysik',
    'description':
        'for dig, der kan lide formler, facts og forsøg. På Sukkertoppen kombinerer vi matematik og fysik med spændende eksperimenter. Perfekt for dig, der vil forstå naturens love og bruge dem i praksis!',
    'icon': Icons.all_inclusive,
  },
  {
    'courseName': 'Science Biologi',
    'description':
        'Er du nysgerrig på, hvordan naturen og mennesket fungerer? På Sukkertoppen kombinerer vi biologi og matematik for at forstå alt fra mikroskopiske livsformer til komplekse økosystemer. Dyk ned i bioteknologi, sundhed og miljø – og se, hvordan biologisk viden anvendes i praksis.',
    'icon': Icons.biotech,
  },
  {
    'courseName': 'Geoscience',
    'description':
        'For dig, der brænder for klima, miljø og en bæredygtig fremtid! På Sukkertoppen udforsker du jordens tilblivelse, naturfænomener og arbejder med geovidenskab gennem både feltture og eksperimenter. Få indsigt i de vigtige processer, der former vores verden.',
    'icon': Icons.public,
  },
  {
    'courseName': 'Arkitektur og Design:',
    'description':
        'For dig, der vil kombinere kreativitet og matematik i arbejdet med design og arkitektur.Her får du mulighed for at udvikle innovative løsninger, fordybe dig i designprocesser og udforske, hvordan matematik kan bruges som et værktøj til at forme fremtidens arkitektur.Bliv en del af et unikt studiemiljø, hvor design og matematik går hånd i hånd.',
    'icon': Icons.architecture,
  },
  {
    'courseName': 'Teknologi  og Design',
    'description':
        'Synes du, det lyder interessant at opfinde og designe løsninger på virkelige problemer? På Sukkertoppen lærer du at udvikle teknologiske produkter og arbejde kreativt med designprocesser – fra idé til færdigt produkt i værkstedet.',
    'icon': Icons.design_services,
  },
  {
    'courseName': 'Kommunikation og IT',
    'description':
        'Brænder du for at bruge kreativitet og IT til at formidle dine ideer? På Sukkertoppen lærer du at kombinere kommunikation, design og teknologi for at skabe effektive løsninger, både digitalt og trykt.',
    'icon': Icons.computer,
  },
  {
    'courseName': 'Computerscience - Programmering',
    'description':
        'Er du nysgerrig på, hvordan computere virker? På Sukkertoppen lærer du at kode, forstå matematikken bag programmering og bygge dine egne programmer. Få praktisk erfaring og bliv skaber af digitale løsninger.',
    'icon': Icons.code,
  },
  {
    'courseName': 'Computerscience - Informatik',
    'description':
        'Er du nysgerrig på, hvordan IT-systemer hænger sammen? På Sukkertoppen lærer du at forstå både hardware og software, og hvordan de arbejder sammen. Få viden og færdigheder til at optimere og udvikle IT-løsninger, der gør en forskel.',
    'icon': Icons.account_tree,
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
      surface: const Color.fromARGB(223, 14, 9, 72),
      error: Colors.red,
      onPrimary: const Color.fromARGB(255, 13, 13, 13),
      onSecondary: const Color.fromRGBO(79, 79, 81, 1),
      onSurface: const Color.fromARGB(255, 204, 204, 214),
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
          LinksSide(), // Social media side
          // Add other pages here
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Hjem',
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
            label: 'Sociale medier',
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

class SkemaSide extends StatefulWidget {
  const SkemaSide({super.key});

  @override
  _SkemaSideState createState() => _SkemaSideState();
}

class _SkemaSideState extends State<SkemaSide> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skema'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              ScheduleView(
                schedule: '1g-Klasse',
                timeSlots: [
                  'Mandag',
                  '08:15 - 09:45: Matematik',
                  '10:00 - 11:30: Engelsk',
                  '12:45 - 14:15: Biologi',
                  '14:30 - 16:00: Dansk',
                ],
              ),
              ScheduleView(
                schedule: '2g-Klasse',
                timeSlots: [
                  'Tirsdag',
                  '08:15 - 09:45: Fysik',
                  '10:00 - 11:30: Kemi',
                  '12:45 - 14:15: Idehistroie',
                ],
              ),
              ScheduleView(
                schedule: '3g-Klasse',
                timeSlots: [
                  'Onsdag',
                  '10:00 - 11:30: Valgfag',
                  '12:45 - 14:15: Matematik',
                  '14:30 - 16:00: Kemi',
                ],
              ),
            ],
          ),
          if (_currentPage > 0)
            Positioned(
              left: 16.0,
              top: MediaQuery.of(context).size.height / 2 - 24,
              child: ArrowIndicator(
                onTap: () {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                icon: Icons.arrow_back,
              ),
            ),
          if (_currentPage < 2) // Assuming there are 3 pages (0, 1, 2)
            Positioned(
              right: 16.0,
              top: MediaQuery.of(context).size.height / 2 - 24,
              child: ArrowIndicator(
                onTap: () {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                icon: Icons.arrow_forward,
              ),
            ),
        ],
      ),
    );
  }
}

class ScheduleView extends StatelessWidget {
  final String schedule;
  final List<String> timeSlots;

  ScheduleView({required this.schedule, required this.timeSlots});

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
          ...timeSlots
              .map((timeSlot) =>
                  Text(timeSlot, style: Theme.of(context).textTheme.bodyMedium))
              .toList(),
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
      'assets/images/Skole.png',
      'assets/images/skate.png',
      'assets/images/celle.png',
      'assets/images/aften.png',
      'assets/images/fest.png',
      'assets/images/metal.png'
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

class StudieretningerSide extends StatefulWidget {
  const StudieretningerSide({super.key});

  @override
  _StudieretningerSideState createState() => _StudieretningerSideState();
}

class _StudieretningerSideState extends State<StudieretningerSide> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Studieretninger'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: courses.map((course) {
              return CourseDescriptionPage(
                courseName: course['courseName']!,
                description: course['description']!,
                icon: course['icon']!,
              );
            }).toList(),
          ),
          if (_currentPage > 0)
            Positioned(
              left: 16.0,
              top: MediaQuery.of(context).size.height / 2 - 24,
              child: ArrowIndicator(
                onTap: () {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                icon: Icons.arrow_back,
              ),
            ),
          if (_currentPage < courses.length - 1)
            Positioned(
              right: 16.0,
              top: MediaQuery.of(context).size.height / 2 - 24,
              child: ArrowIndicator(
                onTap: () {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                icon: Icons.arrow_forward,
              ),
            ),
        ],
      ),
    );
  }
}

class CourseDescriptionPage extends StatelessWidget {
  final String courseName;
  final String description;
  final IconData icon;

  const CourseDescriptionPage({
    super.key,
    required this.courseName,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(courseName),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            description,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 100,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
          // Add more description content here if needed
        ],
      ),
    );
  }
}

class LinksSide extends StatelessWidget {
  final List<Map<String, String>> links = [
    {
      'title': 'Sukkertoppen',
      'url': 'https://www.nextkbh.dk/gymnasier/sukkertoppen-gymnasium/',
      'icon': 'link',
    },
    {
      'title': 'Sukkerbloggen',
      'url': 'https://www.youtube.com/channel/UCuhde7D51gq5tgowxqNIpLA',
      'icon': 'video_library',
    },
    {
      'title': 'Sukkertoppen Instagram',
      'url': 'https://www.instagram.com/sukkertoppengym/',
      'icon': 'photo_camera',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Følg os på de sociale medier'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: links.length,
        itemBuilder: (context, index) {
          final link = links[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Icon(
                  getIconData(link['icon']!),
                  size: 40,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: EdgeInsets.all(16.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViewPage(url: link['url']!),
                        ),
                      );
                    },
                    child: Text(link['title']!),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class WebViewPage extends StatefulWidget {
  final String url;

  WebViewPage({required this.url});

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web View'),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}

class ArrowIndicator extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;

  ArrowIndicator({required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 4, 2, 62).withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}

IconData getIconData(String iconName) {
  switch (iconName) {
    case 'link':
      return Icons.link;
    case 'video_library':
      return Icons.video_library;
    case 'photo_camera':
      return Icons.photo_camera;
    case 'tv':
      return Icons.tv;
    default:
      return Icons.link; // Default icon
  }
}
