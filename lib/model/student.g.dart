// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      stdId: json['stdId'] as int? ?? 0,
      studentId: json['_id'] as String?,
      fname: json['fname'] as String?,
      lname: json['lname'] as String?,
      image: json['image'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'stdId': instance.stdId,
      '_id': instance.studentId,
      'fname': instance.fname,
      'lname': instance.lname,
      'image': instance.image,
      'username': instance.username,
      'password': instance.password,
    };
