import 'package:flutter/material.dart';
import 'package:saransk/categories/excersises.dart';
import 'package:saransk/profile.dart';
import 'package:saransk/signin/login.dart';


class ChooseLang extends StatefulWidget {
  const ChooseLang({super.key});

  @override
  State<ChooseLang> createState() => _ChooseLangState();
}

class _ChooseLangState extends State<ChooseLang> {
  final List<String> lang = [
    'Russian',
    'English',
    'Chinese',
    'Belarus',
    'Kazakh',
  ];
  int selectIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff284AD7),
        centerTitle: true,
        title: Text(
          'Language select',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white)
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Text(
                'What is your Mother language?',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: _listLang,
                itemCount: lang.length,
              ),
            ),
            TextButton(
              onPressed: () {
                if (selectIndex == -1) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: Text(
                          'Ошибка',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.red)
                        ),
                        content: Text(
                          'Выберите Ваш родной язык!',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      );
                    },
                  );
                } else {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => Login()));
                }
              },
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(fontSize: 18),
                ),
              ),
              child: Container(
                height: 40,
                width: 280,
                decoration: BoxDecoration(
                  color: Color(0xff5B7BFE),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Center(
                  child: Text(
                    'Choose',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _listLang(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Container(
          width: 280,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: index == selectIndex ? Color(0xffF76400) : Color(0xffFFF6EB),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                lang[index],
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectIndex = -1;

  List<String> avatars = [
    'assets/images/ava1.png',
    'assets/images/ava2.png',
    'assets/images/ava3.png',
  ];
  List<String> users = [
    'Vincent van Gogh',
    'Dmitri Ivanovich Mendeleev',
    'Vlad Tepes',
  ];
  List<String> point = ['12', '10', '8'];
  List<String> categories = [
    'Guess the animal',
    'Word practice',  'Audition',
    'Game',

  ];
  List<String> categoriesPictures = [
    'assets/images/categ1.png',
    'assets/images/categ2.png',
    'assets/images/categ3.png',
    'assets/images/categ4.png',
  ];
  List<String> categoriesColor = ['5B7BFE', 'D6185D', 'F76400', '5BA890'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            color: Color(0xff410FA3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60),
                GestureDetector(onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile()));
                },
                    child: CircleAvatar(backgroundColor: Color(0xffD9D9D9), radius: 30)),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    'Hello, Emil',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.white)
                  ),
                ),
                Text(
                  'Are you ready for learning today?',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Color(0xffB6B6B6))
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Top users',
                      style:  Theme.of(context).textTheme.headlineLarge
                    ),
                    SizedBox(
                      height: 270,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: users.length,
                        itemBuilder: _users,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Available exercises',
                      style:  Theme.of(context).textTheme.headlineLarge
                    ),
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.0,
                      ),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectIndex = index;
                            });
                           if (selectIndex == 0) {
                             Navigator.of(context).push(MaterialPageRoute(builder: (context) => guessAnimal()));
                           }
                           else if (selectIndex == 1) {
                             Navigator.of(context).push(MaterialPageRoute(builder: (context) => wordPractice()));
                           }
                           else if (selectIndex == 2) {
                             Navigator.of(context).push(MaterialPageRoute(builder: (context) => Audition()));
                           }
                           else {
                             Navigator.of(context).push(MaterialPageRoute(builder: (context) => Game()));
                           }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(
                                int.parse('0xFF${categoriesColor[index]}'),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  categoriesPictures[index],
                                  width: 90,
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: Text(
                                    categories[index],
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white)
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _users(BuildContext context, int index) {
    return Container(
      height: 70,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xffE5E5E5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 20,
            child: Image.asset(avatars[index], width: 30),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              users[index],
              textAlign: TextAlign.center,
              style:  Theme.of(context).textTheme.titleSmall
            ),
          ),
          Text(
            '${point[index]} points',
            style:  Theme.of(context).textTheme.titleSmall
          ),
        ],
      ),
    );
  }
}
