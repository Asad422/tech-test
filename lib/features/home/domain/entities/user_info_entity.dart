class UserInfoEntity {
  final String id;
  final String name;
  final String email;
  final String? avatar;
  final String phone;
  final int businessCount;

  const UserInfoEntity({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
    required this.phone,
    required this.businessCount,
  });
}