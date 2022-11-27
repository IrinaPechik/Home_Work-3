# Индивидуальное домашние задание №3 по "АВС" на тему "Арифметика с плавающей точкой" (на оценку 9)
Печик Ирина Юрьевна, БПИ-217, Вариант-7

# Как пользоваться программой:
### Cпособы ввода данных:
* __Ввод с использованием аргументов коммандной строки (вывод - консоль):__

     Ввести после указания исполняемого файла __1, аргумент x (в градусах°), точность вычисления (в процентах %)__ 
     
     ВАЖНО! x ∈ [0, 360], accuracy ∈ (0, 100], причём x, accuracy принадлежат множеству вещественных чисел.
     ```
     (./program.exe 1 x accuracy)
     ```    
     
* __Ввод из файла (вывод - файл):__

     Ввести после указания исполняемого файла __2, название входного файла, затем название выходного файла__ 
     ```
     (./program.exe 2 input.txt output.txt)
     ```
* __Рандомный ввод или консольный с выводом в файл__
  
     Ввести после указания исполняемого файла __название выходного файла__ 
     ```
     (./program.exe output.txt)
     ```
    Далее следовать инструкциям, которые разъясняет пользователю программа
    
# Решение на 4 балла:
### 1. Приведено решение на С:
---
* Главный файл: [main.c](https://github.com/IrinaPechik/Home_Work-3/blob/main/%D0%94%D0%BE%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/main.c)

* Файл с функцией для нахождения sin(x) разложением в ряд Тейлора [task.c](https://github.com/IrinaPechik/Home_Work-3/blob/main/%D0%94%D0%BE%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/task.c)  
---
### 2. В полученную ассемблерную программу, откомпилированную без оптимизирующих и отладочных опций, добавлены комментарии, поясняющие эквивалентное представление переменных в программе на C:

---
* Главный файл (не модифицированный): [main.s](https://github.com/IrinaPechik/Home_Work-3/blob/main/%D0%94%D0%BE%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/main.s)
* Файл с функцией для нахождения sin(x) разложением в ряд Тейлора (не модифицированный): [task.s](https://github.com/IrinaPechik/Home_Work-3/blob/main/%D0%94%D0%BE%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/task.s)
---
### 3. Из ассемблерной программы убраны лишние макросы за счет использования соответствующих аргументов командной строки:

* Из главного файла были убраны следующие строки:

```
1. Убрана строчка 49: endbr64
2. Убраны строчки 467, 477-494: 
    .size	main, .-main
	
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
```
  Получился модифицированный главный файл: [main_mod.s](https://github.com/IrinaPechik/Home_Work-3/blob/main/%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/main_mod.s)

* Из файла с функцией для нахождения sin(x) разложением в ряд Тейлора были убраны следующие строки:
```
 1. Убрана строчка 7: endbr64
 2. Убраны строчки 116, 158-175:
    .size	task_rnd, .-task_rnd
	
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
  ```
 
  Получился модифицированный файл с функцией: [task_mod.s](https://github.com/IrinaPechik/Home_Work-3/blob/main/%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/task_mod.s)
### 4.  Модифицированная ассемблерная программа отдельно откомпилирована и скомпонована без использования опций отладки:

Были использованы следующие команды:

```
gcc -masm=intel \
    -fno-asynchronous-unwind-tables \
    -fno-jump-tables \
    -fno-stack-protector \
    -fno-exceptions \
    ./main.c \
    -S -o ./main.s
    
gcc -masm=intel \
    -fno-asynchronous-unwind-tables \
    -fno-jump-tables \
    -fno-stack-protector \
    -fno-exceptions \
    ./task.c \
    -S -o ./task.s
```

```
gcc ./main.s task.s -o program.exe
```
### 5. Представлено полное тестовое покрытие, дающее одинаковый результат на обоих программах:
Программы отработали верно на следующих тестах и выдали одинаково верные результаты:
 
* Тест №1

  ```
  0
  0.01

  ```
  ![TEST#1 command str](https://user-images.githubusercontent.com/100044301/204127706-7b91725d-d1df-4161-80e6-2354ff4c32fb.png)


* Тест №2
  
    ```
    30
    0.01
    ```
    ![TEST#2 command str](https://user-images.githubusercontent.com/100044301/204127726-7d3b2b42-9480-4c43-a7e0-4ee33bc6e070.png)


    
* Тест №3
  
    ```
   45
   0.01
    ```
   ![TEST#3 command str](https://user-images.githubusercontent.com/100044301/204127745-a2d4ef1d-2de0-4863-a379-1fa7dc294dd0.png)


* Тест №4
   
    ```
    90
    0.001

    ```
    ![TEST#4 command str](https://user-images.githubusercontent.com/100044301/204127755-dee03794-a702-41d8-9bde-ee44b419c3a6.png)


   
 * Тест №5
   
    ```
    180
    0.0001

    ```
    ![TEST#5 command str](https://user-images.githubusercontent.com/100044301/204127768-ad575b75-9aca-48fc-9676-1d7fa33fee13.png)

    
 * Тест №6
   
    ```
    30.5
    0.01

    ```
    ![TEST#6 command str](https://user-images.githubusercontent.com/100044301/204127790-cd1d304e-2f8b-4d97-8e5a-8324afee3b63.png)

    
* Тест №7

    ```
    370
    0.001

    ```
    ![TEST#7 command str](https://user-images.githubusercontent.com/100044301/204127823-2a3bbd53-e40a-4957-b347-6d1000d15c17.png)


* Тест №8

  ```
  90
  0

  ```
  ![TEST#8 command str](https://user-images.githubusercontent.com/100044301/204127838-efd09145-b12d-4a37-b92c-0a3c81f2d517.png)
  
# Решение на 5 баллов:

### 1.  В реализованной программе использовать функции с передачей данных через параметры:
---

  В файле с функцией task: [task.c](https://github.com/IrinaPechik/Home_Work-3/blob/main/%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/task.c)
        
  Я передавала данные через параметры следующим образом:
  
  ```C
  double task(double x, double accuracy) 
  double task_rnd()
  
  ```
---
### 2.  Использовать локальные переменные:
---

* Локальные переменные в главной функции [main.c](https://github.com/IrinaPechik/Home_Work-3/blob/main/%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/main.c):

```C
    int i;
    double x;
    double accuracy;
    time_t t_start;
    time_t t_end;
    FILE *input;
    FILE* output;
    double result;
```

* Локальные переменные в функции [task.c](https://github.com/IrinaPechik/Home_Work-3/blob/main/%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/task.c)

```C
double s;
double d;
double n;
double x;
double accuracy;
```

---

### 3.  В ассемблерную программу при вызове функции добавить комментарии, описывающие передачу фактических параметров и перенос возвращаемого результата.
---

  * Главный файл: [main_mod.s](https://github.com/IrinaPechik/Home_Work-3/blob/main/%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/main_mod.s)
  * Файл task: [task_mod.s](https://github.com/IrinaPechik/Home_Work-3/blob/main/%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/task_mod.s)

---

### 4.  В функциях для формальных параметров добавить комментарии, описывающие связь между параметрами языка Си и регистрами (стеком).
---

  * Главный файл: [main_mod.s](https://github.com/IrinaPechik/Home_Work-3/blob/main/%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/main_mod.s)
  * Файл task: [task_mod.s](https://github.com/IrinaPechik/Home_Work-3/blob/main/%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/task_mod.s)

---
# Решение на 6 баллов
### 1. Рефакторинг программы на ассемблере за счет максимального использования регистров процессора. Добавление этой программы к уже представленным:

---


* В главной функции [main_mod.s](https://github.com/IrinaPechik/Home_Work-3/blob/main/%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/main_mod.s)

	* Добавлен r12d вместо i (35 строка в main.c)	

* В функции для подсчёта sin(x) разложением в ряд Тейлора [task_mod.s](https://github.com/IrinaPechik/Home_Work-3/blob/main/%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/task_mod.s)

	 * Добавлен r13d вместо переменной-итератора n в цикле for в task(double x, double accuracy)
   
---

### 2. Добавление комментариев в разработанную программу, поясняющих эквивалентное использование регистров вместо переменных исходной программы на C:

---

* Главный файл: [main_mod.s](https://github.com/IrinaPechik/Home_Work-3/blob/main/%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/main_mod.s)
* Файл task: [task_mod.s](https://github.com/IrinaPechik/Home_Work-3/blob/main/%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/task_mod.s)

---

### 3. Представление результатов тестовых прогонов для разработанной программы. Оценка корректности ее выполнения на основе сравнения тестовых прогонов результатами тестирования предшествующих программ:

Программы отработали верно на следующих тестах и выдали одинаково верные результаты:
 
* Тест №1

  ```
  0
  0.01

  ```
  ![TEST#1 mod command str](https://user-images.githubusercontent.com/100044301/204128854-dfbb519c-0524-4c11-98cf-c63039a31cca.png)


* Тест №2
  
    ```
    30
    0.01
    ```
    ![TEST#2 mod command str](https://user-images.githubusercontent.com/100044301/204128871-b52225a1-5bfe-4b62-a54f-4b8a60bdcc56.png)


    
* Тест №3
  
    ```
   45
   0.01
    ```
   
    ![TEST#3 mod command str](https://user-images.githubusercontent.com/100044301/204128881-7e95b13d-9d57-4a38-87ba-367e05d671e1.png)


* Тест №4
   
    ```
    90
    0.001

    ```
    ![TEST#4 mod command str](https://user-images.githubusercontent.com/100044301/204128890-4ddfa749-2819-44c2-82ff-df7c8540e2b4.png)



   
 * Тест №5
   
    ```
    180
    0.0001

    ```
    ![TEST#5 mod command str](https://user-images.githubusercontent.com/100044301/204128894-12b2b01a-e942-4c8e-a79e-fb3a28aef6aa.png)

    
 * Тест №6
   
    ```
    30.5
    0.01

    ```
    ![TEST#6 mod command str](https://user-images.githubusercontent.com/100044301/204128905-2ef55f37-61a8-41a7-97d0-2e5e8a86490d.png)

    
* Тест №7

    ```
    370
    0.001

    ```
    ![TEST#7 mod command str](https://user-images.githubusercontent.com/100044301/204128907-2d70e56e-613a-4336-862f-0bc9f84fb19c.png)



* Тест №8

  ```
  90
  0

  ```
  ![TEST#8 mod command str](https://user-images.githubusercontent.com/100044301/204128912-a029092e-159a-4651-a99d-1743302bf83b.png)

  

### 4. Сопоставление размеров программы на ассемблере, полученной после
компиляции с языка C с модифицированной программой, использующей
регистры.
  * В программе после модификации ~ 570 строк кода. При этом ее вес составляет 14 KiB.
  * В программе до модификации ~ 611 строк кода. При этом ее вес составляет 14.67 KiB.
  
# Решение на 7 баллов:

### 1.  Реализация программы на ассемблере, полученной после рефакторинга, в виде двух или более единиц компиляции.
---
Две единицы компиляции:
    
* Главная функция: [main_mod.s](https://github.com/IrinaPechik/Home_Work-3/blob/main/%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/main_mod.s)

* Функция task: [task_mod.s](https://github.com/IrinaPechik/Home_Work-3/blob/main/%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/task_mod.s)
---

### 2. Задание файлов с исходными данными и файла для вывода результатов с использованием аргументов командной строки.
---
* Главная функция: [main.с](https://github.com/IrinaPechik/Home_Work-3/blob/main/%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/main.c)

Добавили в main: 
```С
// Открываем уже существующий файл для чтения.
            FILE *input = fopen(argv[2], "r");
            // Если файла не существует выводим соответствующее сообщение об ошибке.
            if (input == NULL) {
                printf("Error opening the file.To continue, press any key.\n");
                getchar();
                return 0;
            }
            // Читаем из файла x.
            fscanf(input, "%lf", &x);
            // Читаем из файла accuracy.
            fscanf(input, "%lf", &accuracy);
            // Закрываем поток.
            fclose(input);

            // Открываем файл для записи (если такой файл ранее существовал -> перезаписываем).
            FILE* output = fopen(argv[3], "w");
            // Если файла не существует выводим соответствующее сообщение об ошибке.
            if (output == NULL) {
                printf("Error opening the file.To continue, press any key.\n");
                getchar();
                return 0;
            }
            if (x < 0 || x > 360) {
                fprintf(output, "%s", "Input error! 0 <= x <= 360. To continue, press any key.\n");
                getchar();
                return 0;
            }
            if (accuracy <= 0 || accuracy > 100) {
                fprintf(output, "%s", "Input error! 0 < accuracy <= 100.\n");
                return 0;
            }
            accuracy = accuracy / 100;
            // Записываем результат в файл.
            fprintf(output, "%lf\n", task(x, accuracy));
            return 0;
        // Закрываем поток.
        fclose(output);
```

* Функция task: [task.с](https://github.com/IrinaPechik/Home_Work-2/blob/main/%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/task.c)
 
 #### Прогон на тестах:
 
Тип входных данных: вещественное число x ∈ [0, 360]  + вещественное число accuracy  ∈ (0, 100];
Тип выходных данных: вещественное число - sin(x), вычисленный с заданной точностью accuracy

Входные данные из консоли -> выходные из консоли
Входные данные из файла -> выходные в файле
Более подробные правила вывода смотреть в начале.
![Test 1 File](https://user-images.githubusercontent.com/100044301/204129753-c71b8451-6d52-4457-995b-532b2fd383be.png)
![Test 2 File](https://user-images.githubusercontent.com/100044301/204129744-35287a58-639d-409f-bc37-73c3e0a9a83c.png)
![Test 3 File](https://user-images.githubusercontent.com/100044301/204129746-622d39ea-5815-40f9-8d48-aeb4d36ba15c.png)
![Test 4 File](https://user-images.githubusercontent.com/100044301/204129748-c2dcd4ca-148a-4641-b47e-84bc262f6e4d.png)
![Test 5 File](https://user-images.githubusercontent.com/100044301/204129749-a019f84f-ff51-4197-9c77-86c18726798e.png)
![Test 6 File](https://user-images.githubusercontent.com/100044301/204129750-af59727c-74af-4989-a1ff-965e2d563d5c.png)
![Test 7 File](https://user-images.githubusercontent.com/100044301/204129751-0d815dd5-ca17-4055-a818-4ee5bc655c7c.png)


Набор данных тестов: [tests](https://github.com/IrinaPechik/Home_Work-3/tree/main/tests)

---

# Решение на 8 баллов:

### 1. Добавление в программу генератора случайных наборов данных, расширяющих возможности тестирования:
---
* Главная функция: [main.с](https://github.com/IrinaPechik/Home_Work-3/blob/main/%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/main.c)
Добавили в task: 
```С
   double task_rnd() {
    double x, accuracy;
    srand(clock());
    // Генерируем x на отрезке [0, 360].
    x = (double)rand()/(double)RAND_MAX * 360;

    // Генерируем accuracy на отрезке [0.00000001, 100].
    accuracy = (double)rand()/(double)RAND_MAX * (100 - 0.00000001) + 0.00000001;
    printf("Generated data:\nx = %lf\naccuracy(in percentages) = %lf\nYou can see result in file\n", x, accuracy);
    // Считаем результат вызовом основной функции.
    return task(x, accuracy/100);
}
```

* Функция task: [task.с](https://github.com/IrinaPechik/Home_Work-3/blob/main/%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/task.c)

Корректно пройдено тестирование:
![Test random 1](https://user-images.githubusercontent.com/100044301/204129889-002309bf-8463-4da0-a1d8-4ccef24b6f00.png)
![Test random 2](https://user-images.githubusercontent.com/100044301/204129886-47b0a651-b495-4468-95f3-047f1de8ab89.png)
![Test random 3](https://user-images.githubusercontent.com/100044301/204129887-2ce07f1a-85ac-48f3-b2d8-9fe4eede4ca4.png)
---

### 2. Генератор подключен к программе с выбором в командной строке варианта ввода данных:

* Главная функция: [main.с](https://github.com/IrinaPechik/Home_Work-3/blob/main/%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/main.c)
Добавили в task: 
* Функция task: [task.с](https://github.com/IrinaPechik/Home_Work-3/blob/main/%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/task.c)

Если количество элементов введённых в консоль равно:
  * 4 => консольный ввод / файловый ввод. Для консольного ввода вписать вторым аргументом "1", для файлового "2"
  * 2 => рандом / консоль 
  
    ```С
    if (argc == 4) {
        // Ввод данных из аргументов командной строки.
        if (atoi(argv[1]) == 1) {};
        // Ввод из файла.
        if (atoi(argv[1]) == 2) {};
    }
    if (argc == 2) {}
    ```
  
 ### 3. Добавены замеры во времени, которые не учитывают время ввода и вывода данных.
* Главная функция: [main.с](https://github.com/IrinaPechik/Home_Work-3/blob/main/%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/main.c)
* Функция task: [task.с](https://github.com/IrinaPechik/Home_Work-3/blob/main/%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/task.c)

Добавили в main:
```C
time_t t_start = clock();
            for (int i = 0; i < 25000000; ++i) {
                task(x, accuracy);
            }
            time_t t_end = clock();
            printf("Time: %d ms", (int) (difftime(t_end, t_start)) / 1000);
```
По результатом замеров, было выявлено, что модифицированная программа работает быстрее (примерно в 1.5 раза):

  * Не модифицированная (1)
  
  ![TEST#1 NOT mod command str](https://user-images.githubusercontent.com/100044301/204130176-250ab3c0-082c-4296-ac5c-03f4aa1cb4ca.png)

  * Модифицированная (1)
  
  ![TEST#1 mod command str](https://user-images.githubusercontent.com/100044301/204130181-29153e84-4aee-481b-9026-5ddcdcd26b5d.png)

  * Не модифицированная (2)
  
  ![TEST#2 NOT mod command str](https://user-images.githubusercontent.com/100044301/204130199-724edc0c-7f86-42c3-9d19-39292bf85f4a.png)

  * Модифицированная (2)
  
  ![TEST#2 mod command str](https://user-images.githubusercontent.com/100044301/204130203-647b92cd-c03b-4f7a-bcc2-603fc9275344.png)

  * Не модифицированная (3)
  
  ![TEST#3 NOT mod command str](https://user-images.githubusercontent.com/100044301/204130237-fc0a660c-c3ce-41f3-b1b5-bafdba94e16a.png)

  * Модифицированная (3)
  
  ![TEST#3 mod command str](https://user-images.githubusercontent.com/100044301/204130240-417f1d3e-60e1-477d-a30d-0fbae67189e5.png)

  * Не модифицированная (4)
  
  ![TEST#4 NOT mod command str](https://user-images.githubusercontent.com/100044301/204130249-2cca8acd-1b7c-4c7b-833a-7ab5d816d0d3.png)

  * Модифицированная (4)
  
  ![TEST#4 mod command str](https://user-images.githubusercontent.com/100044301/204130254-321174d8-93dc-4ef7-a072-46dc2eb2ae44.png)

  * Не модифицированная (5)
  
  ![TEST#5 NOT mod command str](https://user-images.githubusercontent.com/100044301/204130262-27469489-c31a-412c-9ebd-073470c28278.png)

  * Модифицированная (5)
  
  ![TEST#5 mod command str](https://user-images.githubusercontent.com/100044301/204130260-ac0a619f-ca0a-4e45-8c0e-71b6733e6c22.png)

  * Не модифицированная (6)
  
  ![TEST#6 NOT mod command str](https://user-images.githubusercontent.com/100044301/204130268-3e9bb9c2-8deb-45d6-8888-ac508c7aadf3.png)

  * Модифицированная (6)
  
   ![TEST#6 mod command str](https://user-images.githubusercontent.com/100044301/204130270-69edebee-2f7c-480c-8b0f-0241e93eba41.png)
   
# Решение на 9 баллов:
  
  Сравнение веса и скорости программы до и после модификации:
  | Программа          | Количество строк| Скорость | Вес(KiB)| Опции отладки|
  |--------------------|-----------------|----------|------   |--------------|
  |Ассемблер (мод.)    |    554          |   786    | 14,8    |     -        |
  |C                   |    524          |   770    | 9,2     |     -O       |
  |C                   |    553          |   715    | 14,6    |     -O2      |
  |C                   |    553          |   721    | 9,7     |     -O3      |
  |C                   |    453          |   714    | 7.9     |     -Os      |
  
  Я использовала оптимизации:
  * По весу: -Os
  * По скорости: -O2, -O3
  
 ### Вывод из данной таблицы:
  * Размеры всех исполняемых файлов не сильно разнятся, ведь runtime занимает везде наибольшее место в памяти
  * -Os оптимизирует производительность и вес, и так вышло, что скорость тоже
  * -O2 довольно заметно сокращает время работы программы


  
