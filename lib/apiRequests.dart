import 'dart:convert';
import 'dart:io';
import 'package:grade_ease_app/main.dart';
import 'package:http/http.dart' as http;

String baseUrl = "gradeeasebackend.onrender.com";

Future<dynamic> signUpMentor({required fullname, required email,required password}) async {
  // try {
  http.Client client = http.Client();
  http.Response response = await client.post(
    Uri.https(baseUrl, "/mentors/signup"),
    body: json.encode({
      "fullname": fullname,
      "email": email,
      "password": password//subscriber, publisher
    }),
    headers: {
      "Content-Type": "application/json"
    },
  );
  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  print("The decoded respons ${decodedResponse}");
  return decodedResponse;
  
}


Future<dynamic> loginMentor({required email, required password}) async {
  // try {
  http.Client client = http.Client();
  http.Response response = await client.post(
    Uri.https(baseUrl, "/mentors/login"),
    body: json.encode({
      "email": email,
      "password": password,//subscriber, publisher
      "token": getX.read(constants.GETX_TOKEN)
    }),
    headers: {
      "Content-Type": "application/json"
    },
  );
  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  return decodedResponse;
  
}

Future<dynamic> signUpStudent({required fullname}) async {
  // try {
  http.Client client = http.Client();
  http.Response response = await client.post(
    Uri.https(baseUrl, "/students/signup"),
    body: json.encode({
      "fullname": fullname,
      "token": getX.read(constants.GETX_TOKEN)
    }),
    headers: {
      "Content-Type": "application/json"
    },
  );
  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  return decodedResponse;
  
}

Future<dynamic> loginStudent({required student_id}) async {
  // try {
  http.Client client = http.Client();
  http.Response response = await client.post(
    Uri.https(baseUrl, "/students/login"),
    body: json.encode({
      "student_id": student_id,
    }),
    headers: {
      "Content-Type": "application/json"
    },
  );
  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  return decodedResponse;
  
}

Future<dynamic> allStudents() async {
  // try {
  http.Client client = http.Client();
  http.Response response = await client.post(
    Uri.https(baseUrl, "/students/allStudents"),
    body: json.encode({
      "token": getX.read(constants.GETX_TOKEN)
    }),
    headers: {
      "Content-Type": "application/json"
    },
  );
  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  return decodedResponse;
  
}

Future<dynamic> searchStudents({required query}) async {
  // try {
  http.Client client = http.Client();
  http.Response response = await client.post(
    Uri.https(baseUrl, "/students/searchStudent"),
    body: json.encode({
      "query": query,
      "token": getX.read(constants.GETX_TOKEN)
    }),
    headers: {
      "Content-Type": "application/json"
    },
  );
  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  return decodedResponse;
  
}

// Future<dynamic> updateProfilePic({required email, required password}) async {
//   // try {
//   http.Client client = http.Client();
//   http.Response response = await client.post(
//     Uri.https(baseUrl, "/stud/signup"),
//     body: json.encode({
//       "email": email,
//       "password": password,//subscriber, publisher
//       "token": getX.read(constants.GETX_TOKEN)
//     }),
//     headers: {
//       "Content-Type": "application/json"
//     },
//   );
//   dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
//   return decodedResponse;
  
// }

Future<dynamic> createExam({required title, required cutOff, required duration}) async {
  // try {
  http.Client client = http.Client();
  http.Response response = await client.post(
    Uri.https(baseUrl, "/exams/createExam"),
    body: json.encode({
      "title": title,
      "cutOff": cutOff,
      "duration":duration,
      "token": getX.read(constants.GETX_TOKEN)
    }),
    headers: {
      "Content-Type": "application/json"
    },
  );
  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  return decodedResponse;
  
}

Future<dynamic> fetchExam({required exam_id}) async {
  // try {
  http.Client client = http.Client();
  http.Response response = await client.post(
    Uri.https(baseUrl, "/exams/fetchExam"),
    body: json.encode({
      "exam_id": exam_id,
    }),
    headers: {
      "Content-Type": "application/json"
    },
  );
  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  return decodedResponse;
  
}

Future<dynamic> submitExam({required exam_id, required student_id, required score}) async {
  // try {
  http.Client client = http.Client();
  http.Response response = await client.post(
    Uri.https(baseUrl, "/exams/submitExam"),
    body: json.encode({
      "exam_id": exam_id,
      "student_id": student_id,
      "score": score
    }),
    headers: {
      "Content-Type": "application/json"
    },
  );
  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  return decodedResponse;
  
}

Future<dynamic> allExams() async {
  // try {
  http.Client client = http.Client();
  http.Response response = await client.post(
    Uri.https(baseUrl, "/exams/allExams"),
    body: json.encode({
      "token": getX.read(constants.GETX_TOKEN)
    }),
    headers: {
      "Content-Type": "application/json"
    },
  );
  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  return decodedResponse;
  
}


Future<dynamic> addExamQuestion({required exam_id, required questionText, required options}) async {
  // try {
  http.Client client = http.Client();
  http.Response response = await client.post(
    Uri.https(baseUrl, "/exams/addExamQuestion"),
    body: json.encode({
      "exam_id": exam_id,
      "questionText": questionText,
      "options": options 
    }),
    headers: {
      "Content-Type": "application/json"
    },
  );
  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  return decodedResponse;
  
}


Future<dynamic> enrollStudentForExam({required exam_id, required student_id}) async {
  // try {
  http.Client client = http.Client();
  http.Response response = await client.post(
    Uri.https(baseUrl, "/mentors/signup"),
    body: json.encode({
      "exam_id": exam_id,
      "student_id": student_id,
    }),
    headers: {
      "Content-Type": "application/json"
    },
  );
  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  return decodedResponse;
  
}