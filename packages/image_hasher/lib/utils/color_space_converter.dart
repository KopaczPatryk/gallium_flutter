int abgrToArgb(int abgrColor) {
  int r = (abgrColor >> 16) & 0xFF;
  int b = abgrColor & 0xFF;
  return (abgrColor & 0xFF00FF00) | (b << 16) | r;
}
