import 'package:flutter/material.dart';
import 'package:nasa_api_consumer/nasa_apod/services/nasa_apod_service.dart';
import 'package:nasa_api_consumer/nasa_apod/states/nasa_apod_states.dart';
import 'package:nasa_api_consumer/nasa_apod/stores/nasa_apod_store.dart';
import 'package:uno/uno.dart';

class NasaApodPage extends StatefulWidget {
  const NasaApodPage({Key? key}) : super(key: key);

  @override
  State<NasaApodPage> createState() => _NasaApodPageState();
}

class _NasaApodPageState extends State<NasaApodPage> {
  final store = NasaApodStore(NasaApodService(Uno()));
  String anuncianteId = '';
  String marcaId = '';
  String modeloId = '';

  @override
  void initState() {
    super.initState();
    store.fetchAnuncios("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Showroom Car"),
              GestureDetector(
                child: const Icon(Icons.add),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/criarAnuncio',
                  );
                },
              )
            ],
          ),
        ),
        floatingActionButton: GestureDetector(
          onLongPress: () {
            Navigator.pushNamed(context, '/configurar');
          },
          child: FloatingActionButton(
            child: const Icon(Icons.filter_alt_sharp),
            onPressed: () {},
          ),
        ),
        body: ValueListenableBuilder(
          valueListenable: store,
          builder: (_, state, child) {
            if (state is LoadingNasaApodState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ErrorNasaApodState) {
              return Text(state.message);
            }
            if (state is SuccessNasaApodState) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: state.nasaResults.length,
                  itemBuilder: (_, index) {
                    final nasaResult = state.nasaResults[index];
                    return ListTile(
                        title: Column(
                      children: [
                        Image.network(
                          nasaResult.url!,
                          height: 300,
                        ),
                        Text(nasaResult.title!),
                      ],
                    ));
                  });
            }
            return Container();
          },
        ));
  }
}
