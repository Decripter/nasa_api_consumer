import 'package:flutter/material.dart';
import 'package:nasa_api_consumer/nasa_apod/services/nasa_apod_service.dart';
import 'package:nasa_api_consumer/nasa_apod/states/nasa_apod_states.dart';

class NasaApodStore extends ValueNotifier<NasaApodState> {
  final NasaApodService service;

  NasaApodStore(this.service) : super(InitialNasaApodState());

  Future fetchAnuncios(urlFiltro) async {
    value = LoadingNasaApodState();
    try {
      final anuncios = await service.fetchAnuncios(urlFiltro);
      value = SuccessNasaApodState(anuncios);
    } catch (e) {
      value = ErrorNasaApodState(e.toString());
    }
  }
}
