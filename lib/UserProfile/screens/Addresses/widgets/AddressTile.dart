import 'package:Taag/graphql/api.graphql.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AddressTile extends StatelessWidget {
  final AddressMixin address;
  const AddressTile({Key key, @required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText.rich(
      TextSpan(children: [
        TextSpan(
            style: Theme.of(context).textTheme.headline5,
            text: '${address.state}\n'),
        TextSpan(
            style: Theme.of(context).textTheme.subtitle1,
            text: '${address.city}\n'),
        TextSpan(
            style: Theme.of(context).textTheme.subtitle1,
            text: '${address.line1 + address.line2}\n'),
        TextSpan(
            style: Theme.of(context).textTheme.subtitle1,
            text: '${address.state + address.postal}\n'),
      ]),
      minFontSize: 6,
      maxLines: 5,
    );
  }
}