import 'package:formz/formz.dart';

class NameTaskValidation extends FormzInput<String, String?> {
  const NameTaskValidation.pure() : super.pure('');
  const NameTaskValidation.dirty([super.value = '']) : super.dirty();

  @override
  String? validator(String value) {
    if (value.trim().isEmpty) return 'Name is empty';
    return null;
  }
}
