import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_layer/features/country/data/models/country.dart';
import 'package:network_layer/features/country/presentation/bloc/country_bloc.dart';
import 'package:network_layer/features/country/presentation/bloc/country_state.dart';
import 'package:network_layer/network/api_states.dart';

class CountryHome extends StatelessWidget {
  const CountryHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CountryBloc, CountryState>(
        builder: (context, state) {
          return switch (state) {
            ApiInitial() => const Text('Welcome'),
            ApiLoading() => const Center(child: CircularProgressIndicator(),),
            ApiSuccess(:final data) => _buildList(data),
            ApiFailure(:final exception) => Center(child: Text(exception.toString()),),
          };
        },
      ),
    );
  }

  Widget _buildList(List<Country> countries) {
    return ListView.builder(
        itemCount:  countries.length,
        itemBuilder: (context, index) {
          final country = countries[index];

          return ListTile(
            title: Text(country.name.official),
            leading: const Icon(Icons.public),
          );
        },
    );
  }
}

