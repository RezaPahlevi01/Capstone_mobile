import 'package:flutter_application_coba_capsten/login/formlogin.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Email Validation', () {
    test('Valid email with @gmail.com', () {
      expect(FormLogin().validateEmail('test@gmail.com'), true);
    });

    test('Invalid email without @', () {
      expect(FormLogin().validateEmail('testgmail.com'), false);
    });

    test('Invalid email without domain', () {
      expect(FormLogin().validateEmail('test@'), false);
    });

    test('Invalid email with incorrect domain', () {
      expect(FormLogin().validateEmail('test@yahoo.com'), false);
    });
  });

  group('Password Validation', () {
    test('Valid password with 6 characters', () {
      expect(FormLogin().validatePassword('123456'), true);
    });

    test('Invalid password with less than 6 characters', () {
      expect(FormLogin().validatePassword('12345'), false);
    });

    test('Valid password with more than 6 characters', () {
      expect(FormLogin().validatePassword('1234567'), true);
    });
  });
}
