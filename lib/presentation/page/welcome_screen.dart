import 'package:flutter/material.dart';
import 'package:movie_ticket/helper/app_localizations.dart';
import 'package:movie_ticket/presentation/page/sign_in_screen.dart';
import 'package:movie_ticket/presentation/page/sign_up_screen.dart';
import 'package:movie_ticket/presentation/widget/wel_slider_widget.dart';
import 'package:movie_ticket/provider/post_welcome_provider.dart';
import 'package:movie_ticket/util/function.dart';
import 'package:movie_ticket/util/theme.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostWelcomeProvider>().getPostWelcome();
  }

  bool _showChoseLanguageLayout = false;
  String _currentLanguage = 'vi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/image/logo.png'),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _showChoseLanguageLayout = true;
                        });
                        // if (appLanguage.appLocale == const Locale("en")) {
                        //   appLanguage.changeLanguage(const Locale("vi"));
                        // } else {
                        //   appLanguage.changeLanguage(const Locale("en"));
                        // }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        width: MediaQuery.sizeOf(context).width * 0.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: kBlackColor,
                            border: Border.all(color: kBorderColor)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/image/home_trans.png'),
                            const SizedBox(
                              width: 5,
                            ),
                            textWelcomeScreen(
                                AppLocalizations.of(context)!
                                    .translate('language')!,
                                12)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                FutureBuilder(
                  future: context.read<PostWelcomeProvider>().getPostWelcome(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    if (snapshot.hasData) {
                      return WelSliderWidget(listImage: snapshot.data!);
                    }
                    return Text('No data');

                    // return Text('data');
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                textWelcomeScreen('Welcome Mbooking', 32),
                const SizedBox(
                  height: 20,
                ),
                textWelcomeScreen('Enjoy favorite movie', 16),
                const SizedBox(
                  height: 70,
                ),
                GestureDetector(
                  onTap: () {
                    Func.navigateToNextScreen(context, const SignInScreen());
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25), // Bo góc
                      color: kPrimaryColor,
                    ),
                    child: const Text(
                      textAlign: TextAlign.center,
                      'Sign in',
                      style: TextStyle(
                          color: kBlackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Func.navigateToNextScreen(context, const SignUpScreen());
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: kBlackColor,
                        border: Border.all(color: kBorderColor)),
                    child: const Text(
                      textAlign: TextAlign.center,
                      'Sign up',
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'By sign in or sign up, you agree to our Terms of Service and Privacy Policy',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFFB3B3B3), fontSize: 12),
                ),
              ],
            ),
          ),
          Visibility(
            visible: _showChoseLanguageLayout,
            child: Align(
                alignment: const Alignment(-1, 1),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: kBgModal,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 30.0, top: 10, left: 12, right: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textWelcomeScreen('Chosen language', 32),
                              textWelcomeScreen(
                                  "Which language do you want to use?", 14),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textWelcomeScreen('English', 20),
                                  Radio(
                                      activeColor: kPrimaryColor,
                                      value: 'en',
                                      groupValue: _currentLanguage,
                                      onChanged: (value) => setState(() {
                                            _currentLanguage = value.toString();
                                            print(_currentLanguage);
                                          }))
                                ],
                              ),
                              const Divider(
                                endIndent: 0,
                                thickness: 1,
                                color: kGreyColor,
                                indent: 0,
                                height: 0.3,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textWelcomeScreen('Vietnamese', 20),
                                  Radio(
                                      activeColor: kPrimaryColor,
                                      value: 'vi',
                                      groupValue: _currentLanguage,
                                      onChanged: (value) => setState(() {
                                            _currentLanguage = value.toString();
                                            print(_currentLanguage);
                                          }))
                                ],
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _showChoseLanguageLayout = false;
                              });
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: kPrimaryColor,
                                  border: Border.all(color: kPrimaryColor)),
                              child: const Text(
                                textAlign: TextAlign.center,
                                'Chosen language',
                                style: TextStyle(
                                    color: kBlackColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          )
        ]),
      ),
    );
  }

  Text textWelcomeScreen(text, double fontSize) => Text(text.toString(),
      style: TextStyle(fontSize: fontSize, color: kWhiteColor));
}
