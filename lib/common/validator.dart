String guestCountValid(int guestCount) {
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


String yearValid(int age) {
  if ((age == 1 || age % 10 == 1) && age % 100 != 11) {
    return "год";
  } else if (age % 10 >= 2 &&
      age % 10 <= 4 &&
      !(age % 100 >= 12 && age % 100 <= 14)) {
    return "года";
  } else if (age % 10 >= 1 && age % 10 <= 10 ||
      age % 10 == 0) {
    return "лет";
  }
  return '';
}
