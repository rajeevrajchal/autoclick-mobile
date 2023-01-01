import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/routes/app.route.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://epvwsxcbqcalddxmiskc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVwdndzeGNicWNhbGRkeG1pc2tjIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzAwNDk2NDcsImV4cCI6MTk4NTYyNTY0N30.C5pk5lmBQYYjKvnTtgvgRJE5rhcycjYTzL1i0w6fe6g',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      title: 'auto-click',
      initialRoute: AppRoutes.initialRoutes,
      getPages: AppRoutes.pages,
    );
  }
}
