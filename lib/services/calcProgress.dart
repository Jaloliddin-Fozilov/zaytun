double calculateProgress(int max, int process) {
  if (max == 0 && process == 0) {
    return 0;
  }
  return (process * 100 / max) / 100;
}
