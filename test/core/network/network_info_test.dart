import 'package:flutter_clean_architecture_poc/core/network/network_checker.dart';
import 'package:flutter_clean_architecture_poc/core/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNetworkChecker extends Mock implements NetworkChecker{}

void main() {
  late NetworkInfoImpl networkInfo;
  late MockNetworkChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockNetworkChecker();
    networkInfo = NetworkInfoImpl(mockDataConnectionChecker);
  });

  group('ísConnected', () {
    test('should forward the call to DataConnectionChecker.hasConnection',
        () async {
      final tHasConnectionFuture = Future.value(true);

      when(()=> mockDataConnectionChecker.hasConnection)
          .thenAnswer((_) => tHasConnectionFuture);

      final result = networkInfo.isConnected;
      verify(()=> mockDataConnectionChecker.hasConnection);
      expect(result, tHasConnectionFuture);
    });
  });
}
