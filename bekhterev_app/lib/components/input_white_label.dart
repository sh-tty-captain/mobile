part of 'components.dart';

class InputWhiteLayout extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextEditingController? controller;
  final TextInputType? type;
  final String? prefix;
  final Widget? icon;
  final int? maxLength;
  final ValueChanged? onChanged;

  const InputWhiteLayout({
    Key? key,
    required this.label,
    required this.placeholder,
    this.controller,
    this.prefix,
    this.type,
    this.icon,
    this.maxLength,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: <Widget>[
        Text(label, style: Styles.labelInputWhite),
        SizedBox(height: 5),
        TextField(
          controller: controller,
          keyboardType: type,
          onChanged: onChanged,
          maxLength: maxLength,
          cursorColor: Color(0xFFFFFFFF),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            prefixText: prefix,
            labelText: placeholder,
            labelStyle: TextStyle(color: Colors.white),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefixIcon: icon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: BorderSide(
                color: Color(0xFFFFFFFF),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: BorderSide(
                color: Color(0xFFFFFFFF),
                width: 1.0,
              ),
            ),
            filled: true,
            fillColor: Colors.transparent,
          ),
          style: Styles.hintWhite),
      ],
    );
  }
}
