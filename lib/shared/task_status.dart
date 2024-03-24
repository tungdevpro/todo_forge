enum TaskStatus {
  none('none'),
  inProccess('Proccess'),
  done('Done');

  const TaskStatus(this.title);

  final String title;
}

enum TaskSort {
  latest('Latest'),
  earliest('Earliest'),
  az('A-Z'),
  za('Z-A');

  const TaskSort(this.title);
  final String title;
}
