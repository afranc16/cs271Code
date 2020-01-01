
int bigStorage[100000] = {42};  //take up some space in object file

int getNum() {
    return bigStorage[0];
}

int getOtherNum() {
    return 7;
}

int getBiggerNum() {
    int temp = getNum();
    temp += getOtherNum();
    return temp;
}
