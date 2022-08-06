class Calculator {
    public:
    int sum(int a, int b) { return a + b; }
    int sub(int a, int b) { return a - b; }
};

int main(){
    Calculator calc;

    int a = 1, b = 2;
    int result = calc.sum(a, b);

    int k = calc.sub(a, b);

    return 0;
}
