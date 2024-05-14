import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_d_final/Models/model.dart';
import 'package:group_d_final/views/RegisterPage.dart';


class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _accountLogin();
}

class _accountLogin extends State<loginPage> {
  AccountModel accountModel = AccountModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff8d76d3),
                  Color(0xff5c53cb),
                  Color(0xff5d40ce),
                  Color(0xff4100E0),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 60.0,
                left: 22,
              ),
              child: Text(
                "Welcome",
                style: GoogleFonts.gasoekOne(
                  textStyle: const TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: accountModel.usernameController,
                      obscureText: false,
                      decoration: const InputDecoration(
                        label: Text(
                          "Username",
                          style: TextStyle(
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      controller: accountModel.passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text(
                          "Password",
                          style: TextStyle(
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 70,),
                    GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        accountModel.retrieveLoginInfo(context);
                      },
                      child: Container(
                        height: 100,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff8d76d3),
                              Color(0xff5c53cb),
                              Color(0xff5d40ce),
                              Color(0xff4100E0),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                              "Login",
                            style: GoogleFonts.gasoekOne(
                              color: Colors.white,
                              textStyle: const TextStyle(
                                fontSize: 40,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Text(
                        "Not a member?",
                      style: GoogleFonts.gasoekOne(
                        color: Colors.deepPurple,
                        textStyle: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const registerPage()));
                        },
                        child: Text(
                          "Join Now!",
                          style: GoogleFonts.gasoekOne(
                            color: Colors.deepPurple,
                            textStyle: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

