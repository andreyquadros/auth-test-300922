import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  @override
  void dispose(){
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  Future<void> registerUser() async {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _controllerEmail.text, password: _controllerPassword.text);

    credential.user!.sendEmailVerification();
  }
  Future<void> loginUser() async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _controllerEmail.text, password: _controllerPassword.text);
    if(credential.user != null && credential.user!.emailVerified ) {

      print(credential.user);
      print('logado');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página de Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 5),
            child: TextFormField(
              controller: _controllerEmail,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.blue,
              decoration: InputDecoration(
                fillColor: Colors.blue,
                focusColor: Colors.blue,
                hoverColor: Colors.blue,
                border: OutlineInputBorder(),
                hintText: 'E-mail',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 5, 32, 10),
            child: TextFormField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              controller: _controllerPassword,
              cursorColor: Colors.blue,
              decoration: InputDecoration(
                fillColor: Colors.blue,
                focusColor: Colors.blue,
                hoverColor: Colors.blue,
                border: OutlineInputBorder(),
                hintText: 'Senha',
              ),
            ),
          ),
          Container(
            width: 330,
            height: 80,
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: ElevatedButton.icon(
                  onPressed: loginUser,
                  icon: Icon(Icons.login),
                  label: Text("Logar")),
            ),
          ),
          Container(
            width: 330,
            height: 80,
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: ElevatedButton.icon(
                  onPressed: registerUser,
                  icon: Icon(Icons.app_registration),
                  label: Text("Registrar")),
            ),
          ),
        ],
      ),
    );
  }
}
