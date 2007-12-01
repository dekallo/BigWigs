﻿------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Jan'alai"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)
local L2 = AceLibrary("AceLocale-2.2"):new("BigWigsCommonWords")

local fmt = string.format
local UnitName = UnitName
local db = nil

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Jan'alai",

	engage_trigger = "Spirits of da wind be your doom!",

	flame = "Flame Breath",
	flame_desc = "Warn who Jan'alai casts Flame Strike on.",
	flame_trigger = "Jan'alai begins to cast Flame Breath.",
	flame_message = "Flame Breath on %s!",

	icon = "Raid Icon",
	icon_desc = "Place a Raid Target Icon on the player targetted by Flame Breath. (requires promoted or higher)",

	bomb = "Fire Bomb",
	bomb_desc = "Show timers for Fire Bomb.",
	bomb_trigger = "I burn ya now!",
	bomb_message = "Incoming Fire Bombs!",

	adds = "Adds",
	adds_desc = "Warn for Incoming Adds.",
	adds_trigger = "Where ma hatcha? Get to work on dem eggs!",
	adds_message = "Incoming Adds!",
} end )

L:RegisterTranslations("frFR", function() return {
	engage_trigger = "Les esprits du vent, ils vont être votre fin !",

	flame = "Souffle de flammes",
	flame_desc = "Préviens sur qui Jan'alai incante son Souffle de flammes.",
	flame_trigger = "Jan'alai commence à lancer Souffle de flammes.",
	flame_message = "Souffle de flammes sur %s !",

	icon = "Icône",
	icon_desc = "Place une icône de raid sur le dernier joueur affecté par le Souffle de flammes (nécessite d'être promu ou mieux).",

	bomb = "Bombes incendiaires",
	bomb_desc = "Affiche les délais concernant les bombes incendiaires.",
	bomb_trigger = "J'vais vous cramer !",
	bomb_message = "Arrivée des bombes incendiaires !",

	adds = "Perce-coques",
	adds_desc = "Préviens de l'arrivée des perce-coques.",
	adds_trigger = "Sont où mes perce-coque ? Au boulot ! Faut qu'ça éclose !",
	adds_message = "Arrivée des perce-coques !",
} end )

L:RegisterTranslations("koKR", function() return {
	engage_trigger = "바람의 혼이 너희를 쓸어내리라!",

	flame = "화염 숨결",
	flame_desc = "잔알라이가 대상자방향으로 화염 숨결을 시전하는지 알립니다.",
	flame_trigger = "잔알라이|1이;가; 화염 숨결 시전을 시작합니다.",
	flame_message = "%s에 화염 숨결!",

	icon = "전술 표시",
	icon_desc = "화염 숨결 대상이된 플레이어에 전술 표시를 지정합니다. (승급자 이상 권한 필요)",

	bomb = "불폭탄",
	bomb_desc = "불폭탄에 대한 타이머를 표시합니다.",
	bomb_trigger = "태워버리겠다!",
	bomb_message = "잠시후 불폭탄!",

	adds = "부화사 등장",
	adds_desc = "부화사 등장에 대해 경고합니다.",
	adds_trigger = "다 어디 갔지? 당장 알을 부화시켜!",
	adds_message = "잠시후 부화사 등장!",
} end )

L:RegisterTranslations("deDE", function() return {
	engage_trigger = "Die Geister der Winde besiegeln Euer Schicksal!",

	flame = "Flammenatem",
	flame_desc = "Warnt auf wen Flammenatem von Jan'alai gewirkt wird.",
	flame_trigger = "Jan'alai beginnt Flammenatem zu wirken.",
	flame_message = "Flammenatem auf %s!",

	icon = "Schlachtzug Symbol",
	icon_desc = "Plaziert ein Schlachtgruppen Symbol auf Spielern auf die Flammenatem gewirkt wird(benötigt Assistent oder höher).",

	bomb = "Feuerbombe",
	bomb_desc = "Zeigt Timer für Feuerbomben an.",
	bomb_trigger = "Jetzt sollt Ihr brennen!",
	bomb_message = "Neue Feuerbomben!",

	adds = "Brutwächter",
	adds_desc = "Warnt wenn Brutwächter gerufen werden.",
	adds_trigger = "Wo is' meine Brut? Was ist mit den Eiern?",
	adds_message = "Brutwächter wurden gerufen!",
} end )


L:RegisterTranslations("zhCN", function() return {
	engage_trigger = "风之圣魂将是你的梦魇！",

	flame = "烈焰吐息",
	flame_desc = "当加亚莱施放烈焰吐息发出警报。",
	flame_trigger = "加亚莱开始施放烈焰吐息。",
	flame_message = "烈焰吐息：>%s<！",

	icon = "团队标记",
	icon_desc = "给中了烈焰吐息的玩家打上团队标记。(需要权限)",

	bomb = "火焰炸弹",
	bomb_desc = "显示火焰炸弹记时条。",
	bomb_trigger = "烧死你们！",
	bomb_message = "即将 - 火焰炸弹！",

	adds = "援兵",
	adds_desc = "援兵即将到来时发出警报。",
	adds_trigger = "雌鹰哪里去了？快去孵蛋！",
	adds_message = "即将出现 救援！",
} end )

