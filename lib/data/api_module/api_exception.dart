class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Erreur pendant la communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Acces non autorisé: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Champ invalide: ");
}

class AuthenticationException extends AppException {
  AuthenticationException([String? message])
      : super(message, "Authentification echoué: ");
}
