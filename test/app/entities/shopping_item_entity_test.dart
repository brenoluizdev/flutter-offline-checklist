import 'package:checklist/app/entities/shopping_item_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final createdAt = DateTime.fromMillisecondsSinceEpoch(1700000000000);

  group('ShoppingItemEntity', () {
    test('começa como não concluído e sem id', () {
      final item = ShoppingItemEntity(title: 'Café', createdAt: createdAt);

      expect(item.id, isNull);
      expect(item.title, 'Café');
      expect(item.isCompleted, isFalse);
    });

    test('copyWith altera apenas os campos informados', () {
      final item = ShoppingItemEntity(
        id: '1',
        title: 'Café',
        createdAt: createdAt,
      );

      final updated = item.copyWith(title: 'Chá', isCompleted: true);

      expect(updated.id, '1');
      expect(updated.title, 'Chá');
      expect(updated.createdAt, createdAt);
      expect(updated.isCompleted, isTrue);
    });

    test('toMap serializa os campos persistidos', () {
      final item = ShoppingItemEntity(
        title: 'Leite',
        createdAt: createdAt,
        isCompleted: true,
      );

      expect(item.toMap(), {
        'title': 'Leite',
        'isCompleted': true,
        'createdAt': createdAt.millisecondsSinceEpoch,
      });
    });

    test('fromMap reconstrói a entidade', () {
      final item = ShoppingItemEntity.fromMap({
        'id': '42',
        'title': 'Leite',
        'isCompleted': true,
        'createdAt': createdAt.millisecondsSinceEpoch,
      });

      expect(item.id, '42');
      expect(item.title, 'Leite');
      expect(item.isCompleted, isTrue);
      expect(item.createdAt, createdAt);
    });
  });
}
