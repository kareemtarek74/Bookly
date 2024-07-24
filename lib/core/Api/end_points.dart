class Endpoints {
  static String baseUrl = "https://www.googleapis.com/books/v1/";

  static String getUserEndPoint(String id) {
    return "user/get-user/$id";
  }
}

class ApiKey {}