L:RegisterTranslations("zhTW", function() return {
	engage_trigger = "風之聖魂將是你的夢魘!",

	flame = "火息術",
	flame_desc = "警告賈納雷施放火息術",
	flame_trigger = "賈納雷開始施放火息術。",
	flame_message = "火息術：[%s] - 散開",

	icon = "標記圖示",
	icon_desc = "為被火息術的玩家設置團隊標記（需要權限）",

	bomb = "燃燒彈",
	bomb_desc = "燃燒彈警報",
	bomb_trigger = "燒死你們!",
	bomb_message = "火焰炸彈即將出現!",

	adds = "救援",
	adds_desc = "警告救援即將出現",
	adds_trigger = "雌鷹哪裡去啦?快去孵蛋!",
	adds_message = "救援即將出現!",
} end )

L:RegisterTranslations("esES", function() return {
	engage_trigger = "\194\161Los esp\195\173ritus del viento ser\195\161n vuestra maldici\195\179n!",

	flame = "Aliento de llamas",
	flame_desc = "Avisa sobre quien lanza Jan'alai Aliento de llamas.",
	flame_trigger = "Jan'alai comienza a lanzar Aliento de llamas.",
	flame_message = "\194\161Aliento de llamas en %s!",

	icon = "Icono de Banda",
	icon_desc = "Coloca un Icono de Banda sobre el jugador objetivo de Aliento de llamas. (requiere asistente o superior)",

	bomb = "Bomba de Fuego",
	bomb_desc = "Muestra temporizadores para Bomba de Fuego.",
	bomb_trigger = "\194\161Ahora os quemar\195\169!",
	bomb_message = "\194\161Bomba de Fuego!",

	adds = "A\195\177adidos",
	adds_desc = "Avisa la llegada de a\195\177adidos.",
	adds_trigger = "\194\191D\195\179nde est\195\161 mi criador? \194\161A por los huevos!",
	adds_message = "\194\161A\195\177adidos!",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = BigWigs:NewModule(boss)
mod.zonename = GetAddOnMetadata("BigWigs_ZulAman", "X-BigWigs-LoadInZone") or AceLibrary("AceLocale-2.2"):new("BigWigs_Zul'Aman")["Zul'Aman"]
mod.enabletrigger = boss
mod.toggleoptions = {"bomb", "adds", -1, "flame", "icon", "enrage", "berserk", "bosskill"}
mod.revision = tonumber(("$Revision$"):sub(12, -3))

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")

	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	db = self.db.profile
end

------------------------------
--      Event Handlers      --
------------------------------

local function ScanTarget()
	local target
	if UnitName("target") == boss then
		target = UnitName("targettarget")
	elseif UnitName("focus") == boss then
		target = UnitName("focustarget")
	else
		local num = GetNumRaidMembers()
		for i = 1, num do
			if UnitName(fmt("%s%d%s", "raid", i, "target")) == boss then
				target = UnitName(fmt("%s%d%s", "raid", i, "targettarget"))
				break
			end
		end
	end
	if target then
		mod:Message(fmt(L["flame_message"], target), "Important")
		if mod.db.profile.icon then
			mod:Icon(target)
		end
	end
end

function mod:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE(msg)
	if db.flame and msg == L["flame_trigger"] then
		self:ScheduleEvent("BWFlameToTScan", ScanTarget, 0.2)
		self:ScheduleEvent("BWRemoveJanIcon", "BigWigs_RemoveRaidIcon", 4, self)
	end
end

function mod:CHAT_MSG_MONSTER_YELL(msg)
	if db.bomb and msg == L["bomb_trigger"] then
		self:Message(L["bomb_message"], "Urgent")
		self:Bar(L["bomb"], 12, "Spell_Fire_Fire")
	elseif db.adds and msg == L["adds_trigger"] then
		self:Message(L["adds_message"], "Positive")
		self:Bar(L["adds"], 92, "INV_Misc_Head_Troll_01")
	elseif msg == L["engage_trigger"] then
		if db.enrage then
			self:Message(fmt(L2["enrage_start"], boss, 5), "Attention")
			self:DelayedMessage(120, fmt(L2["enrage_min"], 3), "Positive")
			self:DelayedMessage(240, fmt(L2["enrage_min"], 1), "Positive")
			self:DelayedMessage(270, fmt(L2["enrage_sec"], 30), "Positive")
			self:DelayedMessage(290, fmt(L2["enrage_sec"], 10), "Urgent")
			self:DelayedMessage(295, fmt(L2["enrage_sec"], 5), "Urgent")
			self:DelayedMessage(300, fmt(L2["enrage_end"], boss), "Attention", nil, "Alarm")
			self:Bar(L2["enrage"], 300, "Spell_Shadow_UnholyFrenzy")
		end
		if db.berserk then
			self:DelayedMessage(420, fmt(L2["berserk_min"], 3), "Positive")
			self:DelayedMessage(540, fmt(L2["berserk_min"], 1), "Positive")
			self:DelayedMessage(570, fmt(L2["berserk_sec"], 30), "Positive")
			self:DelayedMessage(590, fmt(L2["berserk_sec"], 10), "Urgent")
			self:DelayedMessage(595, fmt(L2["berserk_sec"], 5), "Urgent")
			self:DelayedMessage(600, fmt(L2["berserk_end"], boss), "Attention", nil, "Alarm")
			self:Bar(L2["berserk"], 600, "Spell_Nature_Reincarnation")
		end
		if db.adds then
			self:Bar(L["adds"], 12, "INV_Misc_Head_Troll_01")
		end
	end
end
