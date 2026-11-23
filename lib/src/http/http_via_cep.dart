class HttpViaCep {
  static String generateUrl(String cep) {
    return "https://viacep.com.br/ws/$cep/json/";
  }
}
