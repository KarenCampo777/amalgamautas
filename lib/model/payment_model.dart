class ModelDataPayment {
  final String? type, date, txnId, total, status;

  ModelDataPayment({this.type, this.date, this.txnId, this.status, this.total});

  Map<String, dynamic> jsonData() {
    return {'Type': type!, 'Date': date!, 'txn_id': txnId!, 'Status': status!, 'Total': total!};
  }

  factory ModelDataPayment.fromJson(Map<String, dynamic> data) {
    return ModelDataPayment(
        date: data['Date'], type: data['Type'], txnId: data['txn_id'], status: data['Status'], total: data['Total']);
  }
}
