class User{
  User(this.name , this.email, this.uid, this.phoneNumber, this.balance);

  late String name;
  late String email ;
  late String uid ;
  late int phoneNumber;
 late int balance;



  User.fromJson(Map<String, dynamic> json){
    name = json['Name'];
    uid = json['Uid'];
    email= json['email'];
    phoneNumber= json['phoneNumber'];
    balance= json['balance'];
  }

  // Map<String, dynamic> toJson(){
  //   final Map<String,dynamic> data = new Map<String, dynamic>();
  //   data ['Name'] = this.name;
  //   data ['email'] = this.email;
  //   data ['Uid'] = this.uid;
  //   data ['phoneNumber'] = this.phoneNumber;
  //   data ['balance'] =  this.balance;
  // }
}