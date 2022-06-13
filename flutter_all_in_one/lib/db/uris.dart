class Uris {
  static String baseUrl = "https://fakerapi.it/";
  static String api = "api/";
  static String version = "v1/";
  static String books = "$baseUrl$api${version}books/";
}

class UriParameter {
  static String quantity(quantity) {
    return "?_quantity=$quantity";
  }

  static String locale(locale) {
    return "&_locale=$locale";
  }
}
