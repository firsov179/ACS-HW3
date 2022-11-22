#include <stdio.h>
#include <math.h>

void files_input(double *x, char **argv) {
    FILE *stream = fopen(argv[1], "r");
    fscanf(stream, "%lf", x);                                // Считываем x
    fclose(stream);
}

void random_input(double *x) {
    srand(time(NULL));
    *x = (double)(rand() % 10000) / 100;
}

void console_input(double *x) {
    scanf("%lf", x);                                // Считываем x
}

void files_print(const double *x, const double *res, char **argv) {
    FILE *stream = fopen(argv[2], "w");
    fprintf(stream, "sin(%lf) ~= %lf.\n", *x, *res);         // Сообщение вывода
    fclose(stream);
}

void console_print(const double *x, const double *res) {
    printf("sin(%lf) ~= %lf.\n", *x, *res);         // Сообщение вывода
}

void getAns(double x, double *res) {
    int k = (int)(x / (2 * M_PI));                        // Приводим к значению от 0 до 2 * Pi
    if (k > 0) {
        x = x - 2 * M_PI * k;
    } else {
        x = x - 2 * M_PI * (k - 1);
    }
    *res = x;
    double cur_num = x;                                   // Текущий член степенного ряда
    int i = 1;
    while (cur_num > 1e-8 || cur_num < -1e-8) {            // Обновляем результат, если изменения все еще > точности
        cur_num *= -1;
        cur_num *= x * x;                                // Числитель (-1)^n * x^(2n + 1)
        cur_num /= (2 * i) * (2 * i + 1);                  // Знаменатель (2n + 1)!
        ++i;
        *res += cur_num;
    }
}

int main(int argc, char **argv) {
    double x;
    double res;
    if (argc == 3) {
        files_input(&x, argv);
        getAns(x, &res);
        files_print(&x, &res, argv);
    } else if (argc == 1) {
        random_input(&x);
        getAns(x, &res);
        console_print(&x, &res);
    } else if (argc == 2) {
        console_input(&x);
        getAns(x, &res);
        console_print(&x, &res);
    } else if (argc == 4) {
        files_input(&x, argv);
        for (int i = 0; i < 1e8; ++i) {
            getAns(x, &res);
        }
        files_print(&x, &res, argv);
    }else {
        printf("Something wrong!\n You should set names of two files.\n");
    }
    return 0;
}
