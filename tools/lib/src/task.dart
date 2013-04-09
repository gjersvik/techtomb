part of tools;

abstract class Task {
  final String name;

  Task(this.name);

  void setup(ArgParser parser);
  Future<int> run(ArgResults results);
}
