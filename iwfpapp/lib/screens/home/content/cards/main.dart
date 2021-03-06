import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/data_backend/base.dart';
import 'package:iwfpapp/widgets/credit_cards/basic.dart';

/// This screen shows all the credit cards in user wallet
///
/// {@category Screens}
class ManageCard extends StatefulWidget {
  final DataBackend dataBackend;
  const ManageCard(this.dataBackend, {Key key}) : super(key: key);
  @override
  _ManageCard createState() {
    return _ManageCard();
  }
}

class _ManageCard extends State<ManageCard> {
  Future<List<CreditCard>> cards;

  @override
  void initState() {
    super.initState();
    cards = widget.dataBackend.getCreditCards();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CreditCard>>(
      future: cards,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.isEmpty) {
            return Container(
              child: ListView(
                children: <Widget>[
                  Material(
                    child: Card(
                        child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 5.0,
                        ),
                        Center(
                          child: Text('No Card Found'),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Center(
                          child: Text(
                            'Use the button below to add cards.',
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                      ],
                    )),
                  )
                ],
              ),
            );
          } else {
            return Container(
                key: Key('suggested_categories'),
                child: Center(
                    child: ListView(
                  children: snapshot.data.map((CreditCard card) {
                    return BasicCreditCard(card, Colors.cyan, true);
                  }).toList(),
                )));
          }
        } else if (snapshot.hasError) {
          return Center(child: Text('error'));
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
