class CategoriesModel {
  String? sId;
  String? title;
  String? image;
  String? message;
  String? category;
  int? iV;

  CategoriesModel(
      {this.sId, this.title, this.image, this.message, this.category, this.iV});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    image = json['image'];
    message = json['message'];
    category = json['category'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['image'] = image;
    data['message'] = message;
    data['category'] = category;
    data['__v'] = iV;
    return data;
  }
}
