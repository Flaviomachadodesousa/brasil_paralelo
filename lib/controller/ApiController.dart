import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://minhasnotasfmu.000webhostapp.com/brasilparalelo";

class APISerie {
  static Future getSerie() {
    var url = baseUrl + "/serie.json";
    return http.get(url);
  }
}

class APIProgramacao {
  static Future getProgramacao() {
    var url = baseUrl + "/programacao.json";
    return http.get(url);
  }
}
