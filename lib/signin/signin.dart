import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:saransk/home.dart';
import 'package:saransk/signin/login.dart';


class SigIn extends StatefulWidget {
  const SigIn({super.key});

  @override
  State<SigIn> createState() => _SigInState();
}

class _SigInState extends State<SigIn> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff284AD7),
        centerTitle: true,
        title: Text(
          'Signup',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => Login()));
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
              child: Text(
                'Create an Account',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'First Name',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: 10),
                  TextField(
                    cursorColor: Colors.black,
                    controller: _firstName,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffF2F3F3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Your First Name',
                      hintStyle: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Last Name',
                        style: Theme.of(context).textTheme.headlineSmall,),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: 10),
                  TextField(
                    cursorColor: Colors.black,
                    controller: _lastName,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffF2F3F3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Your Last Name',
                      hintStyle: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
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
            SizedBox(height: 30),
            TextButton(
              onPressed: () {
                if (_firstName.text.isNotEmpty &&
                    _lastName.text.isNotEmpty &&
                    _emailController.text.isNotEmpty &&
                    _emailController.text.contains("@")) {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => Password()));
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
                          'Введите верные почту и ФИ!',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      );
                    },
                  );
                }
              },
              child: SizedBox(
                height: 40,
                width: 280,
                child: Center(
                  child: Text(
                    'Continue',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: 'Already you member? ',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Color(0xff656872)),
                children: [
                  TextSpan(
                    text: 'Login',
                    style:  Theme.of(context).textTheme.headlineSmall?.copyWith(color: Color(0xff5B7BFE)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Login()),
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

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirm = TextEditingController();
  bool _passwordVis = true;
  bool _passwordConf = true;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff284AD7),
        centerTitle: true,
        title: Text(
          'Signup',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => SigIn()));
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
              child: Text(
                'Choose a Password',
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
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Confirm Password',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: 10),
                  TextField(
                    cursorColor: Colors.black,
                    controller: _passwordConfirm,
                    obscureText: _passwordConf,
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
                            _passwordConf = !_passwordConf;
                          });
                        },
                        icon: _passwordConf
                            ? ImageIcon(AssetImage('assets/images/vis_off.png'), size: 20,)
                            : ImageIcon(AssetImage('assets/images/vis.png'), size: 20,),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: RichText(
                text: TextSpan(
                  text: 'I have made myself acquainted with the Rules ',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Color(0xff5B7BFE)),
                  children: [
                    TextSpan(
                      text: 'and accept all its provisions.',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Color(0xff656872)),
                    ),
                  ],
                ),
              ),
              activeColor: Color(0xff5B7BFE),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value ?? false;
                });
              },
            ),
            SizedBox(height: 30),
            TextButton(
              onPressed: () {
                if (_passwordController.text.isEmpty &&
                    _passwordConfirm.text.isEmpty) {
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
                          'Введите пароль и подтвердите его!',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      );
                    },
                  );
                } else if (_passwordController.text != _passwordConfirm.text) {
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
                          'Пароли не совпадают!',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      );
                    },
                  );
                } else if (_passwordController.text.length != 8) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: Text(
                          'Ошибка',
                          style:Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.red)
                        ),
                        content: Text(
                          'Пароль должен содержать 8 символов!',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      );
                    },
                  );
                } else if (isChecked != true) {
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
                          'Подтвердите согласие на обработку персональных данных',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      );
                    },
                  );
                } else {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => Home()));
                }
              },
              child: SizedBox(
                height: 40,
                width: 280,
                child: Center(
                  child: Text(
                    'Signup',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: 'Already you member? ',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Color(0xff656872)),
                children: [
                  TextSpan(
                    text: 'Login',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Color(0xff5B7BFE)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Login()),
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