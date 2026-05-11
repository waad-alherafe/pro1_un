import 'package:flutter_test/flutter_test.dart';

import 'package:pro1_un/main.dart';

void main() {
  testWidgets('shows onboarding screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Welcome to PocketShop'), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);
    expect(find.text('Skip for Now'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);
    expect(find.text('Create Account'), findsOneWidget);
  });
}
