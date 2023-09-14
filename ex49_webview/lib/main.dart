import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ex49 WebView'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel("JsFlutter",
          onMessageReceived: (JavaScriptMessage message) {
        print(message.message);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message.message)),
        );
      })
      // ..loadFlutterAsset("assets/html/my.html");
      ..loadRequest(Uri.parse('https://map.kakao.com'));
  }
  // WebViewController controller = WebViewController()
  // 웹뷰 생성 1단계
  // ..setJavaScriptMode(JavaScriptMode.unrestricted)
  // ..setBackgroundColor(const Color(0x00000000))
  // ..setNavigationDelegate(
  //   NavigationDelegate(
  //     // 진행사항을 보고하기 위해 페이지가 로드될 때 호출합니다.
  //     onProgress: (int progress) {/* Update loading var */},
  //     // 페이지 로드가 시작되면 호출됩니다.
  //     onPageStarted: (String url) {},
  //     // 페이지 로드가 완료되면 호출됩니다.
  //     onPageFinished: (String url) {
  //       // ignore: avoid_print
  //       print("onPageFinished");
  //     },
  //     onWebResourceError: (WebResourceError error) {},
  //     onNavigationRequest: (NavigationRequest request) {
  //       if (request.url.startsWith('https://www.youtube.com/')) {
  //         return NavigationDecision.prevent;
  //       }
  //       return NavigationDecision.navigate;
  //     },
  //   ),
  // )
  // ..loadRequest(Uri.parse('https://flutter.dev'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(   // 2 번째
          children: [
            // 플러터 버튼에서 자바스크립트 함수 호출하기 : 카카오맵 사용시 필수
            ElevatedButton(
              onPressed: () => callJavaScript(),
              child: const Text('Flutter에서 자바스크립트 실행'),
            ),
            SizedBox(
              height: 500,
              child: WebViewWidget(
                controller: controller,
              ),
            ),
          ],
        ),
        // child: Expanded(
        //   child: WebViewWidget(
        //     controller: controller,
        //   ),
        // ),
      ),
    );
  }

  void callJavaScript() {
    controller.runJavaScript('alert("홍길동")');
    // controller.runJavaScript('appToJs("안녕하세요")');
  }
}
