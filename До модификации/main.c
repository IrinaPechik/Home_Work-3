#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>

extern double task(double x, double accuracy);
extern double task_rnd();

int main(int argc, char* argv[]) {
    // Параметр x;
    double x;
    // Точность.
    double accuracy;

    // Ввод из командной строки или из файла.
    if (argc == 4) {
        // Ввод данных из аргументов командной строки.
        if (atoi(argv[1]) == 1) {
            sscanf(argv[2], "%lf", &x);
            if (x < 0 || x > 360) {
                printf("Input error! 0 <= x <= 360. To continue, press any key.\n");
                getchar();
                return 0;
            }
            sscanf(argv[3], "%lf", &accuracy);
            // Проверка точности.
            if (accuracy <= 0 || accuracy > 100) {
                printf("Input error! 0 < accuracy <= 100. To continue, press any key.\n");
                getchar();
                return 0;
            }
            accuracy = accuracy / 100;
            // Запускаем таймер множественного зацикливания.
            time_t t_start = clock();
            for (int i = 0; i < 25000000; ++i) {
                task(x, accuracy);
            }
            time_t t_end = clock();
            printf("Time: %d ms", (int) (difftime(t_end, t_start)) / 1000);

            printf("\nResult: %lf\n", task(x, accuracy));
            return 0;
        }
        // Ввод из файла.
        if (atoi(argv[1]) == 2) {
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
        }
    }
    // Генератор случайных чисел или работа с консолью.
    if (argc == 2) {
        double result;
        FILE *output;
        printf("For random input - enter 1, for a console one - any other key\n");
        int choice = 0;
        scanf("%d", &choice);
        // Random.
        if (choice == 1) {
            // Открываем файл для записи (если такой файл ранее существовал -> перезаписываем).
            FILE* output = fopen(argv[1], "w");
            fprintf(output, "%lf\n", task_rnd());
            fclose(output);
            return 0;
        }

        // Пользователь работает с консолью, но результат - в файле.
        printf("Input the value of x in degrees: ");
        // Считываем x.
        scanf("%lf", &x);
        if (x < 0 || x > 360) {
            printf("Input error! 0 <= x <= 360. To continue, press any key.\n");
            getchar();
            return 0;
        }
        // Пользователь работает с консолью, но результат - в файле.
        printf("Input the value of accuracy: ");
        // Считаем точность вычислений.
        scanf("%lf", &accuracy);
        if (accuracy <= 0 || accuracy > 100) {
            printf("Input error! 0 < accuracy <= 100. To continue, press any key.\n");
            getchar();
            return 0;
        }
        accuracy = accuracy / 100;
        // Считаем результат.
        result = task(x, accuracy);
        // Открываем файл для записи (если такой файл ранее существовал -> перезаписываем).
        output = fopen(argv[1], "w");
        // Если файла не существует выводим соответствующее сообщение об ошибке.
        if (output == NULL) {
            printf("Error opening the file.To continue, press any key.\n");
            getchar();
            return 0;
        }
        // Выводим результат в файл.
        fprintf(output, "%lf\n", result);
        // Закрываем поток.
        fclose(output);
        printf("You can see result with your data in file\n");
        return 0;
    }
    return 0;
}
