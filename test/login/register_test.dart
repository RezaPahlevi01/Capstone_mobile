import 'package:flutter_test/flutter_test.dart';

// Fungsi validasi yang akan diuji
bool validateName(String name) {
  return name.isNotEmpty && name.length >= 3;
}

bool validateEmail(String email) {
  return email.isNotEmpty && RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(email);
}

bool validatePassword(String password) {
  return password.isNotEmpty && password.length >= 6;
}

void main() {
  group('Validation Tests', () {
    // Unit test untuk validateName
    test('validateName returns true for valid name', () {
      expect(validateName('dapa'), isTrue);
    });

    test('validateName returns false for empty name', () {
      expect(validateName(''), isFalse);
    });

    test('validateName returns false for name less than 3 characters', () {
      expect(validateName('Jo'), isFalse);
    });

    // Unit test untuk validateEmail
    test('validateEmail returns true for valid email', () {
      expect(validateEmail('test@gmail.com'), isTrue);
    });

    test('validateEmail returns false for empty email', () {
      expect(validateEmail(''), isFalse);
    });

    test('validateEmail returns false for invalid email format', () {
      expect(validateEmail('testgmail.com'), isFalse);
      expect(validateEmail('test@.com'), isFalse);
      expect(validateEmail('@gmail.com'), isFalse);
    });

    // Unit test untuk validatePassword
    test('validatePassword returns true for valid password', () {
      expect(validatePassword('password123'), isTrue);
    });

    test('validatePassword returns false for empty password', () {
      expect(validatePassword(''), isFalse);
    });

    test('validatePassword returns false for password less than 6 characters', () {
      expect(validatePassword('12345'), isFalse);
    });
  });
}
