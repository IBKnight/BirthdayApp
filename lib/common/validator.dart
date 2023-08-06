class Validator {
  static String guestCountValid(int guestCount) {
    if ((guestCount == 1 || guestCount % 10 == 1) && guestCount % 100 != 11) {
      return "гость";
    } else if (guestCount % 10 >= 2 &&
        guestCount % 10 <= 4 &&
        !(guestCount % 100 >= 12 && guestCount % 100 <= 14)) {
      return "гостя";
    } else if (guestCount % 10 >= 1 && guestCount % 10 <= 10 ||
        guestCount % 10 == 0) {
      return "гостей";
    }
    return '';
  }

  static String yearValid(int age) {
    if ((age == 1 || age % 10 == 1) && age % 100 != 11) {
      return "год";
    } else if (age % 10 >= 2 &&
        age % 10 <= 4 &&
        !(age % 100 >= 12 && age % 100 <= 14)) {
      return "года";
    } else if (age % 10 >= 1 && age % 10 <= 10 || age % 10 == 0) {
      return "лет";
    }
    return '';
  }

  static String? dateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Пожалуйста, введите дату в формате yyyy-mm-dd';
    }
    RegExp dateRegExp = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    if (!dateRegExp.hasMatch(value)) {
      return 'Введите дату в формате yyyy-mm-dd';
    }
    try {
      DateTime.parse(value);
    } catch (e) {
      return 'Неверная дата';
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Пожалуйста, введите значение';
    }

    RegExp nameRegExp = RegExp(r'^[а-яА-Яa-zA-Z ]+$');
    if (!nameRegExp.hasMatch(value)) {
      return 'Введите корректное имя, фамилию или слово';
    }

    return null;
  }

  static String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Пожалуйста, введите номер телефона';
    }

    RegExp phoneRegExp = RegExp(r'^\d{10}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Введите номер телефона в формате 10 цифр';
    }

    return null;
  }

  static String? urlValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Пожалуйста, введите URL';
    }

    RegExp urlRegExp = RegExp(r'^(http|https)://[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,}(\/\S*)?$');
    if (!urlRegExp.hasMatch(value)) {
      return 'Введите корректный URL';
    }

    return null;
  }
}
