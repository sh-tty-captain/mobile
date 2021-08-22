import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bekhterev_app/components/components.dart';

import 'dart:async';
import 'dart:io';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }

  runApp(new TelemedicinePage());
}

class TelemedicinePage extends StatefulWidget {
  final List<String> list = List.generate(59, (index) => "Text $index");

  TelemedicinePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => TelemedicinePage());
  }

  @override
  _TelemedicinePageState createState() => _TelemedicinePageState();
}

class _TelemedicinePageState extends State<TelemedicinePage> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  late PullToRefreshController pullToRefreshController;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();

  @override
  void initState() {
    super.initState();

    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(
              urlRequest: URLRequest(url: await webViewController?.getUrl()));
        } else if (kIsWeb) {
          webViewController?.loadUrl(
              urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Телемедицинская консультация'),
        centerTitle: false,
        backgroundColor: Color(0xFF2280CE),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: Search(widget.list));
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Column(children: <Widget>[
        ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(50, 50))
                  ),
                  child: Icon(Icons.arrow_back),
                  onPressed: () {
                    webViewController?.goBack();
                  },
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(50, 50))
                  ),
                  child: Icon(Icons.arrow_forward),
                  onPressed: () {
                    webViewController?.goForward();
                  },
                ),
              ],
            ),
            ElevatedButton(
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(50, 50))
              ),
              child: Icon(Icons.refresh),
              onPressed: () {
                webViewController?.reload();
              },
            ),
          ],
        ),
        Expanded(
          child: Stack(
            children: [
              InAppWebView(
                key: webViewKey,
                initialUrlRequest: URLRequest(url: Uri.parse("https://telemed.bekhterev.ru/")),
                initialOptions: options,
                pullToRefreshController: pullToRefreshController,
                onWebViewCreated: (controller) {
                  webViewController = controller;
                },
                onLoadStart: (controller, url) {
                  setState(() {
                    this.url = url.toString();
                    urlController.text = this.url;
                  });
                },
                onReceivedHttpAuthRequest: (InAppWebViewController controller, challenge) async {
                  return HttpAuthResponse(
                      username: "test", password: "test", action: HttpAuthResponseAction.PROCEED);
                },
                androidOnPermissionRequest: (controller, origin, resources) async {
                  return PermissionRequestResponse(
                      resources: resources, action: PermissionRequestResponseAction.GRANT);
                },
                shouldOverrideUrlLoading: (controller, navigationAction) async {
                  var uri = navigationAction.request.url!;

                  if (!["http", "https", "file", "chrome", "data", "javascript", "about"]
                      .contains(uri.scheme)) {
                    if (await canLaunch(url)) {
                      // Launch the App
                      await launch(
                        url,
                      );
                      // and cancel the request
                      return NavigationActionPolicy.CANCEL;
                    }
                  }

                  return NavigationActionPolicy.ALLOW;
                },
                onLoadStop: (controller, url) async {
                  pullToRefreshController.endRefreshing();
                  setState(() {
                    this.url = url.toString();
                    urlController.text = this.url;
                  });
                },
                onLoadError: (controller, url, code, message) {
                  pullToRefreshController.endRefreshing();
                },
                onProgressChanged: (controller, progress) {
                  if (progress == 100) {
                    pullToRefreshController.endRefreshing();
                  }
                  setState(() {
                    this.progress = progress / 100;
                    urlController.text = this.url;
                  });
                },
                onUpdateVisitedHistory: (controller, url, androidIsReload) {
                  setState(() {
                    this.url = url.toString();
                    urlController.text = this.url;
                  });
                },
                onConsoleMessage: (controller, consoleMessage) {
                  print(consoleMessage);
                },
              ),
              progress < 1.0 ? LinearProgressIndicator(value: progress) : Container(),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: BottomNav(),
      floatingActionButton: BottomNavHome(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
