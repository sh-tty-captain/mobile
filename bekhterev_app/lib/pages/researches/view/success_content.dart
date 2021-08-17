import 'package:bekhterev_app/components/components.dart';
import 'package:bekhterev_app/layers/ui/pages/researches.dart';
import 'package:flutter/material.dart';
import 'package:bekhterev_app/components/styles.dart';

class SuccessContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() async {
      return (await Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => ResearchPageAssemble()),
              (Route<dynamic> route) => false)) ??
          false;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Column(
        children: [
          Container(
            child: Expanded(
              child: AppPageContainer(
                child: Center(
                    child: Text('Вы были успешно записаны.', style: Styles.titleModal,)
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }
}
