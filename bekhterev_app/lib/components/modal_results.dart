part of 'components.dart';

class ModalResults extends StatelessWidget {
  final String document;
  final String department;
  final Widget date;
  final String name;
  final String birthdate;
  final String age;
  final String address;
  final String history;
  final String mkb;
  final String doctor;
  final String specialization;
  final String description;
  final String conclusion;
  final VoidCallback? delete;
  final VoidCallback? download;

  const ModalResults({
    Key? key,
    required this.document,
    required this.department,
    required this.date,
    required this.name,
    required this.birthdate,
    required this.age,
    required this.address,
    required this.history,
    required this.mkb,
    required this.doctor,
    required this.specialization,
    required this.description,
    required this.conclusion,
    this.delete,
    this.download,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textWidth = MediaQuery.of(context).size.width * 0.65;

    return Container(
      padding: EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.87,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
        boxShadow: [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 10.0,
            spreadRadius: 0,
            offset: Offset(
              0,
              -4,
            ),
          )
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 4,
                  child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                  AppFilledCircleTapIcon(
                  icon: Icons.file_download,
                    color: Color(0xFF2280CE),
                    colorSplash: Color(0xFF42A1F0),
                    onTap: download,
                  ),
                    SizedBox(width: 10),
                    AppFilledCircleTapIcon(
                      icon: Icons.delete_outline,
                      color: Color(0xFFD31717),
                      colorSplash: Color(0xFFEC3636),
                      onTap: delete,
                    ),
                  ]),
                ),
              ],
            ),
            SizedBox(height: 35),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Федеральное государственное бюджетное учреждение «Национальный медицинский исследовательский центр психиатрии и неврологии им. В.М. Бехтерева» министерства здравоохранения Российской Федерации',
                  style: Styles.styleSmallDescriptionGray, textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  department,
                  style: Styles.styleSmallDescription, textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 25),
            Container(
              alignment: Alignment.topRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: Styles.titleNew,
                  ),
                  SizedBox(height: 5),
                  Text(
                    birthdate + ', возраст: ' + age,
                    style: Styles.titleNew,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Адрес: ' + address,
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),
            Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text(
                  document.toUpperCase(),
                  style: Styles.titleModal,
                ),
                  SizedBox(height: 10),
                  date,
                ],
              ),
            ),
            SizedBox(height: 35),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 8,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: textWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'История болезни:',
                          style: Styles.descriptionModal,
                        ),
                        SizedBox(height: 5),
                        Text(
                          history,
                          style: Styles.descriptionNew,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.topRight,
                    width: textWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Код МКБ:',
                          style: Styles.descriptionModal,
                        ),
                        SizedBox(height: 5),
                        Text(
                          mkb,
                          style: Styles.descriptionNew,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              'Описание исследования:',
              style: Styles.descriptionModal,
            ),
            SizedBox(height: 5),
            Text(
              description,
              style: Styles.descriptionNew,
            ),
            SizedBox(height: 35),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.centerRight,
                    width: textWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          specialization,
                        ),
                        SizedBox(height: 5),
                        Text(
                          doctor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 35),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Заключение:',
                  style: Styles.descriptionModal,
                ),
                SizedBox(height: 5),
                Text(
                  conclusion,
                  style: Styles.descriptionNew,
                ),
              ],
            ),
            SizedBox(height: 50),
            Container(
              alignment: Alignment.center,
              child: ButtonLayout(
                title: 'Закрыть'.toUpperCase(),
                onTap: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
