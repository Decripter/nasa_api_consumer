// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names

class NasaApodModel {
  String? copyright;
  String? date;
  String? explanation;
  String? hdurl;
  String? mediaType;
  String? serviceVersion;
  String? title;
  String? url;

  NasaApodModel(
      {this.copyright,
      this.date,
      this.explanation,
      this.hdurl,
      this.mediaType,
      this.serviceVersion,
      this.title,
      this.url});

  NasaApodModel.fromJson(Map<String, dynamic> json) {
    copyright = json['copyright'];
    date = json['date'];
    explanation = json['explanation'];
    hdurl = json['hdurl'];
    mediaType = json['media_type'];
    serviceVersion = json['service_version'];
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['copyright'] = copyright;
    data['date'] = date;
    data['explanation'] = explanation;
    data['hdurl'] = hdurl;
    data['media_type'] = mediaType;
    data['service_version'] = serviceVersion;
    data['title'] = title;
    data['url'] = url;
    return data;
  }

  factory NasaApodModel.fromMap(Map<String, dynamic> map) {
    return NasaApodModel(
      copyright: map['copyright'] as String,
      date: map['date'] as String,
      explanation: map['modelo'] as String,
      hdurl: map['anunciante'] as String,
      mediaType: map['km_total'] as String,
      serviceVersion: map['ano_modelo'] as String,
      title: map['ano_fabricacao'] as String,
      url: map['preco'] as String,
    );
  }
}
