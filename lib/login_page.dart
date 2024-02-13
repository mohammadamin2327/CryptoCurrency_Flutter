import 'package:coinmarketcap/view/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:coinmarketcap/register_page.dart';
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
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  titleScreen,
                  style: const TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Welcome to our application \n $subTitleScreen',
                style: const TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                ),
                hintText: 'Email Address',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
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
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                ),
                hintText: 'Password',
              ),
            ),
          ),
          SizedBox(
            width: 200,
            height: 70,
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
              onPressed: () {
                actionButtonText == 'Log In'
                    ? signUpNewUser()
                    : signInWithEmail();
              },
              child: Text(actionButtonText,style: const TextStyle(color: Colors.white,fontSize: 30)),
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
                child: Text(accountActionButton,
                    style: const TextStyle(
                        color: Colors.blueAccent, fontSize: 20)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<AuthResponse> signUpNewUser() async {
    final AuthResponse responseSignUpAuth = await supabase.auth.signUp(
      email: emailController.text,
      password: passwordController.text,
    );
    return responseSignUpAuth;
  }

  Future<AuthResponse> signInWithEmail() async {
    final AuthResponse responseSignInAuth =
        await supabase.auth.signInWithPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    return responseSignInAuth;
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
  }

  void _setupAuthListener() {
    supabase.auth.onAuthStateChange.listen(
      (data) {
        debugPrint(data.toString());
        final event = data.event;
        if (event == AuthChangeEvent.signedIn) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        }
      },
    );
  }
}
