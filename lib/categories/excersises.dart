import 'dart:io';
import 'dart:math';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:saransk/home.dart';


class guessAnimal extends StatefulWidget {
  const guessAnimal({super.key});

  @override
  State<guessAnimal> createState() => _guessAnimalState();
}

class _guessAnimalState extends State<guessAnimal> {
  final TextEditingController _answerController = TextEditingController();
  final Random _random = Random();
  int _currentAnimal = 0;

  final List<Map<String, dynamic>> animals = [
    {
      'name': 'Raccoon',
      'imageURL':
          'https://i.pinimg.com/736x/5d/5b/ce/5d5bce5724867e391e7a8ffda32153a7.jpg',
    },
    {
      'name': 'Elephant',
      'imageURL':
          'https://i.pinimg.com/736x/0b/37/55/0b3755cc56bc5a83229ec0c4a35a453a.jpg',
    },
    {
      'name': 'Lion',
      'imageURL':
          'https://i.pinimg.com/736x/8d/7a/55/8d7a550df4585632e010e0c59f78c777.jpg',
    },
    {
      'name': 'Penguin',
      'imageURL':
          'https://i.pinimg.com/736x/f6/b6/bf/f6b6bf4266f8b48f258f9f92a081864f.jpg',
    },
    {
      'name': 'Tiger',
      'imageURL':
          'https://i.pinimg.com/736x/4a/07/a1/4a07a1014fa5d07a0dc1a0e51ff87965.jpg',
    },
    {
      'name': 'Platypus',
      'imageURL':
          'https://i.pinimg.com/1200x/70/84/db/7084dbc652afa613da20ebe811ec7d35.jpg',
    },
    {
      'name': 'Squirrel',
      'imageURL':
          'https://i.pinimg.com/1200x/3c/73/c5/3c73c55e729b85a5a09d7c25d80df655.jpg',
    },
    {
      'name': 'Fox',
      'imageURL':
          'https://i.pinimg.com/1200x/ff/cf/0b/ffcf0b2e4e299d485dbcc7d43c7f34e6.jpg',
    },
    {
      'name': 'Cat',
      'imageURL':
          'https://i.pinimg.com/736x/48/eb/fd/48ebfd00922e6e60b5d23dc8d1764c6e.jpg',
    },
    {
      'name': 'Bear',
      'imageURL':
          'https://i.pinimg.com/736x/4b/9c/57/4b9c57c1165cde8c9d213e7e63a8d691.jpg',
    },
    {
      'name': 'Dog',
      'imageURL':
          'https://i.pinimg.com/736x/11/5a/83/115a8363528dac8d0527a99cb3e5bc83.jpg',
    },
    {
      'name': 'Seal',
      'imageURL':
          'https://i.pinimg.com/1200x/49/51/c6/4951c6861197fc85bd2a8b234dc79ae2.jpg',
    },
    {
      'name': 'Wolf',
      'imageURL':
          'https://i.pinimg.com/736x/a1/5f/dd/a15fdd24a854e1a003c335456260044a.jpg',
    },
    {
      'name': 'Deer',
      'imageURL':
          'https://i.pinimg.com/736x/5a/9a/e5/5a9ae5c24309a9471a37ad9dc2c7a2fb.jpg',
    },
    {
      'name': 'Snake',
      'imageURL':
          'https://i.pinimg.com/736x/2f/f8/cd/2ff8cd3f9d727fd9d6d1cc67a5bbf861.jpg',
    },
    {
      'name': 'Cow',
      'imageURL':
          'https://i.pinimg.com/1200x/5d/3c/8f/5d3c8f88aa207954ee6ec6f078019b89.jpg',
    },
  ];

  @override
  void initState() {
    super.initState();
    _selectRandom();
  }

  void _selectRandom() {
    setState(() {
      _currentAnimal = _random.nextInt(animals.length);
    });
  }

  String get _correctAnswer => animals[_currentAnimal]['name'];

