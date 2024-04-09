import 'package:countries/models/country_model.dart';
import 'package:dio/dio.dart';

class CountryService {
  Future<List<Country>> getCountries() async {
    final Dio dio = Dio();
    const String apiURL = 'https://restcountries.com/v3.1/all';

    final response = await dio.get(apiURL);

    final data = response.data as List<dynamic>;

    return data.map((e) => Country.fromJson(e)).toList();
  }
}
