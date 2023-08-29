class ApiResponse<T> {
  Header? header;
  T? body;

  ApiResponse({this.header, this.body});

  ApiResponse.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJson) {
    header =
    json['header'] != null ? Header.fromJson(json['header']) : null;
    body = json['body'] != null ? fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJson) {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (header != null) {
      data['header'] = header!.toJson();
    }
    if (body != null) {
      data['body'] = toJson(body!);
    }
    return data;
  }
}

class Header {
  int? statusCode;
  String? message;
  bool? success;

  Header({this.statusCode, this.message, this.success});

  Header.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['message'] = message;
    data['success'] = success;
    return data;
  }
}