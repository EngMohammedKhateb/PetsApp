class Account {
  Account({
    required this.id,
    required this.name,
    required this.image,
    required this.phone,
    required this.deviceId,
    required this.verificationCode,
    required this.block,
    required this.theme,
    required this.bio,
    required this.gender,
    required this.city,
    required this.createdAt,
    required this.updatedAt,
    required this.roleId,
    required this.birthdate,
    required this.work,
  });

  int id;
  String name;
  String image;
  String phone;
  dynamic deviceId;
  dynamic verificationCode;
  String block;
  String theme;
  String bio;
  int gender;
  String city;
  DateTime createdAt;
  DateTime updatedAt;
  int roleId;
  String birthdate;
  String work;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        phone: json["phone"],
        deviceId: json["device_id"],
        verificationCode: json["verification_code"],
        block: json["block"],
        theme: json["theme"],
        bio: json["bio"],
        gender: json["gender"],
        city: json["city"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        roleId: json["role_id"],
        birthdate: json["birthdate"],
        work: json["work"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "phone": phone,
        "device_id": deviceId,
        "verification_code": verificationCode,
        "block": block,
        "theme": theme,
        "bio": bio,
        "gender": gender,
        "city": city,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "role_id": roleId,
        "birthdate": birthdate,
        "work": work,
      };
}
