class User {
  int? id;
  String? name;
  String? image;
  String? phone;
  dynamic emailVerifiedAt;
  String? block;
  String? theme;
  String? bio;
  int? gender;
  String? city;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? roleId;
  String? birthdate;
  String? work;

  User({
    this.id,
    this.name,
    this.image,
    this.phone,
    this.emailVerifiedAt,
    this.block,
    this.theme,
    this.bio,
    this.gender,
    this.city,
    this.createdAt,
    this.updatedAt,
    this.roleId,
    this.birthdate,
    this.work,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        phone: json['phone'] as String?,
        emailVerifiedAt: json['email_verified_at'] as dynamic,
        block: json['block'] as String?,
        theme: json['theme'] as String?,
        bio: json['Bio'] as String?,
        gender: json['gender'] as int?,
        city: json['city'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        roleId: json['role_id'] as int?,
        birthdate: json['birthdate'] as String?,
        work: json['work'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'phone': phone,
        'email_verified_at': emailVerifiedAt,
        'block': block,
        'theme': theme,
        'Bio': bio,
        'gender': gender,
        'city': city,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'role_id': roleId,
        'birthdate': birthdate,
        'work': work,
      };
}
