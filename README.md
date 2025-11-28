# Network-layer-flutter
My take on networking in flutter using clean and Bloc state management 

## Features

- **Clean architecture**
- **Reusable network layer**
  - `ApiClient` centralizes base URL, timeouts, interceptors, and error mapping.
  - `Result` and `ApiState` sealed classes standardize success/failure flow.
  - `ApiException` hierarchy captures HTTP error semantics consistently.
  - `ApiConfig` stores the app’s base URL and timeout settings.

- **Country demo**
  - On launch, `CountryBloc` dispatches `FetchCountry`.
  - Repository hits `https://restcountries.com/v3.1/all?fields=name`.
  - JSON list is decoded into `Country`/`CountryName` models.
  - UI lists each country name or shows loader/error feedback.
