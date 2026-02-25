import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saransk/home.dart';
import 'package:saransk/signin/login.dart';
import 'package:saransk/theme.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<String> content = [
    'Switch to Dark',
    'Change mother language',
    'Change your image',
    'Logout',
  ];
  int selectIndex = -1;

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
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15, left: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(
                        context,
                      ).push(MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: CircleAvatar(
                      backgroundColor: Color(0xffD9D9D9),
                      radius: 55,
                    ),
                  ),
                ),
                Text(
                  'Your profile, Emil',
                  style: Theme.of(
                    context,
                  ).textTheme.headlineLarge?.copyWith(color: Colors.white),
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
          SizedBox(height: 220),
          Expanded(
            child: ListView.builder(
              itemBuilder: _content,
              itemCount: content.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _content(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextButton(
        onPressed: () {
          setState(() {
            selectIndex = index;
          });
          if (selectIndex == 0) {
            Provider.of<ThemeChange>(context, listen: false).toggleTheme();
          }
          else if (selectIndex == 1) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChooseLang()));
          }
          else if (selectIndex == 2) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangeImage()));
          }
          else {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
          }
        },
        style: TextButton.styleFrom(backgroundColor: index == selectIndex ? Color(0xffE5E5E5) : Color(0xff5B7BFE)),
        child: SizedBox(
          height: 50,
          width: 280,
          child: Center(
            child: Text(
              content[index],
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class ChangeImage extends StatefulWidget {
  const ChangeImage({super.key});

  @override
  State<ChangeImage> createState() => _ChangeImageState();
}

class _ChangeImageState extends State<ChangeImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            color: Color(0xff410FA3),
            child: Padding(
              padding: const EdgeInsets.only(top: 60, left: 10),
              child: Text(
                'Your photo is gorgeous!',
                style: Theme.of(
                  context,
                ).textTheme.headlineLarge?.copyWith(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Profile()));
                  },
                  child: SizedBox(
                    height: 50,
                    width: 280,
                    child: Center(
                      child: Text(
                        'Use that image',
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(color: Colors.white),
                      ),
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
}
