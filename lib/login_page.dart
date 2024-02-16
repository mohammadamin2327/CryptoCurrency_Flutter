import 'package:coinmarketcap/password_text_form_field.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:coinmarketcap/register_settings.dart';
import 'package:coinmarketcap/utils/constants.dart';
import 'package:coinmarketcap/view/home_page.dart';
import 'package:coinmarketcap/register_page.dart';
import 'package:coinmarketcap/text_button.dart';
import 'package:flutter/material.dart';
import 'email_text_form_field.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final SupabaseClient supabase = Supabase.instance.client;
  bool visibilityPassword = true;
  String titleScreen = 'Log In Screen';
  String subTitleScreen = 'Please Log In';
  String actionButtonText = 'Log In';
  String accountAction = 'Don\'t have an account';
  String accountActionButton = 'Sign Up';
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _setupAuthListener();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          setRegisterText(
            text: titleScreen,
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
          setRegisterText(
            text: 'Welcome to our application \n $subTitleScreen',
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormFieldSettings(
              formKey: _formKey,
              textEditingController: emailController,
            ),
          ),
          PasswordTextFormField(
            formKey: _formKey,
            textEditingController: passwordController,
            visibilityPassword: visibilityPassword,
          ),
          SizedBox(
            width: 250,
            height: 55,
            child: ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.blueAccent,
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                ),
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  actionButtonText == 'Log In'
                      ? await RegisterSettings()
                          .signUpNewUser(emailController, passwordController)
                      : await RegisterSettings()
                          .signInWithEmail(emailController, passwordController);
                  _setupAuthListener();
                }
              },
              child: Text(
                actionButtonText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(accountAction),
              TextButtonWidget(
                textStyle: const TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 20,
                ),
                text: accountActionButton,
                onPressed: () {
                  setState(
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const RegisterPage(),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _setupAuthListener() {
    supabase.auth.onAuthStateChange.listen(
      (data) {
        final event = data.event;
        debugPrint(AuthChangeEvent.values.toString());
        if (event == AuthChangeEvent.signedIn) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        }
      },
    );
  }
}
