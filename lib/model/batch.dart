import 'package:batch_student_objbox_api/model/student.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

//flutter pub run build_runner build  --delete-conflicting-outputs

@Entity()
@JsonSerializable()
class Batch {
  @Id(assignable: true)
  int id;

  @Unique()
  @JsonKey(name: '_id')
  String? batchId;
  String? batchName;

  @Backlink()
  final student = ToMany<Student>();

  //Constructor
  Batch(this.batchId, this.batchName, {this.id = 0});

  // To create single instance of Batch we use factory method
  // Server data lai object ma haleko
  factory Batch.fromJson(Map<String, dynamic> json) {
    return Batch(
      json['_id'],
      json['batchName'],
    );
  }

  // Object lai json ma convert gareko
  Map<String, dynamic> toJson() => {'_id': batchId, 'batchName': batchName};
}
