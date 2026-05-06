class Cup {
  int liquid = 500;
  void drink(int ml) {
    if (ml <= liquid) //кружка и человек
      liquid -= ml;
    else
      liquid = 0;
  }
}

class Person {
  void drinkFromCup(Cup cup, int ml) {
    cup.drink(ml);
  }
}

class Wardrobe {
  List<String> items = [];

  void put(String item) {
    items.add(item); // Шкаф
  }

  String? take(String item) {
    if (items.contains(item)) {
      items.remove(item);
      return item;
    }
    return null;
  }
}

class Plate {
  int weight;
  Plate(this.weight);
}

class Barbell {
  // Гриф и Блин
  int maxWeight;
  int leftWeight = 0;
  int rightWeight = 0;

  Barbell(this.maxWeight);

  bool addLeft(Plate p) {
    if (leftWeight + rightWeight + p.weight <= maxWeight) {
      leftWeight += p.weight;
      return true;
    }
    return false;
  }

  bool addRight(Plate p) {
    if (leftWeight + rightWeight + p.weight <= maxWeight) {
      rightWeight += p.weight;
      return true;
    }
    return false;
  }

  int getTotalWeight() => leftWeight + rightWeight;
}

class Converter {
  double usdToRub = 90;
  double eurToRub = 100;
  // Конвертер валют
  double convert(double amount, String from, String to) {
    double rub;

    if (from == "USD") {
      rub = amount * usdToRub;
    } else if (from == "EUR") {
      rub = amount * eurToRub;
    } else {
      rub = amount;
    }

    if (to == "USD") {
      return rub / usdToRub;
    } else if (to == "EUR") {
      return rub / eurToRub;
    } else {
      return rub;
    }
  }
}

class Garage<T> {
  List<T> items = [];

  void add(T item) {
    items.add(item);
  } //Гараж с дженериками

  T? get(int i) {
    if (i >= 0 && i < items.length) {
      return items[i];
    }
    return null;
  }
}

class MyNumber {
  int value;

  MyNumber(this.value); // Перегрузка операций

  MyNumber operator +(MyNumber other) {
    return MyNumber(value + other.value);
  }

  MyNumber operator -(MyNumber other) {
    return MyNumber(value - other.value);
  }

  MyNumber operator *(MyNumber other) {
    return MyNumber(value * other.value);
  }

  MyNumber operator /(MyNumber other) {
    return MyNumber(value ~/ other.value); // целочисленное деление
  }
}

enum CarState { stop, drive, turn }

class Car {
  CarState state = CarState.stop;

  void go() => state = CarState.drive; //Автомобиль с перечислениями
  void stop() => state = CarState.stop;
  void turn() => state = CarState.turn;
}

class Shape {
  double area() => 0;
}

class Rect extends Shape {
  //Геометрические фигуры
  double w, h;
  Rect(this.w, this.h);

  @override
  double area() => w * h;
}

class Circle extends Shape {
  double r;
  Circle(this.r);

  @override
  double area() => 3.14159 * r * r;
}

class Triangle extends Shape {
  double b, h;
  Triangle(this.b, this.h);

  @override
  double area() => 0.5 * b * h;
}

class BaseConverter {
  static String convert(String number, int fromBase, int toBase) {
    int decimalValue = int.parse(
      number,
      radix: fromBase,
    ); // Конвертер систем счисления
    return decimalValue.toRadixString(toBase);
  }
}

class ShapeList {
  List<Shape> shapes = [];

  void add(Shape s) {
    shapes.add(s); // Список фигур с поиском максимальной площади
  }

  Shape? getMaxArea() {
    if (shapes.isEmpty) return null;

    Shape max = shapes[0];
    for (var s in shapes) {
      if (s.area() > max.area()) {
        max = s;
      }
    }
    return max;
  }
}

class Utensil {
  String name;
  Utensil(this.name);
}

class Fork extends Utensil {
  //Стол и столовые приборы
  Fork() : super("Вилка");
}

class Spoon extends Utensil {
  Spoon() : super("Ложка");
}

class Knife extends Utensil {
  Knife() : super("Нож");
}

class Table {
  List<Utensil> utensils = [];

  void put(Utensil u) {
    utensils.add(u);
  }

  Utensil? take(String name) {
    for (var u in utensils) {
      if (u.name == name) {
        utensils.remove(u);
        return u;
      }
    }
    return null;
  }
}

void main() {
  print("1. Кружка и человек");
  Cup cup = Cup();
  Person person = Person();
  person.drinkFromCup(cup, 100);
  print("В кружке осталось: ${cup.liquid} мл");

  print("\n2. Шкаф");
  Wardrobe w = Wardrobe();
  w.put("Книга");
  w.put("Ручка");
  String? taken = w.take("Книга");
  if (taken != null) {
    print("Взяли: $taken");
  } else {
    print("Не нашли");
  }

  print("\n3. Гриф и блины");
  Barbell barbell = Barbell(100);
  Plate plate1 = Plate(20);
  Plate plate2 = Plate(20);
  barbell.addLeft(plate1);
  barbell.addRight(plate2);
  print("Общий вес на грифе: ${barbell.getTotalWeight()} кг");

  print("\n4. Конвертер валют");
  Converter conv = Converter();
  double resultConv = conv.convert(100, "USD", "RUB");
  print("100 USD в RUB: $resultConv");

  print("\n5. Гараж");
  Garage<String> garage = Garage<String>();
  garage.add("Машина");
  garage.add("Мотоцикл");
  print("В гараже: ${garage.get(0)}");

  print("\n6. Перегрузка операций");
  MyNumber num1 = MyNumber(10);
  MyNumber num2 = MyNumber(3);
  MyNumber sum = num1 + num2;
  MyNumber diff = num1 - num2;
  print("10 + 3 = ${sum.value}");
  print("10 - 3 = ${diff.value}");

  print("\n7. Автомобиль");
  Car car = Car();
  car.go();
  print("Состояние: ${car.state}");

  print("\n8. Фигуры");
  Rect rect = Rect(5, 4);
  Circle circle = Circle(3);
  print("Площадь прямоугольника: ${rect.area()}");
  print("Площадь круга: ${circle.area()}");

  print("\n 9. Конвертер систем счисления");
  String baseResult = BaseConverter.convert("FF", 16, 10);
  print("FF(16) -> $baseResult(10)");

  print("\n10. Максимальная площадь");
  ShapeList shapeList = ShapeList();
  shapeList.add(Rect(5, 5));
  shapeList.add(Circle(10));
  shapeList.add(Triangle(4, 6));
  Shape? maxShape = shapeList.getMaxArea();
  if (maxShape != null) {
    print("Макс площадь: ${maxShape.area()}");
  }

  print("\n11. Стол и приборы");
  Table table = Table();
  table.put(Fork());
  table.put(Spoon());
  Utensil? takenUtensil = table.take("Вилка");
  if (takenUtensil != null) {
    print("Взяли со стола: ${takenUtensil.name}");
  }

  print("\nВсе задания выполнены!");
}
