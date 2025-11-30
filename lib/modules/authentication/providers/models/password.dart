class Password {
  final String _value;

  Password(String password) : _value = password.trim();

  void validate() {
    if (value.isEmpty) {
      throw const PasswordException("You must provide a password");
    }
    if (value.length < 8) {
      throw const PasswordException(
        "Password must be at least 8 characters",
      );
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      throw const PasswordException(
        "Password must contain an uppercase letter",
      );
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      throw const PasswordException(
        "Password must contain a lowercase letter",
      );
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      throw const PasswordException(
        "Password must contain a number",
      );
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>_\-+=\[\]\\;/~`]').hasMatch(value)) {
      throw const PasswordException(
        "Password must contain a symbol",
      );
    }
  }

  String get value => _value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Password &&
          runtimeType == other.runtimeType &&
          _value == other._value;

  @override
  int get hashCode => _value.hashCode;
}

class PasswordException implements Exception {
  final String message;

  const PasswordException(this.message);

  @override
  String toString() => message;
}
