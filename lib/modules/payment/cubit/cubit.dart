import 'package:online_shop/modules/payment/cubit/states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../secrets.dart';
import '../../../models/first_token.dart';
import '../../../core/dio.dart';
import '../../../core/utils.dart';

class PaymentCubit extends Cubit<PaymentsStates>{
  PaymentCubit():super(PaymentInitialState());

  static PaymentCubit get(context)=>BlocProvider.of(context);

  FirstToken? firstToken;

  Future getFirstToken(String price,firstName, lastName, email, phone)async{
    DioHelperPayment.postDate(url:'auth/tokens', data: {'api_key':PaymobAPIKey})
        .then((value) {
      PaymobFirstToken=value.data['token'];
      print("First Token : $PaymobFirstToken");
      getOrderId(price,firstName, lastName, email, phone);
      emit(PaymentSuccessState());
    })
        .catchError((error){
          emit(PaymentsErrorState(error));
    });
  }

  Future getOrderId(String price,firstName, lastName, email, phone)async{
    DioHelperPayment.postDate(url:'ecommerce/orders', data: {
      'auth_token':PaymobFirstToken,
      'delivery_needed':'false',
      'amount_cents':price,
      'items':[],
      'currency':'EGP',
    })
        .then((value) {
      OrderId=value.data['id'].toString();
      print("order id : $OrderId");
      getFinalTokenCard(price, firstName, lastName, email, phone);
      getFinalTokenKiosk(price,firstName,lastName,email,phone);
      emit(PaymentOrderIdSuccessState());
    })
        .catchError((error){
          emit(PaymentsOrderIdErrorState(error));
    });
  }

  Future getFinalTokenCard(String price,String firstName,String lastName,String email,String phone)async{
    DioHelperPayment.postDate(
        url:'acceptance/payment_keys',
        data: {
            "auth_token": PaymobFirstToken,
            "amount_cents": price,
            "expiration": 3600,
            "order_id": OrderId,
            "billing_data": {
              "apartment": "NA",
              "email": email,
              "floor": "NA",
              "first_name": firstName,
              "street": "NA",
              "building": "NA",
              "phone_number": phone,
              "shipping_method": "NA",
              "postal_code": "NA",
              "city": "NA",
              "country": "NA",
              "last_name": lastName,
              "state": "NA"
            },
            "currency": "EGP",
            "integration_id": IntegrationIDCard,
            "lock_order_when_paid": "false",
          }
    )
        .then((value) {
      FinalTokenCard=value.data['token'].toString();
      print("Final token Card : $FinalTokenCard");
      emit(PaymentRequestTokenSuccessState());
    })
        .catchError((error){
          emit(PaymentsRequestTokenErrorState(error));
    });
  }

  Future getFinalTokenKiosk(String price,String firstName,String lastName,String email,String phone)async{
    DioHelperPayment.postDate(
        url:'acceptance/payment_keys',
        data: {
            "auth_token": PaymobFirstToken,
            "amount_cents": price,
            "expiration": 3600,
            "order_id": OrderId,
            "billing_data": {
              "apartment": "NA",
              "email": email,
              "floor": "NA",
              "first_name": firstName,
              "street": "NA",
              "building": "NA",
              "phone_number": phone,
              "shipping_method": "NA",
              "postal_code": "NA",
              "city": "NA",
              "country": "NA",
              "last_name": lastName,
              "state": "NA"
            },
            "currency": "EGP",
            "integration_id": IntegrationIDKiosk,
            "lock_order_when_paid": "false",
          }
    )
        .then((value) {
      FinalTokenKiosk=value.data['token'].toString();
      print("Final token Kiosk : $FinalTokenKiosk");
      getRecCode();
      emit(PaymentRequestTokenKioskSuccessState());
    })
        .catchError((error){
          emit(PaymentsRequestTokenKioskErrorState(error));
    });
  }

  Future getRecCode()async{
    DioHelperPayment.postDate(
        url:'acceptance/payments/pay',
        data: {

            "source": {
              "identifier": "AGGREGATOR",
              "subtype": "AGGREGATOR"
            },
            "payment_token": FinalTokenCard,

          }
    )
        .then((value) {
      RefCode=value.data['id'].toString();
      print("RefCode: $RefCode");
      emit(PaymentReferenceCodeSuccessState());
    })
        .catchError((error){
          emit(PaymentReferenceCodeErrorState(error));
    });
  }

}