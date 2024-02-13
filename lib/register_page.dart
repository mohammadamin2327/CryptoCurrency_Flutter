import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:coinmarketcap/view/home_screen.dart';
import 'package:coinmarketcap/utils/constants.dart';
import 'package:coinmarketcap/login_page.dart';
import 'package:flutter/material.dart';

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
            child:
                setRegisterEmailTextField(textEdingController: emailController),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
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
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                ),
                hintText: 'Password',
              ),
            ),
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
                    ? await signUpNewUser()
                    : await signInWithEmail();
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
        debugPrint(data.event.toString());
        final event = data.event;
        if(event == AuthChangeEvent.initialSession){
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        } 
        else if (event == AuthChangeEvent.signedIn) {
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
