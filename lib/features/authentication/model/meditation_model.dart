class MeditationModel {
  String? sId;
  String? title;
  String? image;
  String? url;
  int? iV;

  MeditationModel({this.sId, this.title, this.image, this.url, this.iV});

  MeditationModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    image = json['image'];
    url = json['url'];
    iV = json['__v'];
  }
}
