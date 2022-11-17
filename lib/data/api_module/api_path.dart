enum APIPath {
  inscription,
  connexion,
}

class APIPathHelper {
  static String getValue(APIPath path, {String? customPath}) {
    switch (path) {
      case APIPath.connexion:
        return "user/auth";
      case APIPath.inscription:
        return "user/register";
      default:
        return "";
    }
  }
}
