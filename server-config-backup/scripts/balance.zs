// ============================================================
// balance.zs — закрывает обходы прогрессии HBM в IE и Industrial Wires,
// привязывает топовые турели OMT к материалам HBM.
//
// См. план: ~/.claude/plans/binary-snacking-hollerith.md, раздел 8.
// Все ссылки на предметы проверены по jar-файлам модов (не угаданы).
// ============================================================

// --- 1. Сталь Immersive Engineering: убираем рецепт доменной печи ---
// immersiveengineering:metal:8 — слиток стали IE (подтверждено по
// assets/immersiveengineering/recipes/metal_storage/steel_ingot.json)
mods.immersiveengineering.BlastFurnace.removeRecipe(<immersiveengineering:metal:8>);

// --- 2. Marx-генератор Industrial Wires: убираем переработку руды в пыль/самоцветы ---
// Подтверждено по malte0811/industrialwires/hv/MarxOreHandler.class —
// зарегистрированы все 14 руд по умолчанию.
// Цикл "for x in [...]" вызывает "Truncated class file" в этой версии ZenScript
// (баг компилятора при вызове нативного метода внутри for), поэтому разворачиваем построчно.
mods.industrialwires.MarxGenerator.removeRecipe(<ore:oreIron>);
mods.industrialwires.MarxGenerator.removeRecipe(<ore:oreGold>);
mods.industrialwires.MarxGenerator.removeRecipe(<ore:oreCopper>);
mods.industrialwires.MarxGenerator.removeRecipe(<ore:oreAluminum>);
mods.industrialwires.MarxGenerator.removeRecipe(<ore:oreLead>);
mods.industrialwires.MarxGenerator.removeRecipe(<ore:oreSilver>);
mods.industrialwires.MarxGenerator.removeRecipe(<ore:oreNickel>);
mods.industrialwires.MarxGenerator.removeRecipe(<ore:oreUranium>);
mods.industrialwires.MarxGenerator.removeRecipe(<ore:oreDiamond>);
mods.industrialwires.MarxGenerator.removeRecipe(<ore:oreEmerald>);
mods.industrialwires.MarxGenerator.removeRecipe(<ore:oreLapis>);
mods.industrialwires.MarxGenerator.removeRecipe(<ore:oreCoal>);
mods.industrialwires.MarxGenerator.removeRecipe(<ore:oreRedstone>);
mods.industrialwires.MarxGenerator.removeRecipe(<ore:oreQuartz>);

// --- 3. OMT: топовые турели требуют материалы HBM вместо чистого ванильного лута ---
// Ранние/средние турели (machine gun, potato, incendiary, grenade, disposable,
// teleporter) не трогаем — это дешёвая ранняя-средняя оборона.

// Рельсотрон: обсидиановая обшивка -> титановая плита HBM
recipes.remove(<openmodularturrets:rail_gun_turret>);
recipes.addShaped(<openmodularturrets:rail_gun_turret>,
    [[<hbm:plate_titanium>, <openmodularturrets:intermediate_tiered:14>, <hbm:plate_titanium>],
     [<hbm:plate_titanium>, <openmodularturrets:intermediate_tiered:14>, <hbm:plate_titanium>],
     [<openmodularturrets:intermediate_regular:0>, <openmodularturrets:intermediate_tiered:9>, <openmodularturrets:intermediate_regular:0>]]);

// Лазерная турель: обсидиан -> титановая плита HBM
recipes.remove(<openmodularturrets:laser_turret>);
recipes.addShaped(<openmodularturrets:laser_turret>,
    [[null, <openmodularturrets:intermediate_tiered:14>, null],
     [<hbm:plate_titanium>, <openmodularturrets:intermediate_tiered:9>, <hbm:plate_titanium>],
     [<openmodularturrets:intermediate_regular:0>, <hbm:plate_titanium>, <openmodularturrets:intermediate_regular:0>]]);

// Ракетная турель: алмазы -> стальная плита HBM
recipes.remove(<openmodularturrets:rocket_turret>);
recipes.addShaped(<openmodularturrets:rocket_turret>,
    [[<ore:gemQuartz>, <openmodularturrets:intermediate_tiered:13>, <ore:gemQuartz>],
     [<openmodularturrets:intermediate_tiered:13>, <openmodularturrets:intermediate_tiered:8>, <openmodularturrets:intermediate_tiered:13>],
     [<hbm:plate_steel>, <openmodularturrets:intermediate_regular:0>, <hbm:plate_steel>]]);

// Релятивистская турель: золото -> стальные слитки HBM
recipes.remove(<openmodularturrets:relativistic_turret>);
recipes.addShaped(<openmodularturrets:relativistic_turret>,
    [[<hbm:ingot_steel>, <minecraft:ender_pearl>, <hbm:ingot_steel>],
     [<minecraft:ender_pearl>, <openmodularturrets:intermediate_tiered:2>, <minecraft:ender_pearl>],
     [<hbm:ingot_steel>, <openmodularturrets:intermediate_regular:0>, <hbm:ingot_steel>]]);
