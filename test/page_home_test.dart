import 'package:flutter_test/flutter_test.dart';
import 'package:teste_tecnico/models/marca.dart';
import 'package:teste_tecnico/models/notification.dart';
import 'package:teste_tecnico/models/suites.dart';
import 'package:teste_tecnico/page/page_home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() {
  group('PageHome Tests', () {
    late PageHomeState pageHomeState;

    setUp(() {
      pageHomeState = PageHomeState();
    });

    test('fetchData retorna dados da apiMoc', () async {
      try {
        final data = await pageHomeState.fetchData();
        expect(data, isNotNull);
        expect(data, isA<Map<String, dynamic>>());
      } catch (e) {
        fail('fetchData lançou uma exceção: $e');
      }
    });

    test('getMotel retorna  Motel', () async {
      try {
        final motel = await pageHomeState.getMotel();
        expect(motel, isNotNull);
        expect(motel, isA<Motel>());
      } catch (e) {
        fail('getMotel lançou uma exceção: $e');
      }
    });

    test('getMensagem retorna notificações, se tiver', () async {
      try {
        final notificacao = await pageHomeState.getMensagem();
        expect(notificacao, isNotNull);
        expect(notificacao, isA<Notifications>());
      } catch (e) {
        fail('getMensagem lançou uma exceção: $e');
      }
    });

    test('getSuites returns a list of Suites', () async {
      try {
        final suites = await pageHomeState.getSuites();
        expect(suites, isNotNull);
        expect(suites, isA<List<Suites>>());
        expect(suites.length, greaterThan(0));
      } catch (e) {
        fail('getSuites lançou uma exceção: $e');
      }
    });
  });
}
