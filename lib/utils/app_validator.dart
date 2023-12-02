class AppValidator {
  String? validateEmail(value) {
    if (value!.isEmpty) {
      return 'Digite seu email';
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Email invalido';
    }
    return null;
  }

  String? validatePhoneNumber(value) {
    if (value!.isEmpty) {
      return 'Digite seu telefone';
    }
    if (value.length != 10) {
      return 'Telefone incompleto';
    }
    return null;
  }

  String? validatePassword(value) {
    if (value!.isEmpty) {
      return 'Digite sua senha';
    }
    return null;
  }

  String? validateUserName(value) {
    if (value!.isEmpty) {
      return 'Digite seu Nome';
    }
    return null;
  }
  String? isEmptyCheck(value) {
    if (value!.isEmpty) {
      return 'Please fill details';
    }
    return null;
  }
}
