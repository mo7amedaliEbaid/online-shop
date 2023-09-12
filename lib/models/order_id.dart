class OrderIdModel {
  String next;
  dynamic previous;
  List<Result> results;

  OrderIdModel({
    required this.next,
    required this.previous,
    required this.results,
  });

  factory OrderIdModel.fromJson(Map<String, dynamic> json) => OrderIdModel(
    next: json["next"],
    previous: json["previous"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  int id;
  DateTime createdAt;
  bool deliveryNeeded;
  Merchant merchant;
  dynamic collector;
  int amountCents;
  ShippingData? shippingData;
  Currency currency;
  bool isPaymentLocked;
  bool isReturn;
  bool isCancel;
  bool isReturned;
  bool isCanceled;
  String? merchantOrderId;
  dynamic walletNotification;
  int paidAmountCents;
  bool notifyUserWithEmail;
  List<Item> items;
  String orderUrl;
  int commissionFees;
  int deliveryFeesCents;
  int deliveryVatCents;
  PaymentMethod paymentMethod;
  dynamic merchantStaffTag;
  ApiSource apiSource;
  Data data;

  Result({
    required this.id,
    required this.createdAt,
    required this.deliveryNeeded,
    required this.merchant,
    required this.collector,
    required this.amountCents,
    required this.shippingData,
    required this.currency,
    required this.isPaymentLocked,
    required this.isReturn,
    required this.isCancel,
    required this.isReturned,
    required this.isCanceled,
    required this.merchantOrderId,
    required this.walletNotification,
    required this.paidAmountCents,
    required this.notifyUserWithEmail,
    required this.items,
    required this.orderUrl,
    required this.commissionFees,
    required this.deliveryFeesCents,
    required this.deliveryVatCents,
    required this.paymentMethod,
    required this.merchantStaffTag,
    required this.apiSource,
    required this.data,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    deliveryNeeded: json["delivery_needed"],
    merchant: Merchant.fromJson(json["merchant"]),
    collector: json["collector"],
    amountCents: json["amount_cents"],
    shippingData: json["shipping_data"] == null ? null : ShippingData.fromJson(json["shipping_data"]),
    currency: currencyValues.map[json["currency"]]!,
    isPaymentLocked: json["is_payment_locked"],
    isReturn: json["is_return"],
    isCancel: json["is_cancel"],
    isReturned: json["is_returned"],
    isCanceled: json["is_canceled"],
    merchantOrderId: json["merchant_order_id"],
    walletNotification: json["wallet_notification"],
    paidAmountCents: json["paid_amount_cents"],
    notifyUserWithEmail: json["notify_user_with_email"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    orderUrl: json["order_url"],
    commissionFees: json["commission_fees"],
    deliveryFeesCents: json["delivery_fees_cents"],
    deliveryVatCents: json["delivery_vat_cents"],
    paymentMethod: paymentMethodValues.map[json["payment_method"]]!,
    merchantStaffTag: json["merchant_staff_tag"],
    apiSource: apiSourceValues.map[json["api_source"]]!,
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "delivery_needed": deliveryNeeded,
    "merchant": merchant.toJson(),
    "collector": collector,
    "amount_cents": amountCents,
    "shipping_data": shippingData?.toJson(),
    "currency": currencyValues.reverse[currency],
    "is_payment_locked": isPaymentLocked,
    "is_return": isReturn,
    "is_cancel": isCancel,
    "is_returned": isReturned,
    "is_canceled": isCanceled,
    "merchant_order_id": merchantOrderId,
    "wallet_notification": walletNotification,
    "paid_amount_cents": paidAmountCents,
    "notify_user_with_email": notifyUserWithEmail,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "order_url": orderUrl,
    "commission_fees": commissionFees,
    "delivery_fees_cents": deliveryFeesCents,
    "delivery_vat_cents": deliveryVatCents,
    "payment_method": paymentMethodValues.reverse[paymentMethod],
    "merchant_staff_tag": merchantStaffTag,
    "api_source": apiSourceValues.reverse[apiSource],
    "data": data.toJson(),
  };
}

enum ApiSource {
  OTHER
}

final apiSourceValues = EnumValues({
  "OTHER": ApiSource.OTHER
});

enum Currency {
  EGP
}

final currencyValues = EnumValues({
  "EGP": Currency.EGP
});

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Item {
  Name name;
  Description description;
  int amountCents;
  int quantity;

  Item({
    required this.name,
    required this.description,
    required this.amountCents,
    required this.quantity,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    name: nameValues.map[json["name"]]!,
    description: descriptionValues.map[json["description"]]!,
    amountCents: json["amount_cents"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "name": nameValues.reverse[name],
    "description": descriptionValues.reverse[description],
    "amount_cents": amountCents,
    "quantity": quantity,
  };
}

enum Description {
  POWER_BANK,
  SMART_WATCH
}

final descriptionValues = EnumValues({
  "Power Bank": Description.POWER_BANK,
  "Smart Watch": Description.SMART_WATCH
});

enum Name {
  ASC1515,
  ERT6565
}

final nameValues = EnumValues({
  "ASC1515": Name.ASC1515,
  "ERT6565": Name.ERT6565
});

class Merchant {
  int id;
  DateTime createdAt;
  List<String> phones;
  List<CompanyEmail> companyEmails;
  CompanyName companyName;
  String state;
  Country country;
  City city;
  String postalCode;
  String street;

  Merchant({
    required this.id,
    required this.createdAt,
    required this.phones,
    required this.companyEmails,
    required this.companyName,
    required this.state,
    required this.country,
    required this.city,
    required this.postalCode,
    required this.street,
  });

  factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    phones: List<String>.from(json["phones"].map((x) => x)),
    companyEmails: List<CompanyEmail>.from(json["company_emails"].map((x) => companyEmailValues.map[x]!)),
    companyName: companyNameValues.map[json["company_name"]]!,
    state: json["state"],
    country: countryValues.map[json["country"]]!,
    city: cityValues.map[json["city"]]!,
    postalCode: json["postal_code"],
    street: json["street"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "phones": List<dynamic>.from(phones.map((x) => x)),
    "company_emails": List<dynamic>.from(companyEmails.map((x) => companyEmailValues.reverse[x])),
    "company_name": companyNameValues.reverse[companyName],
    "state": state,
    "country": countryValues.reverse[country],
    "city": cityValues.reverse[city],
    "postal_code": postalCode,
    "street": street,
  };
}

enum City {
  CAIRO
}

final cityValues = EnumValues({
  "cairo": City.CAIRO
});

enum CompanyEmail {
  MOHAMED_HAMOUDA7897_GMAIL_COM
}

final companyEmailValues = EnumValues({
  "mohamed.hamouda7897@gmail.com": CompanyEmail.MOHAMED_HAMOUDA7897_GMAIL_COM
});

enum CompanyName {
  ALMURAFIQ
}

final companyNameValues = EnumValues({
  "almurafiq": CompanyName.ALMURAFIQ
});

enum Country {
  EGY
}

final countryValues = EnumValues({
  "EGY": Country.EGY
});

enum PaymentMethod {
  TBC
}

final paymentMethodValues = EnumValues({
  "tbc": PaymentMethod.TBC
});

class ShippingData {
  int id;
  String firstName;
  String lastName;
  String street;
  String building;
  String floor;
  String apartment;
  String city;
  String state;
  String country;
  String email;
  String phoneNumber;
  String postalCode;
  String extraDescription;
  String shippingMethod;
  int orderId;
  int order;

  ShippingData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.street,
    required this.building,
    required this.floor,
    required this.apartment,
    required this.city,
    required this.state,
    required this.country,
    required this.email,
    required this.phoneNumber,
    required this.postalCode,
    required this.extraDescription,
    required this.shippingMethod,
    required this.orderId,
    required this.order,
  });

  factory ShippingData.fromJson(Map<String, dynamic> json) => ShippingData(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    street: json["street"],
    building: json["building"],
    floor: json["floor"],
    apartment: json["apartment"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    postalCode: json["postal_code"],
    extraDescription: json["extra_description"],
    shippingMethod: json["shipping_method"],
    orderId: json["order_id"],
    order: json["order"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "street": street,
    "building": building,
    "floor": floor,
    "apartment": apartment,
    "city": city,
    "state": state,
    "country": country,
    "email": email,
    "phone_number": phoneNumber,
    "postal_code": postalCode,
    "extra_description": extraDescription,
    "shipping_method": shippingMethod,
    "order_id": orderId,
    "order": order,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
