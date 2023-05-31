import 'package:project_netflix/core/strings.dart';
import 'package:project_netflix/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$kBaseUrl/trending/all/day?api_key=$apiKey";
  static const search = "$kBaseUrl/search/movie?api_key=$apiKey";

  static const hotAndNewMovie = "$kBaseUrl/discover/movie?api_key=$apiKey";
  static const hotAndNewTV = "$kBaseUrl/discover/tv?api_key=$apiKey";
}