  String get _currentImage => animals[_currentAnimal]['imageURL'];

  void _nextAnimal() {
    setState(() {
      _answerController.clear();
      _selectRandom();
    });
    Navigator.of(context).pop();
  }

  void _tryAgain() {
    setState(() {
      _answerController.clear();
    });
    Navigator.of(context).pop();
  }

  void _checkAnswer() {
    final userAnswer = _answerController.text.trim().toLowerCase();
    final correctAnswer = _correctAnswer.toLowerCase();

    if (userAnswer == correctAnswer) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CorrectRes(onContinue: _nextAnimal),
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => WrongRes(
            onContinue: _nextAnimal,
            onTryAgain: _tryAgain,
            Animal: _correctAnswer,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => Home()));
          },
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/line.png'),
          ),
        ),
        backgroundColor: Color(0xff410FA3),
        title: Text(
          'Guess the animal',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                height: 300,
                width: 290,
                child: Image.network(_currentImage),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'Write who is on image',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                cursorColor: Colors.black,
                controller: _answerController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffF2F3F3),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                onSubmitted: (_) => _checkAnswer(),
                textCapitalization: TextCapitalization.words,
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: _checkAnswer,
              child: SizedBox(
                height: 40,
                width: 310,
                child: Center(
                  child: Text(
                    'Check',
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
    );
  }

  @override
  void dispose() {
    super.dispose();
    _answerController.dispose();
  }
}

class CorrectRes extends StatelessWidget {
  final VoidCallback onContinue;

