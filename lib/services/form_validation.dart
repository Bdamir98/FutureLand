extension extString on String {
  bool get isValidName {
    final nameRegExp = new RegExp(r"[a-zA-Z]+|\s");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidNid {
    final NidRegExp = new RegExp(r"[0-9]{10}");
    return NidRegExp.hasMatch(this);
  }

  bool get isValidNids {
    final NidRegExp = new RegExp(r"[0-9]{13}");
    return NidRegExp.hasMatch(this);
  }

  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r'(^(\+88)?(01){1}[3456789]{1}(\d){8})$');
    return phoneRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(r"[0-9a-zA-Z]+");
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }
}
