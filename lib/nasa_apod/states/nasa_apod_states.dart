import 'package:nasa_api_consumer/nasa_apod/models/nasa_apod_model.dart';

abstract class NasaApodState {}

class InitialNasaApodState extends NasaApodState {}

class LoadingNasaApodState extends NasaApodState {}

class SuccessNasaApodState extends NasaApodState {
  final List<NasaApodModel> nasaResults;
  SuccessNasaApodState(this.nasaResults);
}

class ErrorNasaApodState extends NasaApodState {
  final String message;
  ErrorNasaApodState(this.message);
}
