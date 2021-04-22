class ModelDataShipping {
  final String? address, city, state, country, cost;


  ModelDataShipping({this.address, this.city, this.state, this.country, this.cost});

  Map<String, dynamic> jsonData() {
    return {'Address': address!, 'City': city!, 'State': state!, 'Country': country!, 'Cost': cost!};
  }

  factory ModelDataShipping.fromJson(Map<String, dynamic> data) {
    return ModelDataShipping(
        address: data['Address'], city: data['City'], state: data['State'], country: data['Country'], cost: data['Cost']);
  }
}
