import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/sing_up.dart';
import 'package:flutter_application_2/services/auth_service.dart';
import 'package:flutter_application_2/utils/app_validator.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var isLoader = false;
  var authService = AuthService();

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoader = true;
      });
      var data = {
        "email": _emailController.text,
        "password": _passwordController.text,
      };

      await authService.login(data, context);

      setState(() {
        isLoader = false;
      });
    }
  }

  var appValidator = AppValidator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 149, 233, 205),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 40.0,
                ),
                SizedBox(
                  width: 250,
                  child: Text(
                    "Entrar",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: _buildInputDecoration("Emal", Icons.email),
                    validator: appValidator.validateEmail),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.phone,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: _buildInputDecoration("Sanha", Icons.lock),
                  validator: appValidator.validatePassword,
                ),
                SizedBox(
                  height: 40.0,
                ),
                SizedBox(
                  height: 40.0,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 238, 131, 9)),
                    onPressed: () {
                      isLoader ? print("Carregando...") : _submitForm();
                    },
                    child: isLoader
                        ? Center(child: CircularProgressIndicator())
                        : Text(
                            "Entrar",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SingUpView()));
                  },
                  child: Text(
                    "Criar nova conta",
                    style: TextStyle(
                        color: Color.fromARGB(255, 238, 131, 9), fontSize: 20),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label, IconData suffixIcon) {
    return InputDecoration(
        fillColor: Color.fromARGB(255, 230, 250, 239),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        filled: true,
        labelStyle: TextStyle(color: Colors.black),
        labelText: label,
        suffixIcon: Icon(
          suffixIcon,
          color: Colors.black,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)));
  }
}
