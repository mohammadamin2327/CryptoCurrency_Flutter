import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';

class RegisterSettings {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<void> signUpNewUser(TextEditingController emailController,
      TextEditingController passwordController) async {
    final AuthResponse responseSignUpAuth = await supabase.auth.signUp(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  Future<void> signInWithEmail(TextEditingController emailController,
      TextEditingController passwordController) async {
    final AuthResponse responseSignInAuth =
        await supabase.auth.signInWithPassword(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
  }
}
