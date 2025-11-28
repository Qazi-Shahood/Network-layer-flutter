import 'package:network_layer/features/country/country_endpoints.dart';
import 'package:network_layer/features/country/data/models/country.dart';
import 'package:network_layer/features/country/domain/country_repository.dart';
import 'package:network_layer/network/api_client.dart';
import 'package:network_layer/network/result.dart';

class CountryRepositoryImpl implements CountryRepository {
  final ApiClient api = ApiClient();

  @override
  Future<Result<List<Country>>> getCountry() {
      return api.get(
        CountryEndpoints.name.path,
        decoder: (json) {
          final list = json as List<dynamic>;
          return list
              .map((item) => Country.fromJson(item as Map<String, dynamic>))
              .toList();
        },
      );
  }

}