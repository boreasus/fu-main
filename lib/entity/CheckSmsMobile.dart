class checkSmsResponse {
  late String CheckSMSForMobileResult;

  checkSmsResponse.fromJson(Map<String, dynamic> json) {
    CheckSMSForMobileResult = json['CheckSMSForMobileResult'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['CheckSMSForMobileResult'] = this.CheckSMSForMobileResult;

    return data;
  }
}
