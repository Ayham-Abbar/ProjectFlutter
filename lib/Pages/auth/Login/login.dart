import 'package:domestore/Pages/Home/home_page.dart';
import 'package:domestore/Pages/auth/Register/register.dart';
import 'package:domestore/Pages/shared/Cache/sheredPrafrences.dart';
import 'package:domestore/Services/api.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _PasswordController = TextEditingController();
    final _UserNameController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 231, 239),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSajZmDxDFDHGaR7dASRW_R86ZlgLCa3-GHXA&s',
                      // width: 350,
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _UserNameController,
                      decoration: const InputDecoration(
                        labelText: 'UserName',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _PasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        await login({
                          'UserName': _UserNameController.text,
                          'Password': _PasswordController.text
                        },context);
                        print(_UserNameController.text);
                        print(_PasswordController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink[700],
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> login(Map<String, dynamic> userData, context) async {
    if ((CacheData.getData(key: 'UserName') == userData['UserName'] &&
            CacheData.getData(key: 'Password') == userData['Password']) ||
        await Api.loginUser(userData)) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const HomePage()), (_) => false);
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const SignUpScreen()));
    }
  }
}
