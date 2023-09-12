abstract class PaymentsStates{}

class PaymentInitialState extends PaymentsStates{}

class PaymentSuccessState extends PaymentsStates{}

class PaymentsErrorState extends PaymentsStates {
  String error;
  PaymentsErrorState(this.error);
}

class PaymentOrderIdSuccessState extends PaymentsStates{}

class PaymentsOrderIdErrorState extends PaymentsStates {
  String error;
  PaymentsOrderIdErrorState(this.error);
}

class PaymentRequestTokenSuccessState extends PaymentsStates{}

class PaymentsRequestTokenErrorState extends PaymentsStates {
  String error;
  PaymentsRequestTokenErrorState(this.error);
}
class PaymentRequestTokenKioskSuccessState extends PaymentsStates{}

class PaymentsRequestTokenKioskErrorState extends PaymentsStates {
  String error;
  PaymentsRequestTokenKioskErrorState(this.error);
}

class PaymentReferenceCodeSuccessState extends PaymentsStates{}

class PaymentReferenceCodeErrorState extends PaymentsStates {
  String error;
  PaymentReferenceCodeErrorState(this.error);
}

