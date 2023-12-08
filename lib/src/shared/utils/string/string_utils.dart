class StringUtils {
  static String upperCaseFirstLetter(String inputString) {
    if (inputString.trim().length <= 1) {
      return inputString;
    } else {
      return inputString[0].toUpperCase() + inputString.substring(1);
    }
  }
}
