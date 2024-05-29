class PublicUser {
  PublicUser({
    required this.followingCount,
    required this.followerCount,
    required this.uid,
  });
  final int followingCount;
  final int followerCount;
  final String uid;

  Map<String, dynamic> toJson() => {
        'followingCount': followingCount,
        'followerCount': followerCount,
        'uid': uid,
      };
}
