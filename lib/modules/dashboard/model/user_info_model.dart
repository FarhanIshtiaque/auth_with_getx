
import 'dart:convert';

UserInfoModel userInfoModelFromJson(String str) => UserInfoModel.fromJson(json.decode(str));

String userInfoModelToJson(UserInfoModel data) => json.encode(data.toJson());

class UserInfoModel {
  UserInfoModel({

    required this.username,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.email,

  });
  String username;
  String name;
  String firstName;
  String lastName;
  String email;


  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(

    username: json["username"],
    name: json["name"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],

  );

  Map<String, dynamic> toJson() => {

    "username": username,
    "name": name,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,

  };
}

class Capabilities {
  Capabilities({
    required this.read,
    required this.level0,
    required this.subscriber,
  });

  bool read;
  bool level0;
  bool subscriber;

  factory Capabilities.fromJson(Map<String, dynamic> json) => Capabilities(
    read: json["read"],
    level0: json["level_0"],
    subscriber: json["subscriber"],
  );

  Map<String, dynamic> toJson() => {
    "read": read,
    "level_0": level0,
    "subscriber": subscriber,
  };
}

class ExtraCapabilities {
  ExtraCapabilities({
    required this.subscriber,
  });

  bool subscriber;

  factory ExtraCapabilities.fromJson(Map<String, dynamic> json) => ExtraCapabilities(
    subscriber: json["subscriber"],
  );

  Map<String, dynamic> toJson() => {
    "subscriber": subscriber,
  };
}

class Links {
  Links({
    required this.self,
    required this.collection,
  });

  List<Collection> self;
  List<Collection> collection;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: List<Collection>.from(json["self"].map((x) => Collection.fromJson(x))),
    collection: List<Collection>.from(json["collection"].map((x) => Collection.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": List<dynamic>.from(self.map((x) => x.toJson())),
    "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
  };
}

class Collection {
  Collection({
    required this.href,
  });

  String href;

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}



