import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:saransk/home.dart';
import 'package:saransk/signin/signin.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _passwordVis = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff284AD7),
        centerTitle: true,
        title: Text(
          'Login',
          style:  Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => ChooseLang()));
          },
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/line.png'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/login.png', height: 140, width: 140),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
              child: Text(
                'For free, join now and start learning',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Email Address',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: 10),
                  TextField(
                    cursorColor: Colors.black,
                    controller: _emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffF2F3F3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Email',
                      hintStyle: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Password',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: 10),
                  TextField(
                    cursorColor: Colors.black,
                    controller: _passwordController,
                    obscureText: _passwordVis,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffF2F3F3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide.none,
                      ),
                      hintText: '.......',
                      hintStyle: Theme.of(context).textTheme.headlineSmall,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _passwordVis = !_passwordVis;
                          });
                        },
                        icon: _passwordVis
                            ? ImageIcon(AssetImage('assets/images/vis_off.png'), size: 20,)
                            : ImageIcon(AssetImage('assets/images/vis.png'), size: 20,),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
              child: Row(
                children: [
                  Text(
                    'Forgot Password',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Color(0xffD6185D)),
                  ),
                  Spacer(),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                if (_emailController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty &&
                    _passwordController.text.length == 8 &&
                    _emailController.text.contains("@")) {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => Home()));
                } else if (_emailController.text.isEmpty &&
                    _passwordController.text.isEmpty) {
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
                          'Введите почту и пароль!',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      );
                    },
                  );
                }
                else if (_passwordController.text.length != 8) {
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
                          'Пароль содержит 8 символов!',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      );
                    },
                  );
                } else {
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
                          'Введите верные почту и пароль!',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      );
                    },
                  );
                }
              },
              child: SizedBox(
                height: 40,
                width: 290,
                child: Center(
                  child: Text(
                    'Login',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: 'Not you member? ',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Color(0xff656872)),
                children: [
                  TextSpan(
                    text: 'Signup',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Color(0xff5B7BFE)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SigIn()),
                        );
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