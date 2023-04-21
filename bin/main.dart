void main() {
  print('asjhdaksjahd'.split(''));
  fibonacci(5);
}

void fibonacci(int n) {
  int c = 1;
  int p = 1;
  int r = 1;
  do {
    r = p + c;
    p = c;
    c = r;
  } while (r <= n);
}
