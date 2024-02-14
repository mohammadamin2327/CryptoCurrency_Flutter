import 'package:coinmarketcap/password_text_form_field.dart';
import 'package:coinmarketcap/register_settings.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:coinmarketcap/view/home_page.dart';
import 'package:coinmarketcap/utils/constants.dart';
import 'package:coinmarketcap/login_page.dart';
import 'package:flutter/material.dart';
import 'email_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final SupabaseClient supabase = Supabase.instance.client;
  bool visibilityPassword = true;
  String titleScreen = 'Register Screen';
  String subTitleScreen = 'Please Sign Up';
  String actionButtonText = 'Sign Up';
  String accountAction = 'Already have an account?';
  String accountActionButton = 'Log in';
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              textEditingController: emailController,
            ),
          ),
          PasswordTextFormField(
            textEditingController: passwordController,
            visibilityPassword: visibilityPassword,
          ),
          TextButton(
            onPressed: () {
              var passwordRecovery = AuthChangeEvent.passwordRecovery;
              debugPrint(passwordRecovery.toString());
            },
            child: const Text('Forgot Password?'),
          ),
          SizedBox(
            width: 250,
            height: 55,
            child: ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blueAccent),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                ),
              ),
              onPressed: () async {
                actionButtonText == 'Sign Up'
                    ? await RegisterSettings().signUpNewUser(emailController, passwordController)
                    : await RegisterSettings().signInWithEmail(emailController, passwordController);
                _setupAuthListener();
              },
              child: Text(
                actionButtonText,
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(accountAction),
              TextButton(
                onPressed: () {
                  setState(
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const LogInPage(),
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  accountActionButton,
                  style:
                      const TextStyle(color: Colors.blueAccent, fontSize: 20),
                ),
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
        debugPrint(data.toString());
        debugPrint(data.event.toString());
        final event = data.event;
        if (event == AuthChangeEvent.initialSession) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        } else if (event == AuthChangeEvent.signedIn) {
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
