import 'package:bekhterev_app/components/components.dart';
import 'package:bekhterev_app/layers/ui/pages/tests.dart';
import 'package:bekhterev_app/pages/balance/balance_page.dart';
import 'package:bekhterev_app/layers/ui/pages/researches.dart';
import 'package:bekhterev_app/pages/telemedicine/telemedicine_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<String> list = List.generate(59, (index) => "Text $index");
  HomePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() async {
      return (await Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          HomePage()), (Route<dynamic> route) => false)) ?? false;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text('НМИЦ им. В.М. Бехтерева'),
          centerTitle: false,
          backgroundColor: Color(0xFF2280CE),
          elevation: 0,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Search(list));
              },
              icon: Icon(Icons.search),
            )
          ],
        ),
        body: _Body(),
        bottomNavigationBar: BottomNav(),
        floatingActionButton: BottomNavHome(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppPageContainer(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              AppListEntryLayout(
                prefix: Icon(Icons.assignment_outlined, size: 45, color: Color(0xFF222222)),
                sufix: AppFilledCircleIcon(icon: Icons.visibility),
                title: AppNormalHeader('Тестирования Онлайн'.toUpperCase()),
                subTitle: AppNormalText('Тесты на психологическое состояния; анкетирование'),
                onTap: () => Navigator.push(context, TestsPage.route()),
              ),
              AppListEntryLayout(
                prefix: Icon(Icons.account_balance_wallet_outlined, size: 45, color: Color(0xFF222222)),
                sufix: AppFilledCircleIcon(icon: Icons.visibility),
                title: AppNormalHeader('Пополнение баланса (оплата)'.toUpperCase()),
                subTitle: AppNormalText('Оплата услуг; пополнение средств на счете'),
                onTap: () => Navigator.push(context, BalancePage.route()),
              ),
              AppListEntryLayout(
                prefix: Icon(Icons.date_range_outlined, size: 45, color: Color(0xFF222222)),
                sufix: AppFilledCircleIcon(icon: Icons.visibility),
                title: AppNormalHeader('Запись на Исследования'.toUpperCase()),
                subTitle: AppNormalText('Быстрая регистрация в режиме онлайн'),
                onTap: () => Navigator.push(context, ResearchPage.route()),
              ),
              AppListEntryLayout(
                prefix: Icon(Icons.photo_camera_front, size: 45, color: Color(0xFF222222)),
                sufix: AppFilledCircleIcon(icon: Icons.visibility),
                title: AppNormalHeader('Телемедицинская консультация'.toUpperCase()),
                subTitle: AppNormalText('Онлайн видеоконференция с лечащим врачом'),
                onTap: () => Navigator.push(context, TelemedicinePage.route()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
