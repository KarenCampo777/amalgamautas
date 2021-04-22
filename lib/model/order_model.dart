class ModelDataOrder {
  final String? date, total, subTotal, taxes;
  final bool? paid;

  ModelDataOrder({this.date, this.total, this.subTotal, this.taxes, this.paid});

  Map<String, dynamic> jsonData() {
    return {'Date': date!, 'Total': total!, 'Subtotal': subTotal!, 'Taxes': taxes!, 'Paid': paid!};
  }

  factory ModelDataOrder.fromJson(Map<String, dynamic> data) {
    return ModelDataOrder(
        date: data['Date'], total: data['Total'], subTotal: data['Subtotal'], taxes: data['Taxes'], paid: data['Paid']);
  }
}
