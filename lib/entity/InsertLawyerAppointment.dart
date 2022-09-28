/* {
  "data": {
    "Insert_LawyerAppointmentResult": "NOK"
 
 }
http://localhost:3000/insertLawyerAppointment/api/fu_mobile/Insert_LawyerAppointment/1/1/1/1/1

}*/

class Data {
  late Log pushLogs;

  Data.fromJson(Map<String, dynamic> json) {
    pushLogs = Log.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = this.pushLogs;
    return data;
  }
}

class Log {
  late String Response;
  Log({
    required this.Response,
  });

  Log.fromJson(Map<String, dynamic> json) {
    Response = json['Insert_LawyerAppointmentResult'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Insert_LawyerAppointmentResult'] = this.Response;
    return data;
  }
}
