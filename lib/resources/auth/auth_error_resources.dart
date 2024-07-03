class AuthErrorResources {
  String message;
  Map<String, List<String>> errors;

  AuthErrorResources({required this.message, required this.errors});

  factory AuthErrorResources.fromJson(Map<String, dynamic> json) {
    return AuthErrorResources(
      message: json['message'] ?? '',
      errors: (json['errors'] as Map<String, dynamic>?)
              ?.map((key, value) => MapEntry(key, (value as List<dynamic>).cast<String>())) ??
          {},
    );
  }

  @override
  String toString() {
    return 'LoginValidationResult{message: $message, errors: $errors}';
  }
}