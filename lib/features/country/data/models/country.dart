// lib/features/country/data/models/country.dart
class Country {
  final CountryName name;
  Country({required this.name});

  factory Country.fromJson(Map<String, dynamic> json) {
    final nameJson = (json['name'] ?? <String, dynamic>{}) as Map<String, dynamic>;
    return Country(name: CountryName.fromJson(nameJson));
  }
}

class CountryName {
  final String common;
  final String official;

  CountryName({required this.common, required this.official});

  factory CountryName.fromJson(Map<String, dynamic> json) {
    return CountryName(
      common: json['common']?.toString() ?? 'Unknown',
      official: json['official']?.toString() ?? 'Unknown',
    );
  }
}