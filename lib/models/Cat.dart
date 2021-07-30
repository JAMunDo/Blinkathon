class Cat {
  late String apikey;

  Cat({required this.apikey});

  factory Cat.fromJson(Map<String, dynamic> json){
    return Cat(
      apikey: json['apikey'],
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'service': {
        'apikey': apikey,
      }
    };
  }
}