import 'package:store/data/response/status.dart';

class ApiResponse<T> {
  T? data;
  Status? status;
  String? message;

  ApiResponse(this.data, this.message, this.status);

  ApiResponse.loading() : status = Status.loading;
  ApiResponse.complete(this.data) : status = Status.complete;
  ApiResponse.error(this.message) : status = Status.error;
  @override
  String toString() {
    return "Status:$status \n Message:$message \n Data:$data";
  }
}
