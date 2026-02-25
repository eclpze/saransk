import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saransk/home.dart';
import 'package:saransk/signin/login.dart';
import 'package:saransk/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => ThemeChange(),
    child: MyApp(),
    ),
     );
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeChange>(context);
    return MaterialApp(home: Login(),
    theme: LightTheme.lightTheme,
    darkTheme: DarkTheme.darkTheme,
    themeMode: themeChange.themeMode,
    );
  }
}

// class CheckInternet extends StatefulWidget {
//   @override
//   _CheckInternetState createState() => _CheckInternetState();
// }
//
// class _CheckInternetState extends State<CheckInternet> {
//   bool hasInternet = true;
//   bool isLoading = false;
//   late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
//   late StreamSubscription<InternetConnectionStatus>
//   _connectionStatusSubscription;
//   final InternetConnectionChecker _connectionChecker =
//       InternetConnectionChecker.createInstance();
//
//   @override
//   void initState() {
//     super.initState();
//     _checkInternetConnection();
//     _connectivitySubscription = Connectivity().onConnectivityChanged.listen((
//       List<ConnectivityResult> results,
//     ) {
//       if (results.isNotEmpty) {
//         _handleConnectivityChange(results.first);
//       }
//     });
//
//     _connectionStatusSubscription = _connectionChecker.onStatusChange.listen((
//       status,
//     ) {
//       setState(() {
//         hasInternet = status == InternetConnectionStatus.connected;
//         isLoading = false;
//       });
//
//       if (hasInternet) {
//         _navigateToHome();
//       }
//     });
//   }
//
//   void _handleConnectivityChange(ConnectivityResult result) {
//     _checkInternetConnection();
//   }
//
//   Future<void> _checkInternetConnection() async {
//     setState(() {
//       isLoading = true;
//     });
//
//     var connectivityResult = await Connectivity().checkConnectivity();
//
//     bool hasConnectivity = connectivityResult.any(
//       (result) => result != ConnectivityResult.none,
//     );
//
//     if (!hasConnectivity) {
//       setState(() {
//         hasInternet = false;
//         isLoading = false;
//       });
//       return;
//     }
//
//     bool isConnected = await _connectionChecker.hasConnection;
//
//     setState(() {
//       hasInternet = isConnected;
//       isLoading = false;
//     });
//
//     if (isConnected) {
//       _navigateToHome();
//     }
//   }
//
//   void _navigateToHome() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Navigator.of(
//         context,
//       ).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
//     });
//   }
//
//   @override
//   void dispose() {
//     _connectivitySubscription.cancel();
//     _connectionStatusSubscription.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: hasInternet ? Home() : _buildDisconnectedUI(),
//       bottomNavigationBar: _buildCheckAgainButton(),
//     );
//   }
//
//   Widget _buildDisconnectedUI() {
//     return Column(
//       children: [
//         Expanded(
//           child: Container(color: Color(0xff410FA3), width: double.infinity),
//         ),
//         Expanded(
//           flex: 6,
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 130, bottom: 10),
//                 child: Image.asset('assets/images/check.png', width: 150),
//               ),
//               Text(
//                 'No\ninternet connection',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontWeight: FontWeight.w800, fontSize: 28),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildCheckAgainButton() {
//     return Container(
//       padding: EdgeInsets.all(20),
//       child: ElevatedButton(
//         onPressed: isLoading ? null : _checkInternetConnection,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Color(0xff5B7BFE),
//           minimumSize: Size(double.infinity, 60),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//         ),
//         child: isLoading
//             ? SizedBox(
//                 height: 20,
//                 width: 20,
//                 child: CircularProgressIndicator(
//                   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                   strokeWidth: 2,
//                 ),
//               )
//             : Text(
//                 'Check again',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.w900,
//                   fontSize: 20,
//                 ),
//               ),
//       ),
//     );
//   }
// }


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => Sprints())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff410FA3),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 280, bottom: 20),
              child: Image.asset('assets/images/splash.png', height: 180),
            ),
            Text(
              'Language App',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.white, fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}

class Sprints extends StatefulWidget {
  const Sprints({super.key});

  @override
  State<Sprints> createState() => _SprintsState();
}

class _SprintsState extends State<Sprints> {
  final PageController _imageController = PageController();
  final PageController _textController = PageController();
  int count = 0;

  @override
  void dispose() {
    _imageController.dispose();
    _textController.dispose();
    super.dispose();
  }

