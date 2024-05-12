int main() {
    int tmp = 0;
    int list[] = {1, 2, 3, 4, 5};

    for (int i = 0; i < 5; i++) {
        list[i] = list[i] << 2;
        tmp += list[i];
    }

   // printf("tmp: %d\n", tmp);

    return 0;
}
