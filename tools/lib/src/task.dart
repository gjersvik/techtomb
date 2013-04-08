part of tools;

abstract class Task {
  final String name;

  Task(this.name);

  void run(ArgResults results);
}
