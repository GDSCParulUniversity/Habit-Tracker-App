import 'package:flutter/material.dart';
import 'package:habit_tracker_app/Constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  Color buttonColor = kInActiveColor;
  bool value = false;
  bool passwordVisible = true;
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Color(0xFFFF575B)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: FocusScope(
            debugLabel: 'Scope',
            autofocus: true,
            child: Column(children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Text(
                  'Login to your Account',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 45,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Focus(
                      debugLabel: 'TextField1',
                      child: Builder(builder: (context) {
                        final FocusNode focusNode = Focus.of(context);
                        final bool hasFocus = focusNode.hasFocus;
                        return TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  hasFocus ? LightPinkColor : Colors.grey[100],
                              prefixIcon: Icon(
                                Icons.email,
                                color: hasFocus ? pinkColor : Colors.grey,
                              ),
                              contentPadding: const EdgeInsets.all(8),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                              focusedBorder: inputBorder,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                              hintText: "Email",
                              hintStyle: TextStyle(
                                color: hasFocus ? Colors.black : Colors.grey,
                              )),
                          keyboardType: TextInputType.emailAddress,
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Focus(
                      debugLabel: 'TextField2',
                      child: Builder(builder: (context) {
                        final FocusNode focusNode = Focus.of(context);
                        final bool hasFocus = focusNode.hasFocus;
                        return TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock,
                                  color: hasFocus ? pinkColor : Colors.grey),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                                icon: Icon(
                                    passwordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: hasFocus ? pinkColor : Colors.grey),
                              ),
                              filled: true,
                              fillColor:
                                  hasFocus ? LightPinkColor : Colors.grey[100],
                              contentPadding: const EdgeInsets.all(8),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                              focusedBorder: inputBorder,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                              hintText: "Password",
                              hintStyle: TextStyle(
                                color: hasFocus ? Colors.black : Colors.grey,
                              )),
                          obscureText: passwordVisible,
                          keyboardType: TextInputType.visiblePassword,
                        );
                      }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Theme(
                    data: ThemeData(unselectedWidgetColor: pinkColor),
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      activeColor: pinkColor,
                      value: this.value,
                      onChanged: (bool? value) {
                        setState(() {
                          this.value = value!;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Remember me',
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    buttonColor = pinkColor;
                  });
                },
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: pinkColor,
                        ),
                      )
                    : Container(
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.0),
                        ),
                        height: MediaQuery.of(context).size.height / 13,
                        width: MediaQuery.of(context).size.width - 18,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: buttonColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot the password?',
                    style: TextStyle(fontSize: 18, color: pinkColor),
                  )),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      indent: 20,
                      endIndent: 20,
                      thickness: 1,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  Text(
                    'or continue with.',
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 20,
                      endIndent: 20,
                      thickness: 1,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.grey.shade500)),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.facebook,
                          size: 30,
                          color: Color(0xFF209BEF),
                        )),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.grey.shade500)),
                    child: Image.network(
                      'http://pngimg.com/uploads/google/google_PNG19635.png',
                      height: 20,
                      width: 20,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.grey.shade500)),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.apple,
                          size: 30,
                          color: Colors.black,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Don't have an account?",
                      style: TextStyle(
                          letterSpacing: 0.5, color: Colors.grey[500]),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Sign up',
                        style: TextStyle(color: pinkColor),
                      )),
                ],
              ),
            ]),
          ),
        ));
  }
}
