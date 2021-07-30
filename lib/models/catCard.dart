

class CatCard{
  late String caption;
  late String code;
  late String desc;
  late String logoUrl;
  late int max;
  late int min;
  late List<int> values = [];

  CatCard(
      {required this.caption,
      required this.code,
      required this.desc,
      required this.logoUrl,
      required this.max,
      required this.min,
      required this.values});

  factory CatCard.fromJson(Map<String, dynamic> json){
    return CatCard(
      caption: json['caption'],
      code: json['code'],
      desc: json['desc'],
      logoUrl: json['logo'],
      max: json['max_range'],
      min: json['min_range'],
      values: json ['value']
    );
  }

  Map <String , dynamic> toJson(){
    return {
      'caption' : caption,
      'code': code,
      'desc': desc,
      'logo': logoUrl,
      'max_range': max,
      'min_range': min,
      'value': values,
    };
  }
}