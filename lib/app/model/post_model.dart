import 'package:flutter_floward/app/model/base_model.dart';

class PostModel extends Model {
  late int id;
  late int userId;
  late String title;
  late String body;

  PostModel({
    required this.id,
    required this.userId,
    this.title = '',
    this.body = '',
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    id = intFromJson(json, 'id', defaultValue: -1,);
    userId = intFromJson(json, 'userId', defaultValue: -1,);
    title = stringFromJson(json, 'title',);
    body = stringFromJson(json, 'body',);
  }

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'title': title,
    'body': body,
  };
}
