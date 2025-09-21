
print("Привет! Это калькулятор")


num1 = float(input("Введите первое число: "))
num2 = float(input("Введите второе число: "))


print("Выберите операцию:")
print("+ - сложение")
print("- - вычитание")
print("* - умножение")
print("/ - деление")

operation = input("Введите знак операции: ")


if operation == "+":
    result = num1 + num2
    print(f"Результат: {num1} + {num2} = {result}")

elif operation == "-":
    result = num1 - num2
    print(f"Результат: {num1} - {num2} = {result}")

elif operation == "*":
    result = num1 * num2
    print(f"Результат: {num1} * {num2} = {result}")

elif operation == "/":

    if num2 != 0:
        result = num1 / num2
        print(f"Результат: {num1} / {num2} = {result}")
    else:
        print("Ошибка: нельзя делить на ноль!")

else:
    print("Ошибка: такой операции нет!")


print("\n Дополнительные проверки ")


if num1 > 0 and num2 > 0:
    print("Оба числа положительные")


if num1 > 100 or num2 > 100:
    print("Хотя бы одно число больше 100")


if not (num1 == 0):
    print("Первое число не равно нулю")
else:
    print("Первое число равно нулю")

print("Работа калькулятора завершена!")
