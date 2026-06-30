import 'package:flutter/material.dart';
import 'package:pro1_un/widget/profile_form_widgets.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _hideCurrentPassword = true;
  bool _hideNewPassword = true;
  bool _hideConfirmPassword = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _savePassword() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    Navigator.pop(context, true);
  }

  Widget _visibilityButton({
    required bool isHidden,
    required VoidCallback onPressed,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        isHidden ? Icons.visibility_off_outlined : Icons.visibility_outlined,
        color: profileTextGray,
      ),
    );
  }

  String? _passwordValidator(String? value, String label) {
    if (value == null || value.isEmpty) {
      return '$label is required';
    }
    if (value.length < 6) {
      return '$label must be at least 6 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text('Change Password'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProfileFormHeader(
                  icon: Icons.lock_outline,
                  title: 'Password',
                  subtitle: 'Choose a new password for your account.',
                ),
                const SizedBox(height: 26),
                ProfileFormCard(
                  children: [
                    ProfileTextField(
                      controller: _currentPasswordController,
                      label: 'Current password',
                      icon: Icons.lock_clock_outlined,
                      obscureText: _hideCurrentPassword,
                      textInputAction: TextInputAction.next,
                      suffixIcon: _visibilityButton(
                        isHidden: _hideCurrentPassword,
                        onPressed: () {
                          setState(() {
                            _hideCurrentPassword = !_hideCurrentPassword;
                          });
                        },
                      ),
                      validator: (value) =>
                          _passwordValidator(value, 'Current password'),
                    ),
                    const SizedBox(height: 16),
                    ProfileTextField(
                      controller: _newPasswordController,
                      label: 'New password',
                      icon: Icons.lock_reset_outlined,
                      obscureText: _hideNewPassword,
                      textInputAction: TextInputAction.next,
                      suffixIcon: _visibilityButton(
                        isHidden: _hideNewPassword,
                        onPressed: () {
                          setState(() {
                            _hideNewPassword = !_hideNewPassword;
                          });
                        },
                      ),
                      validator: (value) =>
                          _passwordValidator(value, 'New password'),
                          ),
                    const SizedBox(height: 16),
                    ProfileTextField(
                      controller: _confirmPasswordController,
                      label: 'Confirm new password',
                      icon: Icons.verified_user_outlined,
                      obscureText: _hideConfirmPassword,
                      textInputAction: TextInputAction.done,
                      suffixIcon: _visibilityButton(
                        isHidden: _hideConfirmPassword,
                        onPressed: () {
                          setState(() {
                            _hideConfirmPassword = !_hideConfirmPassword;
                          });
                        },
                      ),
                      validator: (value) {
                        final passwordError = _passwordValidator(
                          value,
                          'Confirm password',
                        );
                        if (passwordError != null) {
                          return passwordError;
                        }
                        if (value != _newPasswordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                ProfilePrimaryButton(
                  label: 'Update Password',
                  icon: Icons.check_circle_outline,
                  onPressed: _savePassword,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

