import 'package:batch_student_objbox_api/model/batch.dart';
import 'package:json_annotation/json_annotation.dart';

part 'batch_response.g.dart';

@JsonSerializable()
class BatchResponse {
  bool? success;
  String? message;
  List<Batch>? data;

  BatchResponse({this.success, this.message, this.data});

  factory BatchResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BatchResponseToJson(this);
}
