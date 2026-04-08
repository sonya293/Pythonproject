import 'dart:io';
import 'package:characters/characters.dart';

enum Mood {
  happy,
  excited,
  calm,
  sad,
  energetic,
  tired,
}

void main() {
  print('Введите ваше имя:');
  String name = stdin.readLineSync() ?? 'Гость';

  print('\nГенерируем случайное настроение...\n');

  List<Mood> moods = List.from(Mood.values);
  moods.shuffle();
  Mood randomMood = moods.first;

  String emoji = '';
  String description = '';
  int energy = 0;

  switch (randomMood) {
    case Mood.happy:
      emoji = '\u{1F60A}';
      description = 'счастливый';
      energy = 8;
      break;
    case Mood.excited:
      emoji = '\u{1F60E}';
      description = 'взволнованный';
      energy = 9;
      break;
    case Mood.calm:
      emoji = '\u{1F60C}';
      description = 'спокойный';
      energy = 5;
      break;
    case Mood.sad:
      emoji = '\u{1F61E}';
      description = 'грустный';
      energy = 3;
      break;
    case Mood.energetic:
      emoji = '\u{1F4AA}';
      description = 'энергичный';
      energy = 10;
      break;
    case Mood.tired:
      emoji = '\u{1F634}';
      description = 'уставший';
      energy = 2;
      break;
  }

  print(
      'Привет, $name! Твое настроение: $emoji $description (энергия: $energy/10)');

  int codePoint = emoji.runes.first;
  print(
      '\nЮникод вашего эмодзи: U+${codePoint.toRadixString(16).toUpperCase().padLeft(4, '0')}');

  print('\nХотите просмотреть сложные эмодзи? (y/n или да/нет):');
  String? answer = stdin.readLineSync();

  String answerLower = (answer ?? '').toLowerCase().trim();

  bool wantContinue = answerLower == 'да' ||
      answerLower == 'yes' ||
      answerLower == 'y' ||
      answerLower == 'д' ||
      answerLower == '1';

  if (wantContinue) {
    print('\nВведите комбинацию эмодзи:');
    String complexEmoji = stdin.readLineSync() ?? '';

    if (complexEmoji.isNotEmpty) {
      print('\nАнализ строки "$complexEmoji":');
      print('- 16-битных единиц: ${complexEmoji.length}');
      print('- Кодовых точек: ${complexEmoji.runes.length}');
      print('- Реальных символов: ${complexEmoji.characters.length}');

      print('\nПодробный вывод юникода:');
      int i = 1;
      for (var character in complexEmoji.characters) {
        String codePoints = '';
        for (int r in character.runes) {
          if (codePoints.isNotEmpty) codePoints += ', ';
          codePoints += 'U+${r.toRadixString(16).toUpperCase()}';
        }
        print('Символ $i: $character → $codePoints');
        i++;
      }
    } else {
      print('Вы не ввели эмодзи.');
    }
  }

  print('\nСпасибо, приходите снова!');
}
