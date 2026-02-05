import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  // OneSignal Initialize
  await OneSignal.shared.setAppId("5e423775-67c6-42de-8a63-d2e6bbfa7219");  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Debug banner hatane ke liye
      title: 'Kitb PK App',
      home: WebViewPage(initialUrl: 'https://www.kitb.pk'), // Aapka Link Yahan Lag Gaya
    );
  }
}

class WebViewPage extends StatefulWidget {
  final String initialUrl;
  WebViewPage({required this.initialUrl});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // WebView Controller Setup
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.initialUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kitb PK'), // App ka Header Name
        backgroundColor: Colors.blue,
      ),
      body: WebViewWidget(controller: _controller), // Corrected WebView implementation
    );
  }
}
