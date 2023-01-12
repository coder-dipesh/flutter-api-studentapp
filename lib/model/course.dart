import 'package:batch_student_objbox_api/model/student.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
@JsonSerializable()
class Course {
  @Id(assignable: true)
  int id;

  @Unique()
  @JsonKey(name: '_id')
  String? courseId;
  String? courseName;

  @Backlink()
  final student = ToMany<Student>();

  // Constructor
  Course(this.courseId, this.courseName, {this.id = 0});

  // To create a new single instance of Course we used factory
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      json['_id'],
      json['courseName'],
    );
  }
  // Object lai json ma convert gareko

  Map<String, dynamic> toJson() => {'_id': courseId, 'courseName': courseName};
}
