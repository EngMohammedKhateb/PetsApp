import '../models/category.dart';

import 'course_author.dart';

class Course {
  Course({
    required this.id,
    required this.userId,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.image,
    required this.isFree,
    required this.hasCertificate,
    required this.oldPrice,
    required this.newPrice,
    required this.payLink,
    required this.priority,
    required this.lessons,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    required this.courseAuthor,
  });

  int id;
  int userId;
  int categoryId;
  String name;
  String description;
  String image;
  int isFree;
  int hasCertificate;
  String oldPrice;
  String newPrice;
  String payLink;
  int priority;
  int lessons;
  Category category;
  CourseAuthor courseAuthor;
  DateTime createdAt;
  DateTime updatedAt;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        userId: json["user_id"],
        categoryId: json["category_id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        isFree: json["is_free"],
        hasCertificate: json["has_certificate"],
        oldPrice: json["old_price"],
        newPrice: json["new_price"],
        payLink: json["pay_link"],
        priority: json["priority"],
        lessons: json["lessons"],
        category: Category.fromJson(json["category"]),
        courseAuthor: CourseAuthor.fromJson(json["user"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "category_id": categoryId,
        "name": name,
        "description": description,
        "image": image,
        "is_free": isFree,
        "has_certificate": hasCertificate,
        "old_price": oldPrice,
        "new_price": newPrice,
        "pay_link": payLink,
        "priority": priority,
        "lessons": lessons,
        "category": category,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": courseAuthor
      };
}
