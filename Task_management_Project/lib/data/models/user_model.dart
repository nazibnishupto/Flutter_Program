class UserModel{
  late final String id;
  late final String email;
  late final String firstName;
  late final String lastName;
  late final String mobile;
  late final String createdDate;

  UserModel();
  
  UserModel.fromJson(Map<String, dynamic> jsonData){
    id = jsonData[id];
    email = jsonData[email];
    firstName = jsonData[firstName];
    lastName = jsonData[lastName];
    mobile = jsonData[mobile];
    createdDate = jsonData[createdDate];
  }
}
