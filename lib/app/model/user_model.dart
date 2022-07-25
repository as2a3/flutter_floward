import 'package:flutter_floward/app/model/base_model.dart';

class UserModel extends Model {
  late int id;
  late int albumId;
  late String name;
  late String url;
  late String thumbnailUrl;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = intFromJson(json, 'userId', defaultValue: -1,);
    albumId = intFromJson(json, 'albumId', defaultValue: -1,);
    name = stringFromJson(json, 'name',);
    url = stringFromJson(json, 'url',);
    thumbnailUrl = stringFromJson(json, 'thumbnailUrl',);
  }

  @override
  Map<String, dynamic> toJson() => {
    'userId': id,
    'albumId': albumId,
    'name': name,
    'url': url,
    'thumbnailUrl': thumbnailUrl,
  };

}
