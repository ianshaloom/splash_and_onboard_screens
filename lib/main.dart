import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'page.three.dart';
import 'page_one.dart';
import 'page_two.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({super.key, required this.showHome});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash and',
      theme: ThemeData(
        colorSchemeSeed: Colors.deepOrange,
        useMaterial3: true,
        //brightness: Brightness.dark,
      ),
      home: showHome ? const AuthPage() : const OnBoardPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  final PageController _controller = PageController();
  bool isLastIndex = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: _controller,
          onPageChanged: (value) {
            setState(() => isLastIndex = value == 2);
          },
          children: const [
            PageOne(),
            PageTwo(),
            PageThree(),
          ],
        ),
      ),
      bottomSheet: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: size.height * 0.20,
          maxHeight: size.height * 0.20,
          minWidth: size.width,
        ),
        child: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(vertical: 30),
          color: Theme.of(context).colorScheme.surface,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isLastIndex
                  ? FilledButton(
                      onPressed: () async {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AuthPage(),
                            ),
                            (route) => route.isFirst);
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setBool('showHome', true);
                      },
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 20,
                        ),
                      ),
                      child: const Text(
                        "Get Started",
                      ),
                    )
                  : FilledButton(
                      onPressed: () => _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut),
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 20,
                        ),
                      ),
                      child: const Text(
                        'Next',
                      ),
                    ),
              const Expanded(
                child: SizedBox(
                  height: 40,
                ),
              ),
              Expanded(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    radius: 10,
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 20,
                    dotColor: Theme.of(context).colorScheme.inversePrimary,
                    activeDotColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const OnBoardPage()),
                  (route) => route.isFirst);
              final prefs = await SharedPreferences.getInstance();
              prefs.setBool('showHome', false);
            },
            icon: const Icon(Icons.exit_to_app_outlined),
          ),
        ],
      ),
      body: Center(child: Image.asset('assets/images/thrifta.png')),
    );
  }
}
