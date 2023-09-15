
class QuestionsModel{

  String id;
  String courseId;
  String? question;
  List<Map<String, bool>>? options;
  DateTime timestamp;

  // the constructor for this class 
  QuestionsModel({required this.id,required this.courseId, required this.question, required this.options, required this.timestamp});

}
