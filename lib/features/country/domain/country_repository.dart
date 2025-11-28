import 'package:network_layer/features/country/data/models/country.dart';
import 'package:network_layer/network/result.dart';

abstract class CountryRepository {
  Future<Result<List<Country>>> getCountry();
}