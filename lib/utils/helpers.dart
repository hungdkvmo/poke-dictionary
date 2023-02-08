String slice(String str, int len) {
  if (str.isEmpty) {
    str = '';
  }
  if (len < 0 || len.isNaN) {
    len = 0;
  }
  int strLen = str.length;
  return str.substring(strLen - len, strLen);
}
