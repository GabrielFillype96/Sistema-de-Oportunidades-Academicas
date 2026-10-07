import 'package:flutter_test/flutter_test.dart';
import 'package:uni_opportunities/main.dart';

void main() {
  testWidgets('UniOpportunities app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const UniOpportunitiesApp());

    expect(find.text('UniOpportunities'), findsOneWidget);
    expect(find.text('Enter in your Account'), findsOneWidget);
    expect(find.text('E-mail'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('LOGIN'), findsOneWidget);
  });
}