import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:coinmarketcap/view/home_page.dart';
import 'package:coinmarketcap/utils/constants.dart';
import 'package:coinmarketcap/register_page.dart';
import 'text_form_field_settings.dart';
import 'package:flutter/material.dart';

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
              textEditingController: emailController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: TextFormField(
                cursorColor: Colors.black,
                obscureText: visibilityPassword,
                obscuringCharacter: '•',
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.blueAccent,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(
                        () {
                          visibilityPassword == true
                              ? visibilityPassword = false
                              : visibilityPassword = true;
                        },
                      );
                    },
                    icon: visibilityPassword == true
                        ? const Icon(
                            Icons.visibility_off,
                          )
                        : const Icon(
                            Icons.visibility,
                          ),
                  ),
                  hintText: 'Password',
                ),
                validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'Please enter your password';
                    }else if(value.length < 6){
                      return 'Your password must be 6 digits or more.';
                    }else{
                      return null;
                    }
                  },
              ),
            ),
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
                actionButtonText == 'Log In'
                    ? await signUpNewUser()
                    : await signInWithEmail();
                _setupAuthListener();
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
              TextButton(
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

  Future<void> signUpNewUser() async {
    final AuthResponse responseSignUpAuth = await supabase.auth.signUp(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  Future<void> signInWithEmail() async {
    final AuthResponse responseSignInAuth =
        await supabase.auth.signInWithPassword(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
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
