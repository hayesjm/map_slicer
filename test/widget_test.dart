import 'package:flutter_test/flutter_test.dart';
import 'package:map_slicer/app/map_slicer_app.dart';

void main() {
  testWidgets('TSTS Map Slicer shell renders', (WidgetTester tester) async {
    await tester.pumpWidget(const MapSlicerApp());
    await tester.pumpAndSettle();

    expect(find.text('TSTS Map Slicer'), findsOneWidget);
    expect(find.text('Image Controls'), findsOneWidget);
    expect(find.text('Grid Controls'), findsOneWidget);
    expect(find.text('Output Controls'), findsOneWidget);
    expect(find.text('Export PDF'), findsOneWidget);
    expect(find.text('Preview'), findsOneWidget);
    expect(find.text('Image Info'), findsOneWidget);
    expect(find.text('Map Info'), findsOneWidget);
    expect(find.text('PDF Info'), findsOneWidget);
  });
}