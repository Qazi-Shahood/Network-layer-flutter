import 'package:network_layer/features/country/data/repository/country_repository_impl.dart';
import 'package:network_layer/features/country/domain/country_repository.dart';
import 'package:network_layer/features/country/presentation/bloc/country_event.dart';
import 'package:network_layer/features/country/presentation/bloc/country_state.dart';
import 'package:network_layer/network/api_states.dart';
import 'package:network_layer/network/result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final CountryRepository repository = CountryRepositoryImpl();

  CountryBloc() : super(ApiInitial()) {
    on<FetchCountry>(_onFetchCountry);
  }

  Future<void> _onFetchCountry(
      FetchCountry event,
      Emitter<CountryState> emit,
      ) async {
    emit(ApiLoading());

    final result = await repository.getCountry();

    emit(
        switch (result) {
          Success(:final data) => ApiSuccess(data),
          Failure(:final exception) => ApiFailure(exception),
        }
    );

  }
}