  const CorrectRes({super.key, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => Home()));
          },
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/line.png'),
          ),
        ),
        backgroundColor: Color(0xff5BA890),
        title: Text(
          'Guess the animal',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 60),
              Image.asset('assets/images/correct.png', width: 160),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 40),
                child: Text(
                  'Holy Molly! That is Right!',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              TextButton(
                onPressed: onContinue,
                child: SizedBox(
                  height: 40,
                  width: 290,
                  child: Center(
                    child: Text(
                      'Next',
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
      ),
    );
  }
}

class WrongRes extends StatelessWidget {
  final VoidCallback onTryAgain;
  final VoidCallback onContinue;
  final String Animal;

  const WrongRes({
    super.key,
    required this.onTryAgain,
    required this.onContinue,
    required this.Animal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => Home()));
          },
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/line.png'),
          ),
        ),
        backgroundColor: Color(0xffD6185D),
        title: Text(
          'Guess the animal',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60, bottom: 30),
                child: Image.asset('assets/images/wrong.png', width: 160),
              ),
              Text(
                'Eh? Wrong answer :(',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'That is: $Animal',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: onContinue,
                child: SizedBox(
                  height: 40,
                  width: 290,
                  child: Center(
                    child: Text(
                      'Next',
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextButton(
                onPressed: onTryAgain,
                child: SizedBox(
                  height: 40,
                  width: 290,
                  child: Center(
                    child: Text(
                      'Try again',
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
      ),
    );
  }
}

class wordPractice extends StatefulWidget {
  const wordPractice({super.key});

  @override
  State<wordPractice> createState() => _wordPracticeState();
}

class _wordPracticeState extends State<wordPractice> {
  int _currentWord = 0;
  String? _selectWord;
  bool _showRes = false;
  bool _allCompleted = false;
  final List<Map<String, dynamic>> _words = [
    {
      'word': 'hello',
      'transcription': '[həˈləʊ]',
      'translation': 'Привет',
      'answers': ['Диалог', 'Привет', 'Пока', 'Телефон'],
    },
    {
      'word': 'sun',
      'transcription': '[sʌn]',
      'translation': 'Солнце',
      'answers': ['Солнце', 'Луна', 'Звезды', 'Земля'],
    },
    {
      'word': 'cat',
      'transcription': '[kæt]',
      'translation': 'Кот',
      'answers': ['Лиса', 'Собака', 'Медведь', 'Кот'],
    },
    {
      'word': 'blue',
      'transcription': '[bluː]',
      'translation': 'Синий',
      'answers': ['Белый', 'Синий', 'Красный', 'Зеленый'],
    },
    {
      'word': 'book',
      'transcription': '[bʊk]',
      'translation': 'Книга',
      'answers': ['Шкаф', 'Книга', 'Ручка', 'Тетрадь'],
    },
    {
      'word': 'happy',
      'transcription': '[ˈhæpi]',
      'translation': 'Счастливый',
      'answers': ['Грустный', 'Злой', 'Счастливый', 'Забавный'],
    },
    {
      'word': 'water',
      'transcription': '[ˈwɔːtər]',
      'translation': 'Вода',
      'answers': ['Бутылка', 'Вода', 'Кастрюля', 'Лед'],
    },
    {
      'word': 'small',
      'transcription': '[/smɔːl]',
      'translation': 'Маленький',
      'answers': ['Маленький', 'Высокий', 'Тонкий', 'Низкий'],
    },
    {
      'word': 'run',
      'transcription': '[rʌn]',
      'translation': 'Бежать',
      'answers': ['Прыгать', 'Бежать', 'Стоять', 'Сидеть'],
    },
    {
      'word': 'House',
      'transcription': '[haʊs]',
      'translation': 'Дом',
      'answers': ['Дерево', 'Песня', 'Пол', 'Дом'],
    },
    {
      'word': 'Tree',
      'transcription': ' [triː]',
      'translation': 'Дерево',
      'answers': ['Стена', 'Замок', 'Дерево', 'Стул'],
    },
    {
      'word': 'Moon',
      'transcription': ' [muːn]',
      'translation': 'Луна',
      'answers': ['Луна', 'Небо', 'Ветер', 'Ночь'],
    },
    {
      'word': 'Goodbye',
      'transcription': '[ˌɡʊdˈbaɪ]',
      'translation': 'Пока',
      'answers': ['Здравствуйте', 'Приветсвие', 'Пока', 'Разговор'],
    },
    {
      'word': 'Pen',
      'transcription': '[pen]',
      'translation': 'Ручка',
      'answers': ['Книга', 'Пенал', 'Карандаш', 'Ручка'],
    },
  ];

  void _checkWord() {
    setState(() {
      _showRes = true;
    });
  }

  void _nextWord() {
    setState(() {
      if (_currentWord < _words.length - 1) {
        _currentWord++;
        _selectWord = null;
        _showRes = false;
      } else {
        _allCompleted = true;
      }
    });
  }

  void _selectAnswer(String answer) {
    if (!_showRes && !_allCompleted) {
      setState(() {
        _selectWord = answer;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_allCompleted) {
      return Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 270),
              Image.asset('assets/images/correct.png', width: 160),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 40),
                child: Text(
                  'Слова на сегодня закончились!',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              SizedBox(height: 200),
              TextButton(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => Home()));
                },
                child: SizedBox(
                  height: 40,
                  width: 290,
                  child: Center(
                    child: Text(
                      'Home',
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
      );
    }

    final currentWord = _words[_currentWord];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => Home()));
          },
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/line.png'),
          ),
        ),
        backgroundColor: Color(0xff410FA3),
        title: Text(
          'Word practice',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Text(
              currentWord['word'],
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontSize: 32),
            ),
            Text(
              currentWord['transcription'],
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontSize: 18),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: currentWord['answers'].length,
                itemBuilder: (context, index) {
                  final answer = currentWord['answers'][index];
                  final isCorrect = answer == currentWord['translation'];
                  final isSelected = _selectWord == answer;
                  return GestureDetector(
                    onTap: () => _selectAnswer(answer),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: _showRes
                              ? (isCorrect
                                    ? Color(0xff5BA890)
                                    : isSelected
                                    ? Color(0xffF76400)
                                    : Color(0xffE5E5E5))
                              : (isSelected
                                    ? Color(0xff5B7BFE)
                                    : Color(0xffE5E5E5)),
                        ),
                        child: ListTile(
                          title: Text(
                            answer,
                            textAlign: TextAlign.center,
                            style: Theme.of(
                              context,
                            ).textTheme.headlineSmall?.copyWith(fontSize: 19),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            TextButton(
              onPressed: _selectWord == null
                  ? null
                  : _showRes
                  ? _nextWord
                  : _checkWord,
              child: SizedBox(
                height: 40,
                width: 290,
                child: Center(
                  child: Text(
                    _showRes ? 'Next' : 'Check',
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: Colors.white),
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
}

class Audition extends StatefulWidget {
  const Audition({super.key});

  @override
  State<Audition> createState() => _AuditionState();
}

class _AuditionState extends State<Audition> {
  int _currentWord = 0;
  String? selectWord;
  final List<Map<String, dynamic>> _words = [
    {'word': 'hello', 'transcription': '[həˈləʊ]'},
    {'word': 'sun', 'transcription': '[sʌn]'},
    {'word': 'cat', 'transcription': '[kæt]'},
    {'word': 'blue', 'transcription': '[bluː]'},
    {'word': 'book', 'transcription': '[bʊk]'},
    {'word': 'happy', 'transcription': '[ˈhæpi]'},
    {'word': 'water', 'transcription': '[ˈwɔːtər]'},
    {'word': 'small', 'transcription': '[/smɔːl]'},
    {'word': 'run', 'transcription': '[rʌn]'},
    {'word': 'House', 'transcription': '[haʊs]'},
    {'word': 'Tree', 'transcription': '[triː]'},
    {'word': 'Moon', 'transcription': '[muːn]'},
    {'word': 'Goodbye', 'transcription': '[ˌɡʊdˈbaɪ]'},
    {'word': 'Pen', 'transcription': '[pen]'},
  ];

  @override
  Widget build(BuildContext context) {
    final currentWord = _words[_currentWord];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => Home()));
          },
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/line.png'),
          ),
        ),
        backgroundColor: Color(0xff410FA3),
        title: Text(
          'Listening',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          Text(
            currentWord['word'],
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontSize: 30),
          ),
          Text(
            currentWord['transcription'],
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 15),
            child: Text(
              'Please press button and say this word. Our service will check\nyour pronunciation',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => Listening()));
            },
            child: SizedBox(
              height: 40,
              width: 290,
              child: Center(
                child: Text(
                  'Check my speech',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Listening extends StatefulWidget {
  const Listening({super.key});

  @override
  State<Listening> createState() => _ListeningState();
}

class _ListeningState extends State<Listening> {
  final AudioRecorder record = AudioRecorder();
  String? recordPath;

  bool _isShow = false;
  bool _isRecording = false;
  bool _isPermission = false;
  int _currentWord = 0;
  String? selectWord;
  String _text = '';
  final List<Map<String, dynamic>> _words = [
    {'word': 'hello', 'transcription': '[həˈləʊ]'},
    {'word': 'sun', 'transcription': '[sʌn]'},
    {'word': 'cat', 'transcription': '[kæt]'},
    {'word': 'blue', 'transcription': '[bluː]'},
    {'word': 'book', 'transcription': '[bʊk]'},
    {'word': 'happy', 'transcription': '[ˈhæpi]'},
    {'word': 'water', 'transcription': '[ˈwɔːtər]'},
    {'word': 'small', 'transcription': '[/smɔːl]'},
    {'word': 'run', 'transcription': '[rʌn]'},
    {'word': 'House', 'transcription': '[haʊs]'},
    {'word': 'Tree', 'transcription': '[triː]'},
    {'word': 'Moon', 'transcription': '[muːn]'},
    {'word': 'Goodbye', 'transcription': '[ˌɡʊdˈbaɪ]'},
    {'word': 'Pen', 'transcription': '[pen]'},
  ];

  // Future<void> speechText() async {
  //   final micStatus = await Permission.microphone.request();
  //   final speechStatus = await Permission.speech.request();
  //
  //   if (micStatus.isGranted && speechStatus.isGranted) {
  //     setState(() {
  //       _isPermission = true;
  //     });
  //
  //     bool available = await _speech.initialize(
  //       onError: (error) {
  //         setState(() => _text = 'Ошибка');
  //       },
  //     );
  //
  //     if (!available) {
  //       setState(() => _text = 'Распознавание не доступно');
  //     }
  //   }
  // }
  //
  // Future<void> _toggleRecord() async {
  //   if (_isRecording) {
  //     await _stopRecording();
  //   } else {
  //     await _startRecording();
  //   }
  // }
  //
  // Future<void> _startRecording() async {
  //   if (!_isPermission) return;
  //   try {
  //     const config = RecordConfig(
  //       encoder: AudioEncoder.aacLc,
  //       bitRate: 128000,
  //       sampleRate: 44100,
  //       numChannels: 1,
  //     );
  //     await record.start(config, path: 'assets/speech');
  //
  //     _speech.listen(
  //       onResult: (res) {
  //         setState(() => _text = res.recognizedWords);
  //       },
  //       cancelOnError: true,
  //       partialResults: true,
  //       listenFor: Duration(seconds: 10),
  //       localeId: 'en_US',
  //     );
  //
  //     setState(() {
  //       _isRecording = true;
  //       _text = '';
  //     });
  //   } catch (e) {
  //     setState(() => _text = 'Ошибка записи');
  //   }
  // }
  //
  // Future<void> _stopRecording() async {
  //   try {
  //     await record.stop();
  //     _speech.stop();
  //
  //     setState(() {
  //       _isRecording = false;
  //     });
  //
  //     Future.delayed(const Duration(milliseconds: 1000), () {
  //       if (mounted) {
  //         setState(() {
  //           _isShow = true;
  //         });
  //       }
  //     });
  //   } catch (e) {
  //     setState(() => _text = 'Ошибка');
  //   }
  // }
  //
  // void _nextWord() {
  //   if (_currentWord < _words.length - 1) {
  //     setState(() { // ДОБАВИТЬ setState!
  //       _currentWord++;
  //       _isShow = false;
  //       _text = '';
  //       selectWord = null;
  //     });
  //   } else {
  //     setState(() { // ДОБАВИТЬ setState!
  //       _isCompleted = true;
  //     });
  //   }
  // }
  //
  // bool get _isCorrect {
  //   final currentWord = _words[_currentWord]['word'].toLowerCase();
  //   final text = _text.toLowerCase().trim();
  //   return text == currentWord;
  // }

  @override
  Widget build(BuildContext context) {
    final currentWord = _words[_currentWord];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
          },
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/line.png'),
          ),
        ),
        backgroundColor: Color(0xff410FA3),
        title: Text(
          'Listening',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          Text(
            currentWord['word'],
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 30),
          ),
          Text(
            currentWord['transcription'],
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 15),
            child: Text(
              'Please press button and say this word. Our service will check\nyour pronunciation',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      floatingActionButton: _recordButton(),
    );
  }
  Widget _recordButton() {
    return FloatingActionButton(onPressed: () async {
      if (_isRecording) {
        String? filePath = await record.stop();
        if (filePath != null) {
          setState(() {
            _isRecording = false;
            recordPath = filePath;
          });
        }
      }
      else {
        if (await record.hasPermission()) {
          final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
          final String filePath = p.join(appDocumentsDir.path, 'record.wav');
          await record.start(const RecordConfig(), path: filePath);
          setState(() {
            _isRecording = true;
            recordPath = null;
          });
      }
      }
    },
      child: Icon(_isRecording ? Icons.stop : Icons.mic),
    );
  }
}

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => Home()));
          },
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/line.png'),
          ),
        ),
        backgroundColor: Color(0xff410FA3),
        title: Text(
          'Game',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(color: Colors.white),
        ),
      ),
      body: Column(children: []),
    );
  }
}

