void main() {
  List<String> students = [
    'Анна Иванова',
    'Борис Петров',
    'Виктор Сидоров',
    'Галина Смирнова',
    'Дмитрий Козлов',
    'Елена Морозова',
  ];

  List<String> subjects = [
    'Математика',
    'Физика',
    'Информатика',
    'Английский язык',
  ];

  List<List<int>> grades = [
    [4, 5, 4, 5],
    [3, 4, 3, 4],
    [5, 5, 5, 4],
    [4, 3, 4, 3],
    [2, 3, 4, 3],
    [4, 4, 5, 5],
  ];

  print('Список студентов');
  for (int i = 0; i < students.length; i++) {
    print('${i + 1}. ${students[i]}');
  }
  print('');

  print('Список предметов');
  for (int i = 0; i < subjects.length; i++) {
    print('${i + 1}. ${subjects[i]}');
  }
  print('');

  print('Оценки каждого студента');
  for (int i = 0; i < students.length; i++) {
    print('${students[i]}:');
    for (int j = 0; j < subjects.length; j++) {
      print('  ${subjects[j]}: ${grades[i][j]}');
    }
    print('');
  }

  print('Средний балл по предметам');
  for (int j = 0; j < subjects.length; j++) {
    double sum = 0;
    for (int i = 0; i < students.length; i++) {
      sum += grades[i][j];
    }
    double average = sum / students.length;
    print('${subjects[j]}: ${average.toStringAsFixed(2)}');
  }
  print('');

  print('Средний балл каждого студента');
  List<double> studentAverages = [];
  for (int i = 0; i < students.length; i++) {
    double sum = 0;
    for (int j = 0; j < subjects.length; j++) {
      sum += grades[i][j];
    }
    double average = sum / subjects.length;
    studentAverages.add(average);
    print('${students[i]}: ${average.toStringAsFixed(2)}');
  }
  print('');

  double bestAverage = studentAverages[0];
  int bestIndex = 0;
  for (int i = 1; i < studentAverages.length; i++) {
    if (studentAverages[i] > bestAverage) {
      bestAverage = studentAverages[i];
      bestIndex = i;
    }
  }
  print('Лучший студент');
  print('${students[bestIndex]}: ${bestAverage.toStringAsFixed(2)}');
  print('');

  double minSubjectAverage = double.infinity;
  int minSubjectIndex = 0;
  for (int j = 0; j < subjects.length; j++) {
    double sum = 0;
    for (int i = 0; i < students.length; i++) {
      sum += grades[i][j];
    }
    double average = sum / students.length;
    if (average < minSubjectAverage) {
      minSubjectAverage = average;
      minSubjectIndex = j;
    }
  }
  print('Предмет с наименьшим средним баллом');
  print(
    '${subjects[minSubjectIndex]}: ${minSubjectAverage.toStringAsFixed(2)}',
  );
  print('');

  double totalSum = 0;
  int totalGrades = students.length * subjects.length;
  for (int i = 0; i < students.length; i++) {
    for (int j = 0; j < subjects.length; j++) {
      totalSum += grades[i][j];
    }
  }
  double totalAverage = totalSum / totalGrades;
  print('Общий средний балл по группе');
  print('${totalAverage.toStringAsFixed(2)}');
  print('');

  print('Все предметы');
  for (int i = 0; i < subjects.length; i++) {
    print('${i + 1}. ${subjects[i]}');
  }
  print('Количество предметов: ${subjects.length}');
  print('');

  print('Студенты без оценки 2');
  bool hasNoTwo = false;
  for (int i = 0; i < students.length; i++) {
    bool hasTwo = false;
    for (int j = 0; j < subjects.length; j++) {
      if (grades[i][j] == 2) {
        hasTwo = true;
        break;
      }
    }
    if (!hasTwo) {
      print(students[i]);
      hasNoTwo = true;
    }
  }
  if (!hasNoTwo) {
    print('Нет студентов без оценки 2');
  }
  print('');

  print('Студенты с оценками не ниже 4');
  bool hasAllAbove4 = false;
  for (int i = 0; i < students.length; i++) {
    bool allAbove4 = true;
    for (int j = 0; j < subjects.length; j++) {
      if (grades[i][j] < 4) {
        allAbove4 = false;
        break;
      }
    }
    if (allAbove4) {
      print(students[i]);
      hasAllAbove4 = true;
    }
  }
  if (!hasAllAbove4) {
    print('Нет студентов с оценками не ниже 4');
  }
  print('');
}
