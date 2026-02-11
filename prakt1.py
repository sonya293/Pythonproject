import os


class Book:
    def __init__(self, title, author):
        self.title = title
        self.author = author
        self.__available = True 

    def get_status(self):
        return "доступна" if self.__available else "выдана"

    def is_available(self):
        return self.__available

    def take(self):
        if self.__available:
            self.__available = False
            return True
        return False

    def back(self):
        self.__available = True


class Person:
    def __init__(self, name):
        self.name = name


class User(Person):  
    def __init__(self, name):
        super().__init__(name)
        self.my_books = []  


class Librarian(Person): 
    pass



def load_books():
    books = []
    if not os.path.exists("books.txt"):
        return books
    with open("books.txt", "r", encoding="utf-8") as f:
        for line in f:
            data = line.strip().split("|")
            if len(data) == 3:
                b = Book(data[0], data[1])
                if data[2] == "выдана":
                    b._Book__available = False
                books.append(b)
    return books


def save_books(books):
    with open("books.txt", "w", encoding="utf-8") as f:
        for b in books:
            f.write(f"{b.title}|{b.author}|{b.get_status()}\n")


def load_users():
    users = []
    if not os.path.exists("users.txt"):
        return users
    with open("users.txt", "r", encoding="utf-8") as f:
        for line in f:
            data = line.strip().split("|")
            if len(data) == 2:
                u = User(data[0])
                if data[1]:
                    u.my_books = data[1].split(",")
                users.append(u)
    return users


def save_users(users):
    with open("users.txt", "w", encoding="utf-8") as f:
        for u in users:
            books_str = ",".join(u.my_books)
            f.write(f"{u.name}|{books_str}\n")


def load_librarians():
    libs = []
    if not os.path.exists("librarians.txt"):
        return libs
    with open("librarians.txt", "r", encoding="utf-8") as f:
        for line in f:
            libs.append(Librarian(line.strip()))
    return libs


def save_librarians(librarians):
    with open("librarians.txt", "w", encoding="utf-8") as f:
        for lib in librarians:
            f.write(lib.name + "\n")



def main():
    books = load_books()
    users = load_users()
    librarians = load_librarians()
    
    if not librarians:
        librarians.append(Librarian("admin"))
        save_librarians(librarians)

    while True:
        print("\n" + "=" * 40)
        print("БИБЛИОТЕКА")
        print("1. Войти как библиотекарь")
        print("2. Войти как пользователь")
        print("0. Выход")
        
        choice = input("Выберите: ")
        
        if choice == "0":
            save_books(books)
            save_users(users)
            save_librarians(librarians)
            print("Данные сохранены. До свидания!")
            break
        
        elif choice == "1":
            name = input("Ваше имя: ")
            
            current_lib = None
            for lib in librarians:
                if lib.name == name:
                    current_lib = lib
                    break
            if not current_lib:
                current_lib = Librarian(name)
                librarians.append(current_lib)
                save_librarians(librarians)
            
            print(f"\nБиблиотекарь: {current_lib.name} ")
            
            while True:
                print("\nМеню Библиотекаря:")
                print("1. Добавить книгу")
                print("2. Удалить книгу")
                print("3. Зарегистрировать пользователя")
                print("4. Список пользователей")
                print("5. Список всех книг")
                print("0. Назад")
                
                cmd = input("Выберите: ")
                
                if cmd == "0":
                    break
                
              
                elif cmd == "1":
                    title = input("Название: ")
                    author = input("Автор: ")
                    books.append(Book(title, author))
                    save_books(books)
                    print("✓ Книга добавлена")
                
                elif cmd == "2":
                    title = input("Название книги для удаления: ")
                    found = False
                    for b in books[:]: 
                        if b.title == title:
                            if not b.is_available():
                                print("✗ Нельзя удалить — книга выдана")
                                found = True
                                break
                            books.remove(b)
                            save_books(books)
                            print("✓ Книга удалена")
                            found = True
                            break
                    if not found:
                        print("✗ Книга не найдена")
                elif cmd == "3":
                    name = input("Имя пользователя: ")
                    users.append(User(name))
                    save_users(users)
                    print("✓ Пользователь зарегистрирован")
                elif cmd == "4":
                    if not users:
                        print("Нет пользователей")
                    else:
                        print("\nПользователи:")
                        for i, u in enumerate(users, 1):
                            print(f"{i}. {u.name} (книг: {len(u.my_books)})")
                elif cmd == "5":
                    if not books:
                        print("Нет книг")
                    else:
                        print("\nВсе книги:")
                        for i, b in enumerate(books, 1):
                            print(f"{i}. {b.title} - {b.author} ({b.get_status()})")
                else:
                    print("Неверный ввод")
        elif choice == "2":
            if not users:
                print("Нет пользователей. Сначала зарегистрируйтесь у библиотекаря.")
                continue
            print("\nВыберите пользователя:")
            for i, u in enumerate(users, 1):
                print(f"{i}. {u.name}")
            try:
                num = int(input("Номер: ")) - 1
                if num < 0 or num >= len(users):
                    print("Неверный номер")
                    continue
                current_user = users[num]
            except:
                print("Ошибка ввода")
                continue
            print(f"\n--- Пользователь: {current_user.name} ---")
            while True:
                print("\nМЕНЮ ПОЛЬЗОВАТЕЛЯ:")
                print("1. Доступные книги")
                print("2. Взять книгу")
                print("3. Вернуть книгу")
                print("4. Мои книги")
                print("0. Назад")
                
                cmd = input("Выберите: ")
                
                if cmd == "0":
                    break
                
               
                elif cmd == "1":
                    available = [b for b in books if b.is_available()]
                    if not available:
                        print("Нет доступных книг")
                    else:
                        print("\nДоступные книги:")
                        for i, b in enumerate(available, 1):
                            print(f"{i}. {b.title} - {b.author}")

                elif cmd == "2":
                    title = input("Название книги: ")
                    found = False
                    for b in books:
                        if b.title == title:
                            if b.take():
                                current_user.my_books.append(b.title)
                                save_users(users)
                                save_books(books)
                                print("✓ Книга выдана")
                            else:
                                print("✗ Книга уже выдана")
                            found = True
                            break
                    if not found:
                        print("✗ Книга не найдена")
                

                elif cmd == "3":
                    title = input("Название книги: ")
                    if title in current_user.my_books:
                        for b in books:
                            if b.title == title:
                                b.back()
                                current_user.my_books.remove(title)
                                save_users(users)
                                save_books(books)
                                print("✓ Книга возвращена")
                                break
                    else:
                        print("✗ У вас нет такой книги")
                
                elif cmd == "4":
                    if not current_user.my_books:
                        print("У вас нет книг")
                    else:
                        print("\nВаши книги:")
                        for i, title in enumerate(current_user.my_books, 1):
                            print(f"{i}. {title}")
                
                else:
                    print("Неверный ввод")
        
        else:
            print("Неверный выбор")


if __name__ == "__main__":
    main()