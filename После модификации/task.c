#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>

double task(double x, double accuracy) {
    // Переведём x из градусов в радианы.
    x = x * M_PI / 180;
    // Для вычисления используем ряд Тейлора.
    double s = x;
    double d = x;
    for(int n = 3; fabs(d) > accuracy; n += 2)
        s += d *= -x*x/n/(n-1);
    return s;
}

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
