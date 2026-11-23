import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_gitar_akorlari/oyun_gitar_akorlari.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(gitarAkorlariConfig.title.length, 33);
    expect(gitarAkorlariConfig.tagline.length, 33);
    for (final s in gitarAkorlariConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(gitarAkorlariConfig.gameId, gitarAkorlariId);
    expect(gitarAkorlariRules.gameId, gitarAkorlariId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(gitarAkorlariRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: gitarAkorlariId, optionalMechanics: gitarAkorlariRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(gitarAkorlariRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
