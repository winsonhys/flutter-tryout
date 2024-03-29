import 'package:Taag/UserProfile/screens/AddCreditCard/providers/CreditCardProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubmitCreditCardButtonWidget extends StatelessWidget {
  final Function() onSubmitPressed;
  const SubmitCreditCardButtonWidget({Key key, @required this.onSubmitPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loading = context.watch<CreditCardProvider>().isAddingCreditCard;
    return RaisedButton(
        padding: const EdgeInsets.all(0),
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        onPressed: () => onSubmitPressed(),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).accentColor
                  ],
                )),
            child: loading
                ? CircularProgressIndicator()
                : Text(
                    'Submit',
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )));
  }
}
