import 'package:uno/uno.dart';
import '../models/nasa_apod_model.dart';

class NasaApodService {
  final Uno uno;
  final String url = "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY";

  NasaApodService(this.uno);

  Future<List<NasaApodModel>> fetchAnuncios(urlFiltro) async {
    final response = await uno.get("$url$urlFiltro");
    final list = response.data as List;
    final anuncios = list.map((e) => NasaApodModel.fromJson(e)).toList();
    return anuncios;
  }
}
