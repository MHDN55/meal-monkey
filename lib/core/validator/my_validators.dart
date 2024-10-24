class MyValidators{

  String? nameValidator(value) {
    if (value!.isEmpty) {
      return "Required Name";
    }
    return null;
  }
  
  String? emailValidator(value) {
    if (value!.isEmpty) {
      return "Required Email";
    }
    String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Invalid E-mail Address format.';
    }
    return null;
  }

  String? passwordValidator(value) {
    if (value!.isEmpty) {
      return "Required Password";
    }
    String pattern = r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return '''Password must be at least 8 characters,\ninclude an uppercase letter, number and symbol.''';
    }
    return null;
  }



}