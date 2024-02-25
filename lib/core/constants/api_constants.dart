class ApiConstants {
  static const baseURL = "https://dog.ceo/api";
  static const allDogsAPI = "breeds/list/all";
  static const allDogImageRandomDataAPI = "breed/african/images/random/10";

  static const String allDogCeoAPI = '$baseURL/$allDogsAPI';
  static const String allDogImageAPI = '$baseURL/$allDogsAPI';
  static const String allDogTopTenRandomImageAPI = '$baseURL/$allDogImageRandomDataAPI';
}
