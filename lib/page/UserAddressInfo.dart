import 'package:flutter/material.dart';
import 'package:pro1_un/widget/profile_form_widgets.dart';

class UserAddressInfo {
  const UserAddressInfo({
    required this.label,
    required this.city,
    required this.street,
    required this.building,
    required this.apartment,
    required this.notes,
  });

  final String label;
  final String city;
  final String street;
  final String building;
  final String apartment;
  final String notes;

  String get summary {
    final parts = [
      city,
      street,
      building,
    ].where((part) => part.trim().isNotEmpty).toList();
    return parts.isEmpty ? 'No address saved' : parts.join(', ');
  }
}

class AddressManagement extends StatefulWidget {
  const AddressManagement({
    super.key,
    this.initialAddress = const UserAddressInfo(
      label: 'Home',
      city: 'Damascus',
      street: 'Main street',
      building: '',
      apartment: '',
      notes: '',
    ),
  });

  final UserAddressInfo initialAddress;

  @override
  State<AddressManagement> createState() => _AddressManagementState();
}

class _AddressManagementState extends State<AddressManagement> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _labelController;
  late final TextEditingController _cityController;
  late final TextEditingController _streetController;
  late final TextEditingController _buildingController;
  late final TextEditingController _apartmentController;
  late final TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    _labelController = TextEditingController(text: widget.initialAddress.label);
    _cityController = TextEditingController(text: widget.initialAddress.city);
    _streetController = TextEditingController(
      text: widget.initialAddress.street,
    );
    _buildingController = TextEditingController(
      text: widget.initialAddress.building,
    );
    _apartmentController = TextEditingController(
      text: widget.initialAddress.apartment,
    );
    _notesController = TextEditingController(text: widget.initialAddress.notes);
  }

  @override
  void dispose() {
    _labelController.dispose();
    _cityController.dispose();
    _streetController.dispose();
    _buildingController.dispose();
    _apartmentController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _saveAddress() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    Navigator.pop(
      context,
      UserAddressInfo(
        label: _labelController.text.trim(),
        city: _cityController.text.trim(),
        street: _streetController.text.trim(),
        building: _buildingController.text.trim(),
        apartment: _apartmentController.text.trim(),
        notes: _notesController.text.trim(),
      ),
    );
  }

  String? _requiredField(String? value, String label) {
    if (value == null || value.trim().isEmpty) {
      return '$label is required';
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
        title: const Text('Address Management'),
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
                  icon: Icons.location_on_outlined,
                  title: 'Delivery Address',
                  subtitle: 'Keep your delivery details ready for checkout.',
                ),
                const SizedBox(height: 26),
                ProfileFormCard(
                  children: [
                    ProfileTextField(
                      controller: _labelController,
                      label: 'Address label',
                      icon: Icons.bookmark_border,
                      textInputAction: TextInputAction.next,
                      validator: (value) =>
                          _requiredField(value, 'Address label'),
                    ),
                    const SizedBox(height: 16),
                    ProfileTextField(
                      controller: _cityController,
                      label: 'City',
                      icon: Icons.location_city_outlined,
                      textInputAction: TextInputAction.next,
                      validator: (value) => _requiredField(value, 'City'),
                    ),
                    const SizedBox(height: 16),
                    ProfileTextField(
                      controller: _streetController,
                      label: 'Street',
                      icon: Icons.route_outlined,
                      textInputAction: TextInputAction.next,
                      validator: (value) => _requiredField(value, 'Street'),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ProfileTextField(
                            controller: _buildingController,
                            label: 'Building',
                            icon: Icons.apartment_outlined,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ProfileTextField(
                            controller: _apartmentController,
                            label: 'Apartment',
                            icon: Icons.door_front_door_outlined,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ProfileTextField(
                      controller: _notesController,
                      label: 'Delivery notes',
                      icon: Icons.notes_outlined,
                      maxLines: 3,
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                ProfilePrimaryButton(
                  label: 'Save Address',
                  icon: Icons.location_on_outlined,
                  onPressed: _saveAddress,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
