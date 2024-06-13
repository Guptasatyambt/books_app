import 'dart:convert';



ResponseModel responseJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

class ResponseModel {
  ResponseModel({
    required this.status,
    required this.leads,
    required this.leadCount,
    required this.pageCount,
  });
  late final int status;
  late final List<Lead> leads;
  late final int leadCount;
  late final int pageCount;

  ResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    leads = List.from(json['leads']).map((e) => Lead.fromJson(e)).toList();
    leadCount = json['leadCount'];
    pageCount = json['pageCount'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['leads'] = leads.map((e) => e.toJson()).toList();
    data['leadCount'] = leadCount;
    data['pageCount'] = pageCount;
    return data;
  }
}

class Lead {
  Lead({
    required this.customerRates,
    required this.imageURL,
    required this.labels,
    required this.createdAt,
    this.invoiceAddress,
    required this.totalAppts,
    required this.completedAppts,
    required this.totalInvoice,
    required this.invoiceCollectedThisMonth,
    required this.invoiceCollectedSoFar,
    required this.invoiceDueCount,
    required this.id,
    required this.notaryId,
    required this.firstName,
    required this.email,
    required this.phoneNumber,
    required this.type,
    this.companyId,
    this.companyName,
    required this.notes,
    required this.knownContacts,
    required this.v,
  });

  late final CustomerRates customerRates;
  late final String imageURL;
  late final List<dynamic> labels;
  late final String createdAt;
  late final dynamic invoiceAddress;
  late final int totalAppts;
  late final int completedAppts;
  late final int totalInvoice;
  late final int invoiceCollectedThisMonth;
  late final int invoiceCollectedSoFar;
  late final int invoiceDueCount;
  late final String id;
  late final String notaryId;
  late final String firstName;
  late final String email;
  late final int phoneNumber;
  late final String type;
  late final dynamic companyId;
  late final String? companyName;
  late final List<dynamic> notes;
  late final List<dynamic> knownContacts;
  late final int v;

  Lead.fromJson(Map<String, dynamic> json) {
    customerRates = CustomerRates.fromJson(json['customerRates']);
    imageURL = json['imageURL'];
    labels = List.castFrom<dynamic, dynamic>(json['labels']);
    createdAt = json['createdAt'];
    invoiceAddress = json['invoiceAddress'];
    totalAppts = json['totalAppts'];
    completedAppts = json['completedAppts'];
    totalInvoice = json['totalInvoice'];
    invoiceCollectedThisMonth = json['invoiceCollectedThisMonth'];
    invoiceCollectedSoFar = json['invoiceCollectedSoFar'];
    invoiceDueCount = json['invoiceDueCount'];
    id = json['_id'];
    notaryId = json['notaryId'];
    firstName = json['firstName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    type = json['type'];
    companyId = json['companyId'] != null ? CompanyId.fromJson(json['companyId']) : null;
    companyName = json['companyName'];
    notes = List.castFrom<dynamic, dynamic>(json['notes']);
    knownContacts = List.castFrom<dynamic, dynamic>(json['knownContacts']);
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['customerRates'] = customerRates.toJson();
    data['imageURL'] = imageURL;
    data['labels'] = labels;
    data['createdAt'] = createdAt;
    data['invoiceAddress'] = invoiceAddress;
    data['totalAppts'] = totalAppts;
    data['completedAppts'] = completedAppts;
    data['totalInvoice'] = totalInvoice;
    data['invoiceCollectedThisMonth'] = invoiceCollectedThisMonth;
    data['invoiceCollectedSoFar'] = invoiceCollectedSoFar;
    data['invoiceDueCount'] = invoiceDueCount;
    data['_id'] = id;
    data['notaryId'] = notaryId;
    data['firstName'] = firstName;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['type'] = type;
    if (companyId != null) {
      data['companyId'] = companyId.toJson();
    }
    data['companyName'] = companyName;
    data['notes'] = notes;
    data['knownContacts'] = knownContacts;
    data['__v'] = v;
    return data;
  }
}

class CustomerRates {
  CustomerRates({
    required this.others,
  });

  late final List<dynamic> others;

  CustomerRates.fromJson(Map<String, dynamic> json) {
    others = List.castFrom<dynamic, dynamic>(json['others']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['others'] = others;
    return data;
  }
}

class CompanyId {
  CompanyId({
    this.invoiceAddress,
    required this.photoURL,
    required this.notes,
    required this.orderEmailAddress,
    required this.invoiceCollectedThisMonth,
    required this.invoiceCollectedSoFar,
    required this.invoiceDueCount,
    required this.contacts,
    required this.defaultInvoiceAmount,
    required this.totalAppts,
    required this.completedAppts,
    required this.totalInvoice,
    required this.createdAt,
    required this.id,
    required this.userId,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.knownContacts,
    required this.v,
  });

  late final dynamic invoiceAddress;
  late final String photoURL;
  late final List<dynamic> notes;
  late final List<dynamic> orderEmailAddress;
  late final int invoiceCollectedThisMonth;
  late final int invoiceCollectedSoFar;
  late final int invoiceDueCount;
  late final List<dynamic> contacts;
  late final int defaultInvoiceAmount;
  late final int totalAppts;
  late final int completedAppts;
  late final int totalInvoice;
  late final String createdAt;
  late final String id;
  late final String userId;
  late final String name;
  late final String email;
  late final int phoneNumber;
  late final List<dynamic> knownContacts;
  late final int v;

  CompanyId.fromJson(Map<String, dynamic> json) {
    invoiceAddress = json['invoiceAddress'];
    photoURL = json['photoURL'];
    notes = List.castFrom<dynamic, dynamic>(json['notes']);
    orderEmailAddress = List.castFrom<dynamic, dynamic>(json['orderEmailAddress']);
    invoiceCollectedThisMonth = json['invoiceCollectedThisMonth'];
    invoiceCollectedSoFar = json['invoiceCollectedSoFar'];
    invoiceDueCount = json['invoiceDueCount'];
    contacts = List.castFrom<dynamic, dynamic>(json['contacts']);
    defaultInvoiceAmount = json['defaultInvoiceAmount'];
    totalAppts = json['totalAppts'];
    completedAppts = json['completedAppts'];
    totalInvoice = json['totalInvoice'];
    createdAt = json['createdAt'];
    id = json['_id'];
    userId = json['userId'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    knownContacts = List.castFrom<dynamic, dynamic>(json['knownContacts']);
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['invoiceAddress'] = invoiceAddress;
    data['photoURL'] = photoURL;
    data['notes'] = notes;
    data['orderEmailAddress'] = orderEmailAddress;
    data['invoiceCollectedThisMonth'] = invoiceCollectedThisMonth;
    data['invoiceCollectedSoFar'] = invoiceCollectedSoFar;
    data['invoiceDueCount'] = invoiceDueCount;
    data['contacts'] = contacts;
    data['defaultInvoiceAmount'] = defaultInvoiceAmount;
    data['totalAppts'] = totalAppts;
    data['completedAppts'] = completedAppts;
    data['totalInvoice'] = totalInvoice;
    data['createdAt'] = createdAt;
    data['_id'] = id;
    data['userId'] = userId;
    data['name'] = name;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['knownContacts'] = knownContacts;
    data['__v'] = v;
    return data;
  }
}
