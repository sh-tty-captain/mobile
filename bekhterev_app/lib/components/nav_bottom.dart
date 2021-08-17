part of 'components.dart';

class BottomNav extends StatelessWidget {
  static const bool _showNotch = true;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 35,
      shape: _showNotch ? const CircularNotchedRectangle() : null,
      child: Row(
        children: [
          IconButton(
              padding: EdgeInsets.only(left: 25, top: 10, bottom: 10),
              iconSize: 45,
              icon: Icon(
                Icons.perm_identity,
                color: Color(0xFF222222),
              ),
              onPressed: () =>
                  Navigator.push(context, ProfilePage.route()),
              ),
          Spacer(),
          IconButton(
            padding: EdgeInsets.only(right: 25, top: 10, bottom: 10),
            iconSize: 45,
            icon: Icon(
              Icons.mail_outline,
              color: Color(0xFF222222),
            ),
            onPressed: () =>
                Navigator.push(context, NotificationsPage.route()),
          ),
        ],
      ),
    );
  }
}

class BottomNavHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        tooltip: 'Вернуться на Главную',
        elevation: 0,
        backgroundColor: Color(0xFFE8C883),
        child: Icon(
          Icons.home,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
              (route) => false);
        });
  }
}
