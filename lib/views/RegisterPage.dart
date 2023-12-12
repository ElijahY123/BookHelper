import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_d_final/Models/model.dart';
import 'package:group_d_final/views/LoginPage.dart';

class registerPage extends StatefulWidget {
  const registerPage({super.key});

  @override
  State<registerPage> createState() => _accountCreate();
}

class _accountCreate extends State<registerPage> {
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
                "Create Account",
                style: GoogleFonts.gasoekOne(
                  textStyle: const TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 140),
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
                      decoration: InputDecoration(
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
                      decoration: InputDecoration(
                        label: Text(
                          "Password",
                          style: TextStyle(
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      controller: accountModel.confirmController,
                      obscureText: true,
                      decoration: InputDecoration(
                        label: Text(
                          "Confirm Password",
                          style: TextStyle(
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        if (accountModel.confirmPassword == accountModel.passWord) {
                          accountModel
                              .addAccount(accountModel.userName, accountModel.passWord);
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => loginPage()));
                        }
                        else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            backgroundColor: Colors.deepPurple,
                            content: Text("Passwords Do Not Match"),
                              ));
                        }
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
                            "Sign Up",
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
                      "Already a member?",
                      style: GoogleFonts.gasoekOne(
                        color: Colors.deepPurple,
                        textStyle: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => loginPage()));
                      },
                      child: Text(
                        "Login!",
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
