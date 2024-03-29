import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class PaymentMethodsListTile extends StatelessWidget {
  const PaymentMethodsListTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () => Get.toNamed('PaymentMethods'),
        title: Text(
          'Payment Methods',
          style: Theme.of(context).textTheme.headline6,
        ));
  }
}
