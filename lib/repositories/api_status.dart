class Success {
  int code;
  // ignore: prefer_typing_uninitialized_variables
  var data;
  Success({required this.code, required this.data});
}

class Failure {
  int code;
  // ignore: prefer_typing_uninitialized_variables
  var errorResponse;
  Failure({required this.code, required this.errorResponse});
}
