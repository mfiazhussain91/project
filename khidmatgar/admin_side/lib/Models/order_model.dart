class OrderModel {
  String Name;
  String userEmail;
  String userNumber;
  String service;
  String serviceName;
  String userProblem;
  String userAddress;

  // String acSize;
  // String acCompany;
  // String servicePrice;

  OrderModel({
    required this.userEmail,
    required this.userNumber,
    required this.Name,
    required this.service,
    required this.serviceName,
    required this.userAddress,
    required this.userProblem,

    // required this.acCompany,
    // required this.acSize,
    // required this.servicePrice,

  });
}