import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_ticket/helper/app_localizations.dart';
import 'package:movie_ticket/presentation/page/welcome_screen.dart';
import 'package:movie_ticket/provider/post_welcome_provider.dart';
import 'package:movie_ticket/provider/theme_provider.dart';
import 'package:movie_ticket/util/theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PostWelcomeProvider()),
      ],
      child: MaterialApp(
          supportedLocales: const [
            Locale('en'),
            Locale('vi'),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          theme: darkTheme,
          home: const Scaffold(
            backgroundColor: kBlackColor,
            body: SafeArea(
              bottom: false,
              child: WelcomeScreen(),
            ),
          )),
    );
  }
}
