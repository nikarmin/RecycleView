class Source {
  String id;
  String name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }
}
