//Sums the first n multiples of 2
int sumNumbers(int n) {
	int total = 0;
	int i = 0;
	while(i <= n) {
		total += i * 2;
		i++;
	}
	return total;
}

int get100() {
	return 100; 
}


int addOne(int x) {
	return x + 1;
}


int main() {
	
    int x = 2;  		//not needed
	x = addOne(x);

	int y = get100();
	int z = sumNumbers(y);

	return z;

}