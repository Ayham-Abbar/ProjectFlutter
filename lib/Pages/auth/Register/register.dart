import 'package:domestore/Pages/Home/home_page.dart';
import 'package:domestore/Pages/shared/Cache/sheredPrafrences.dart';
import 'package:domestore/Services/api.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _UserName = TextEditingController();
    final _Password = TextEditingController();
    final _Email = TextEditingController();
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
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpWb5M0JkMTFGQd0LpXMOduNUYfIhEfx_sWA&s'),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _UserName,
                      decoration: const InputDecoration(
                        labelText: 'UserName',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _Email,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _Password,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        _register('/users/add', {
                          'UserName': _UserName.text,
                          'Password': _Password.text,
                          'Email': _Email.text
                        });
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => HomePage()),
                            (_) => false);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink[700],
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                      ),
                      child: const Text(
                        'SignUp',
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

  Future<void> _register(
    path,
    Map<String, dynamic> userData,
  ) async {
    await CacheData.setData(key: 'UserName', value: userData['UserName']);
    await CacheData.setData(key: 'Password', value: userData['Password']);
    await CacheData.setData(key: 'Email', value: userData['Email']);
    print(CacheData.getData(key: 'UserName'));
    print(CacheData.getData(key: 'Password'));
    print(CacheData.getData(key: 'Email'));
    await Api.addUser(path, userData);
  }
}
