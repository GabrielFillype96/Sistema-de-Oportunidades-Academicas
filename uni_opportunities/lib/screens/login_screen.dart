import 'package:flutter/material.dart';
import 'student/feed_screen.dart';
import 'student/student_navigation.dart';

// StatelessWidget means that the widget itself doesn't have internal changing state
// StatefulWidget means that the widget can have some changeable information while the application is running
// This is the widget itself
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // Creates and returns the State related with LoginScreenState
  // Dart's arrow syntax is a shorter way of writing with "return"
  State<LoginScreen> createState() => _LoginScreenState();
}

// This is the State which contains the changing information
class _LoginScreenState extends State<LoginScreen> {
  // Gives the form a unique identification card
  // FormState is a State object with some properties, such as validation
  final _formKey = GlobalKey<FormState>();

  // Text controllers that allow us to access what the user has typed
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Variable that represents the current visible state of the password
  bool _obscurePassword = true;

  // As controllers hold resources, we have to clean them up when the application is destroyed
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold is a widget that provides a structural skeleton to configure UI elements
    return Scaffold(
      // SafeArea adds necessary padding to prevent content from being blocked
      body: SafeArea(
        // LayoutBuilder builds a widget tree based on the size constraints
        // passed down by its parent widget.
        child: LayoutBuilder(
          builder: (context, constraints) {
            // If the content doesn't fit, SingleChildScrollView
            // allows you to scroll up and reach the fields
            return SingleChildScrollView(
              child: ConstrainedBox(
                // Makes the content be at least as tall as the available screen
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'UniOpportunities',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 16),

                      Text(
                        'Find academic opportunities\nand build your journey.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),

                      SizedBox(height: 40),

                      // Login card
                      Container(
                        // Will use all the horizontal space available, counting with the 24px padding
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        // How this container will look like
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Enter in your Account',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),

                            SizedBox(height: 32),

                            // Form groups the fields that belong to the same form
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    // Text controller.
                                    controller: _emailController,

                                    // Login validation.
                                    validator: (value) {
                                      // Validation of empty or null insertion
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your e-mail';
                                      }

                                      // Validation of no '@' insertions.
                                      if (!value.contains('@')) {
                                        return 'Please enter a valid e-mail';
                                      }

                                      return null;
                                    },

                                    decoration: InputDecoration(
                                      labelText: 'E-mail',
                                      hintText: 'your@email.com',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),

                                  SizedBox(height: 16),

                                  TextFormField(
                                    obscureText: _obscurePassword,

                                    // Text controller.
                                    controller: _passwordController,

                                    // Password validation
                                    validator: (value) {
                                      // Validation of empty or null insertion
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your password';
                                      }

                                      // Validation of the number of characters
                                      if (value.length < 8) {
                                        return 'Password must be at least 8 characters';
                                      }

                                      return null;
                                    },

                                    // Mostly the front-end configuration
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      hintText: 'Enter your password',
                                      border: OutlineInputBorder(),

                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          // Ternary operator:
                                          // condition ? value_if_true : value_if_false
                                          //
                                          // If _obscurePassword is true
                                          // (password is obscured),
                                          // show the visibility icon.
                                          //
                                          // If _obscurePassword is false
                                          // (password is NOT obscured),
                                          // show the visibility_off icon.
                                          _obscurePassword ? Icons.visibility : Icons.visibility_off,
                                        ),

                                        onPressed: () {
                                          // When pressing the icon,
                                          // set the state to the opposite bool value
                                          setState(() {
                                            _obscurePassword =
                                                !_obscurePassword;
                                          });
                                        },
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 24),

                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      // Validate what is inserted in the fields
                                      // when the button is pressed
                                      onPressed: () {
                                        final isValid = _formKey.currentState!.validate();

                                        // If the form validation is true print in the terminal the email typed
                                        if (isValid) {
                                          // Works like a stack of screens
                                          // When another screen appears, Flutter put it on top
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => const StudentNavigation(),
                                            ),
                                          );
                                          debugPrint(
                                            'E-mail: ${_emailController.text}',
                                          );
                                        }
                                      },
                                      child: Text('LOGIN'),
                                    ),
                                  ),
                                ],
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
          },
        ),
      ),
    );
  }
}