class ProfileName {
  final String id;
  final String name;

  ProfileName({
    required this.id,
    required this.name,
  });
}

class ProfileDetailed {
  final String id;
  final String name;
  final String tel;

  ProfileDetailed({
    required this.id,
    required this.name,
    required this.tel,
  });

  List<Object> get props => [id];
}
