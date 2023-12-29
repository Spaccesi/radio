import 'package:flutter_test/flutter_test.dart';
import 'package:radio/app/app.dart';
import 'package:radio/radio/view/browser_page.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(BrowserPage), findsOneWidget);
    });
  });
}
