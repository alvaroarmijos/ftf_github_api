import 'package:flutter_test/flutter_test.dart';
import 'package:ftf_github_api/src/packages/features/home/home.dart';

void main() {
  group('HomeState', () {
    test('supports value comparision', () {
      expect(const HomeLoading(), const HomeLoading());
      expect(const HomeError(), const HomeError());
      expect(const HomeSuccess([]), const HomeSuccess([]));
    });
  });
}
