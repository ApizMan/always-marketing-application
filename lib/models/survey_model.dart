class SurveyModel {
  int? id;
  String? title;
  String? description;
  int? createdBy;
  String? createdAt;
  String? updatedAt;

  SurveyModel(
      {this.id,
      this.title,
      this.description,
      this.createdBy,
      this.createdAt,
      this.updatedAt});

  SurveyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['created_by'] = createdBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
