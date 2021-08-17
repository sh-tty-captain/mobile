part of 'components.dart';

class DropdownWhiteLayout<T> extends StatelessWidget {
  final String labelForm;
  final String hint;
  final T? value;
  final String? Function(T?)? validator;
  final List<DropdownMenuItem<T>>? items;
  final ValueChanged? onChanged;

  const DropdownWhiteLayout({
    Key? key,
    required this.labelForm,
    required this.hint,
    this.value,
    this.validator,
    this.items,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelForm, style: Styles.labelInputWhite),
        SizedBox(height: 5),
        DropdownButtonFormField(
          hint: Text(hint, style: Styles.hintWhite),
          value: value,
          validator: validator,
          icon: Icon(Icons.arrow_drop_down, color: Colors.white),
          iconSize: 30,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
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
          items: items,
          onChanged: onChanged,
        ),
      ],
    );

    // DropdownButtonFormField(
    //   hint: Text(hint, style: Styles.hintWhite,
    //   ),
    //   value: value,
    //   icon: Icon(Icons.arrow_drop_down, color: Colors.white),
    //   iconSize: 30,
    //   decoration: InputDecoration(
    //     contentPadding: EdgeInsets.all(10),
    //     enabledBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(3),
    //       borderSide: BorderSide(
    //         color: Color(0xFFFFFFFF),
    //         width: 1.0,
    //       ),
    //     ),
    //     focusedBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(3),
    //       borderSide: BorderSide(
    //         color: Color(0xFFFFFFFF),
    //         width: 1.0,
    //       ),
    //     ),
    //     filled: true,
    //     fillColor: Colors.transparent,
    //   ),
    //   items: items,

    //   onChanged: onChanged,
    // );

    // Container(
    //   height: 48,
    //   padding: EdgeInsets.all(10),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(3),
    //     border: Border.all(
    //       color: Color(0xFFFFFFFF),
    //       width: 1.0,
    //     ),
    //   ),

    //   child: DropdownButton(
    //     items: items,
    //     value: value,
    //     onChanged: onChanged,
    //     isExpanded: true,
    //     hint: Text(hint, style: Styles.hintWhite),
    //     icon: Icon(Icons.arrow_drop_down, color: Colors.white),
    //     iconSize: 30,
    //     underline: Container(
    //       width: double.infinity,
    //     ),
    //   ),
    // );
  }
}
