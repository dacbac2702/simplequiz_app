// Create our question model
// Create a simple class
class Question {
  // Define how a question will look like
  // Every question will have an ID.
  final String id;
  // Every question will have a title, it's the question itself.
  final String title;
  // Every question will have options.
  final Map<String, bool> options;
  // Options will be like - {'1':true, '2':false} = something like these

  // Create a constructor
  Question({
    required this.id,
    required this.title,
    required this.options,
  });

  // Override the toString method to print the questions on console
  @override
  String toString() {
    return 'Question(id: $id, title: $title, options: $options)';
  }
}