  void _syncControllers(int index) {
    setState(() {
      count = index;
    });
    _textController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: _syncControllers,
                controller: _imageController,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 60, 50, 0),
                    child: Image.asset(
                      'assets/images/sprint1.png',
                      height: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 60, 50, 0),
                    child: Image.asset(
                      'assets/images/sprint2.png',
                      height: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 60, 50, 0),
                    child: Image.asset(
                      'assets/images/sprint3.png',
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: _imageController,
              count: 3,
              effect: JumpingDotEffect(
                dotHeight: 8,
                dotWidth: 8,
                dotColor: Color(0xffCECFD2),
                activeDotColor: Color(0xffF76400),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              flex: 1,
              child: PageView(
                controller: _textController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text(
                          "Confidence in your words",
                          style: Theme.of(context).textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "With conversation-based learning,\nyou'll be talking from lesson one",
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Color(0xff7B7E87)),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text(
                          "Take your time to learn",
                          style: Theme.of(context).textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Develop a habit of learning and\nmake it a part of your daily routine",
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Color(0xff7B7E87)),  textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text(
                          "The lessons you need to learn",
                          style: Theme.of(context).textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Using a variety of learning styles to learn\nand retain",
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Color(0xff7B7E87)), textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      if (count < 2) {
                        _imageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ChooseLang()),
                        );
                      }
                    },
                    child: Container(
                      height: 40,
                      width: 290,
                      decoration: BoxDecoration(
                        color: Color(0xff5B7BFE),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Center(
                        child: Text(
                          count == 2
                              ? 'Choose a language'
                              : (count == 1 ? 'More' : 'Next'),
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    child: Text(
                      'Skip onboarding',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Color(0xff080E1E)),
                    ),
                    onTap: () {
                      Navigator.of(
                        context,
                      ).push(MaterialPageRoute(builder: (context) => ChooseLang()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SprintsStat extends State<Sprints> {
  final PageController _imageController = PageController();
  final PageController _textController = PageController();
  int count = 0;

  // Данные для онбординга
  final List<OnboardingItem> onboardingData = [
    OnboardingItem(
      imagePath: 'assets/images/sprint1.png',
      title: "Confidence in your words",
      description: "With conversation-based learning,\nyou'll be talking from lesson one",
    ),
    OnboardingItem(
      imagePath: 'assets/images/sprint2.png',
      title: "Take your time to learn",
      description: "Develop a habit of learning and\nmake it a part of your daily routine",
    ),
    OnboardingItem(
      imagePath: 'assets/images/sprint3.png',
      title: "The lessons you need to learn",
      description: "Using a variety of learning styles to learn\nand retain",
    ),
  ];

  @override
  void dispose() {
    _imageController.dispose();
    _textController.dispose();
    super.dispose();
  }

  void _syncControllers(int index) {
    setState(() {
      count = index;
    });
    _textController.jumpToPage(index);
  }

  void _navigateToNext() {
    if (count < onboardingData.length - 1) {
      _imageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ChooseLang()),
      );
    }
  }

  void _skipOnboarding() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ChooseLang()),
    );
  }

  String get _buttonText {
    if (count == onboardingData.length - 1) return 'Choose a language';
    if (count == onboardingData.length - 2) return 'More';
    return 'Next';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Изображения
            Expanded(
              flex: 3,
              child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: _syncControllers,
                controller: _imageController,
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(50, 60, 50, 0),
                    child: Image.asset(
                      onboardingData[index].imagePath,
                      height: 100,
                    ),
                  );
                },
              ),
            ),

            // Индикатор
            SmoothPageIndicator(
              controller: _imageController,
              count: onboardingData.length,
              effect: JumpingDotEffect(
                dotHeight: 8,
                dotWidth: 8,
                dotColor: Color(0xffCECFD2),
                activeDotColor: Color(0xffF76400),
              ),
            ),

            SizedBox(height: 30),

            // Тексты
            Expanded(
              flex: 1,
              child: PageView.builder(
                controller: _textController,
                physics: NeverScrollableScrollPhysics(),
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text(
                          onboardingData[index].title,
                          style: Theme.of(context).textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          onboardingData[index].description,
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: Color(0xff7B7E87),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Кнопки
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  TextButton(
                    onPressed: _navigateToNext,
                    child: Container(
                      height: 40,
                      width: 290,
                      decoration: BoxDecoration(
                        color: Color(0xff5B7BFE),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Center(
                        child: Text(
                          _buttonText,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: _skipOnboarding,
                    child: Text(
                      'Skip onboarding',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Color(0xff080E1E),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Модель данных для онбординга
class OnboardingItem {
  final String imagePath;
  final String title;
  final String description;

  OnboardingItem({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

// Widget _buildDisconnectedUI() {
//   return Column(
//     children: [
//       Expanded(
//         child: Container(color: Color(0xff410FA3), width: double.infinity),
//       ),
//       Expanded(
//         flex: 6,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset('assets/images/check.png', width: 150),
//             SizedBox(height: 20),
//             Text(
//               'No\ninternet connection',
//               style: TextStyle(
//                 fontWeight: FontWeight.w800,
//                 fontSize: 28,
//                 color: Colors.black87,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Text(
//                 'Please check your connection and try again',
//                 style: TextStyle(color: Colors.grey, fontSize: 16),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ],
//         ),
//       ),
//     ],
//   );
// }
