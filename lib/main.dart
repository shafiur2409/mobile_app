
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:image_picker/image_picker.dart';


void main() {
  runApp(const MaterialApp(
    home: JargonLensHomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class JargonLensHomePage extends StatelessWidget {
  const JargonLensHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jargon Lens'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: 
         Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 200,),
           const Image(width: 250,height: 250,
              image: NetworkImage(
                'https://cdn-icons-png.flaticon.com/128/3898/3898082.png',
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(50,10,50,10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                ),
                child: Text(
                  'GET STARTED',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      )
    ;
  }
}

class AuthService {
  Future<bool> login(String username, String password) async {
    if (username == 'Ruby1815' && password == '123456') {
      return true;
    } else {
      return false;
    }
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoginFailed = false;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print('Error signing in with Google: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(icon:Icon(Icons.man_4,color: Colors.black,),
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(icon:Icon(Icons.password_sharp,color: Colors.black,),
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black,padding:  EdgeInsets.fromLTRB(50,10,50,10),),
              onPressed: () async {
                String enteredUsername = _usernameController.text;
                String enteredPassword = _passwordController.text;

                AuthService authService = AuthService();
                bool isAuthenticated =
                    await authService.login(enteredUsername, enteredPassword);

                if (isAuthenticated) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                } else {
                  setState(() {
                    isLoginFailed = true;
                  });
                }
              },
              child: Text('Login',style: GoogleFonts.lato(fontSize: 12),),
            ),
            if (isLoginFailed)
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  'Invalid username or password',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            SizedBox(height: 16.0),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black,padding:  EdgeInsets.fromLTRB(50,10,50,10),),
              onPressed: _handleSignIn
              ,
              child: Text('Sign Up with Google'),
            ),
            TextButton(onPressed:(){ Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUP()),
                  );},child: Text('Sign Up ?',style: GoogleFonts.lato(fontSize: 20,color: Colors.black),)),
          ],
        ),
      ),
    );
  }
}
class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
   final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
   final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  
  bool isLoginFailed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        title: Text('Welcome to Jargon Lens'),
        backgroundColor: Colors.black,
      ),body:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [SizedBox(height: 100,),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(icon:Icon(Icons.man_4,color: Colors.black,),
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              obscureText: true,
              decoration: InputDecoration(icon:Icon(Icons.mail_lock,color: Colors.black,),
                labelText: 'Email ID',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _phoneController,
              obscureText: true,
              decoration: InputDecoration(icon:Icon(Icons.phone,color: Colors.black,),
                labelText: 'Phone Number',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(icon:Icon(Icons.password_sharp,color: Colors.black,),
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black,padding:  EdgeInsets.fromLTRB(50,10,50,10),),
              onPressed:() {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );}
              ,
              child: Text('Register',style: GoogleFonts.lato(fontSize:20),),
            )
            ]));
  }
}
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the Home Screen!'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                
              },
              child: Text('Go to QR Code and Image'),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpWithGoogleScreen extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print('Error signing in with Google: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up with Google'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _handleSignIn,
              child: Text('Sign Up with Google'),
            ),
          ],
        ),
      ),
    );
  }
}