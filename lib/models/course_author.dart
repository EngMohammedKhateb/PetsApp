class CourseAuthor {
  CourseAuthor({
    required this.id,
    required this.name,
    required this.image,
    required this.gender,
    required this.work,
    required this.bio,
  });

  int id;
  String name;
  String image;
  String work;
  String bio;
  int gender;

  factory CourseAuthor.fromJson(Map<String, dynamic> json) => CourseAuthor(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        gender: json["gender"],
        work: json["work"],
        bio: json["bio"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "gender": gender,
        "work": work,
        "bio": bio,
      };
}
