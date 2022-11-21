#include <stdio.h>
#include <math.h>

void ssss() {
    int i = 5;
    double x = i;
}

void read(double *x, char **argv) {
    FILE *stream = fopen(argv[1], "r");
    fscanf(stream, "%lf", x);                                // Считываем x
    fclose(stream);
}

void print(const double *x, const double *res, char **argv) {
    FILE *stream = fopen(argv[2], "r");
    fprintf(stream, "sin(%lf) ~= %lf.\n", *x, *res);         // Сообщение вывода
    fclose(stream);
}

void getAns(double x, double *res) {
    int k = (int) (x / (2 * M_PI));                        // Приводим к значению от 0 до 2 * Pi
    if (k > 0) {
        x = x - 2 * M_PI * k;
    } else {
        x = x + 2 * M_PI * -k + 1;
    }
    *res = x;
    double cur_num = x;                                   // Текущий член степенного ряда
    int i = 1;
    while (cur_num > 1e-7 || cur_num < -1e-7) {            // Обновляем результат, если изменения все еще > точности
        cur_num *= -1;
        cur_num *= x * x;                                // Числитель (-1)^n * x^(2n + 1)
        cur_num /= (2 * i) * (2 * i + 1);                  // Знаменатель (2n + 1)!
        ++i;
        *res += cur_num;
    }
}

int main(int argc, char **argv) {
    if (argc != 3) {
        printf("Something wrong!\n You should set names of two files.\n");
        return 0;
    }
    double x;
    double res;
    read(&x, argv);
    getAns(x, &res);
    print(&x, &res, argv);
}
