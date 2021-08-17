part of 'components.dart';

class InputDefaultLayout extends StatelessWidget {
  final String label;
  final String? error;
  final TextInputType? type;
  final Widget? icon;
  final String? prefix;
  final int? maxLength;
  final List<TextInputFormatter>? formatter;
  final TextEditingController? controller;
  final ValueChanged? onChanged;

  const InputDefaultLayout({
    Key? key,
    required this.label,
    this.error,
    this.prefix,
    this.type,
    this.formatter,
    this.controller,
    this.icon,
    this.maxLength,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: type,
      onChanged: onChanged,
      inputFormatters: formatter,
      maxLength: maxLength,
      decoration: InputDecoration(
        prefixText: prefix,
        prefixStyle: Styles.descriptionModal,
        contentPadding: EdgeInsets.all(10),
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: icon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Color(0xFF2280CE),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Color(0xFF2280CE),
            width: 1.0,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        errorText: error,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Color(0xFFD31717),
            width: 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Color(0xFFD31717),
            width: 1.0,
          ),
        ),
      ),
      style: Styles.styleInput);
  }
}
