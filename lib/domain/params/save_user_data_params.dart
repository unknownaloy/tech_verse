class SaveUserDataParams {
  final String id;
  final String email;
  final String fullName;
  final String username;

  SaveUserDataParams({
    required this.id,
    required this.email,
    required this.fullName,
    required this.username,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "fullName": fullName,
        "username": username,
      };
}
