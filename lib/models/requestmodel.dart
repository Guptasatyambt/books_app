class RequestModel {
  RequestModel({
    this.notaryId,
  });
  late final String? notaryId;

  RequestModel.fromJson(Map<String, dynamic> json) {
    notaryId = json['notaryId'];
   
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['notaryId'] = notaryId;
    return data;
  }
}