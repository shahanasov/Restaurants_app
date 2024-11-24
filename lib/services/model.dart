class NotificationModel {
  String image;
  String title;
  String timeStamp;
  String body;

  NotificationModel(
      {required this.image,
      required this.body,
      required this.timeStamp,
      required this.title});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      image: json["image"]??'',
      body:json["body"]??'',
      timeStamp: json["timestamp"]?? '',
      title: json["title"]??'',
    );
  }
  
}
