class ModelData {

  final String? company, govId, email, name, lastName;

  ModelData({this.company, this.govId, this.email, this.name, this.lastName});

  Map<String, String> jsonData(){
    return {
      'Name' : name!,
      'Last Name':lastName!,
      'Email':email!,
      'Company':company!,
      'Gov_Id':govId!
    };
  }

  factory ModelData.fromJson(Map<String, String> data){
    return ModelData(
      name: data['Name'],
      lastName: data['Last Name'],
      email: data['Email'],
      company: data['Company'],
      govId: data['Gov_Id']
    );
  }

// Map<String, String> createUseraData({String? company, String? govId, String? email, String? name, String? lastName}) {
  //   return {'Company': company!, 'Gov_Id': govId!, 'Email': email!, 'Name': name!, 'Last Name': lastName!};
  // }
}
