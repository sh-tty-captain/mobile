part of 'components.dart';

class ModalDescriptionLayout extends StatelessWidget {
  final String descriptionText;

  const ModalDescriptionLayout({
    Key? key,
    required this.descriptionText,
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
                descriptionText,
                style: Styles.descriptionModal,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
