class Constant {
  static const String baseURL = "http://10.0.2.2:3000/api/v1/";

  // For iOS
  //static const String baseURL = "http://localhost:3000/api/v1/";

  // ----------------Student URL----------------
  static const String studentLoginURL = "student/login";
  static const String studentURL = "student";
  static const String searchStudentByBatchURL = "student/searchStudentByBatch/";
  static const String searchStudentByCourseURL =
      "student/searchStudentByCourse/";
  static const String userImageURL = "http://10.0.2.2:3000";

  // ----------------Batch URL----------------
  static const String batchURL = "batch";

  // ----------------Course URL----------------
  static const String courseURL = "course";

  // For storing token or you can store token in shared preferences
  static String token = "";
}
