part of 'components.dart';

class ProcedureLayout extends StatelessWidget {
  final String? procedureName;

  const ProcedureLayout({
    Key? key,
    this.procedureName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text(
                'Процедура: ' + procedureName.toString(),
                style: Styles.subtitleModal,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
