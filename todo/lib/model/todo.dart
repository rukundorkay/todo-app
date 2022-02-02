const String tableTodo = 'todo';

class TodoFields {
  static final List<String> values = [
    /// Add all fields
    id, title, priority, createdDate, description, modifiedDate, status
  ];

  static const String id = '_id';
  static const String title = 'title';
  static const String priority = 'priority';
  static const String createdDate = 'createdDate';
  static const String description = 'description';
  static const String modifiedDate = 'modifiedDate';
  static const String status = 'status';
}

class Todo {
  final int? id;
  final String title;
  final String priority;
  final DateTime createdDate;
  final String description;
  final DateTime modifiedDate;
  final String status;

  const Todo({
    this.id,
    required this.title,
    required this.priority,
    required this.createdDate,
    required this.description,
    required this.modifiedDate,
    required this.status,
  });

  Todo copy({
    int? id,
    String? title,
    String? priority,
    DateTime? createdDate,
    String? description,
    DateTime? modifiedDate,
    String? status,
  }) =>
      Todo(
        id: id ?? this.id,
        title: title ?? this.title,
        priority: priority ?? this.priority,
        createdDate: createdDate ?? this.createdDate,
        description: description ?? this.description,
        modifiedDate: modifiedDate ?? this.modifiedDate,
        status: status ?? this.status,
      );

  static Todo fromJson(Map<String, Object?> json) => Todo(
        id: json[TodoFields.id] as int?,
        title: json[TodoFields.title] as String,
        priority: json[TodoFields.priority] as String,
        createdDate: DateTime.parse(json[TodoFields.createdDate] as String),
        description: json[TodoFields.description] as String,
        modifiedDate: DateTime.parse(json[TodoFields.modifiedDate] as String),
        status: json[TodoFields.status] as String,
      );

  Map<String, Object?> toJson() => {
        TodoFields.id: id,
        TodoFields.createdDate: createdDate.toIso8601String(),
        TodoFields.title: title,
        TodoFields.priority: priority,
        TodoFields.description: description,
        TodoFields.modifiedDate: modifiedDate.toIso8601String(),
        TodoFields.status: status
      };
}
