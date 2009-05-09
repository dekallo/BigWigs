﻿----------------------------------
--      Module Declaration      --
----------------------------------

local sara = BB["Sara"]
local boss = BB["Yogg-Saron"]
local mod = BigWigs:New(boss, "$Revision$")
if not mod then return end
mod.zonename = BZ["Ulduar"]
--Sara = 33134, Yogg brain = 33890
mod.guid = 33288 --Yogg
mod.toggleoptions = {"phase", "sanity", -1, "guardian", "mindcontrol", -1, "tentacle" , "malady", "link", "squeeze", "portal", "weakened", "madness", -1, "empower", "gaze", "icon", "berserk", "bosskill"}

------------------------------
--      Are you local?      --
------------------------------

local db = nil
local squeezeName = GetSpellInfo(64126)
local linkedName = GetSpellInfo(63802)
local count = 1

----------------------------
--      Localization      --
----------------------------

local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

L:RegisterTranslations("enUS", function() return {
	["Crusher Tentacle"] = true,
	["Brain of Yogg-Saron"] = true,

	cmd = "YoggSaron",

	phase = "Phase",
	phase_desc = "Warn for phase changes.",
	engage_warning = "Phase 1",
	engage_trigger = "^The time to",
	phase2_warning = "Phase 2",
	phase2_trigger = "^I am the lucid dream",
	phase3_warning = "Phase 3",
	phase3_trigger = "^Look upon the true face",

	portal = "Portal",
	portal_desc = "Warn for Portals.",
	portal_trigger = "Portals open into %s's mind!",
	portal_message = "Portals open!",
	portal_bar = "Next portals",

	sanity = "Sanity",
	sanity_desc = "Warn when your Sanity stack drops below 40.",
	sanity_message = "You're going insane!",

	weakened = "Stunned",
	weakened_desc = "Warn when Yogg-saron becomes stunned.",
	weakened_message = "%s is stunned!",
	weakened_trigger = "The illusion shatters and a path to the central chamber opens!",

	madness = "Induce Madness",
	madness_desc = "Show timer for Induce Madness.",
	madness_warning = "Madness in 5sec!",

	malady = "Malady of the Mind",
	malady_desc = "Warn when a player has Malady of the Mind.",
	malady_message = "Malady: %s",

	tentacle = "Crusher Tentacle",
	tentacle_desc = "Warn for Crusher Tentacle spawn.",
	tentacle_message = "Crusher %d!",

	squeeze = squeezeName,
	squeeze_desc = "Warn which player is squeezed.",
	squeeze_message = squeezeName .. ": %s",

	link = linkedName,
	link_desc = "Warn when you get linked with someone.",
	link_warning = "You are linked!",

	gaze = "Lunatic Gaze",
	gaze_desc = "Warn when Yogg-Saron gains Lunatic Gaze.",
	gaze_bar = "~Gaze Cooldown",

	empower = "Empowering Shadows",
	empower_desc = "Warn for Empowering Shadows.",
	empower_message = "Empowering Shadows!",
	empower_bar = "~Empower Cooldown",

	mindcontrol = "Mind Control",
	mindcontrol_desc = "Warn who is Mind Controlled.",
	mindcontrol_message = "Mind Control: %s",

	guardian = "Guardian spawn", --phase 1
	guardian_desc = "Warn when a Guardian of Yogg-Saron spawns.",
	guardian_message = "Guardian %d!",

	icon = "Place Icon",
	icon_desc = "Place a Raid Icon on the player with Malady of the Mind or Mind Control. (requires promoted or higher)",
} end )

L:RegisterTranslations("koKR", function() return {
	["Crusher Tentacle"] = "분쇄의 촉수",
	["Brain of Yogg-Saron"] = "요그사론의 뇌",

	phase = "단계",
	phase_desc = "단계 변화를 알립니다.",
	engage_warning = "1 단계",
	engage_trigger = "^짐승의 대장을 칠 때가 곧 다가올 거예요",
	phase2_warning = "2 단계",
	phase2_trigger = "^나는, 살아 있는 꿈이다",
	phase3_warning = "3 단계",
	phase3_trigger = "^죽음의 진정한 얼굴을 보아라",

	portal = "차원문",
	portal_desc = "차원문을 알립니다.",
	portal_trigger = "%s의 마음속으로 가는 차원문이 열립니다!",
	portal_message = "차원문 열림!",
	portal_bar = "다음 차원문",
	
	sanity = "이성",
	sanity_desc = "이성 중첩이 40이하면 알립니다.",
	sanity_message = "당신의 이성 위험!",

	weakened = "기절",
	weakened_desc = "기절 상태를 알립니다.",
	weakened_message = "%s 기절!",
	weakened_trigger = "환상이 부서지며, 중앙에 있는 방으로 가는 길이 열립니다!",

	madness = "광기 유발",
	madness_desc = "광기 유발의 타이머를 표시합니다.",
	madness_warning = "5초 후 광기 유발!",

	malady = "병든 정신",
	malady_desc = "병든 정신에 걸린 플레이어를 알립니다.",
	malady_message = "병든 정신: %s",
	
	tentacle = "촉수 소환",
	tentacle_desc = "촉수 소환을 알립니다.",
	tentacle_message ="분쇄의 촉수(%d)",

	squeeze = squeezeName,
	squeeze_desc = "압착에 붙잡힌 플레이어를 알립니다.",
	squeeze_message = squeezeName .. ": %s",

	link = linkedName,
	link_desc = "두뇌의 고리에 연결된 플레이어를 알립니다.",
	link_warning = "당신은 두뇌의 고리!",

	gaze = "광기의 시선",
	gaze_desc = "요그사론의 광기의 시선 획득을 알립니다.",
	gaze_bar = "~시선 대기시간",

	empower = "암흑 강화",
	empower_desc = "암흑 강화를 알립니다.",
	empower_message = "암흑 강화!",
	empower_bar = "~강화 대기시간",

	mindcontrol = "정신 지배",
	mindcontrol_desc = "정신 지배에 걸린 플레이어를 알립니다.",
	mindcontrol_message = "정신 지배: %s",

	guardian = "수호자 소환", --phase 1
	guardian_desc = "요그사론의 수호자 소환을 알립니다.",
	guardian_message = "수호자 소환 %d!",

	icon_desc = "병든 정신에 걸린 플레이어에게 전술 표시를 지정합니다. (승급자 이상 권한 필요)",
} end )

L:RegisterTranslations("frFR", function() return {
	["Crusher Tentacle"] = "Tentacule écraseur",
	["Brain of Yogg-Saron"] = "Cerveau de Yogg-Saron",

	phase = "Phase",
	phase_desc = "Prévient quand la rencontre entre dans une nouvelle phase.",
	engage_warning = "Phase 1",
	engage_trigger = "^Il sera bientôt temps de",
	phase2_warning = "Phase 2",
	phase2_trigger = "^Je suis le rêve éveillé",
	phase3_warning = "Phase 3",
	phase3_trigger = "^Contemplez le vrai visage de la mort",

	portal = "Portail",
	portal_desc = "Prévient de l'arrivée des portails.",
	portal_trigger = "Des portails s'ouvrent sur l'esprit |2 %s !",
	portal_message = "Portails ouverts !",
	portal_bar = "Prochains portails",

	sanity = "Santé mentale",
	sanity_desc = "Prévient quand votre cumul de Santé mentale descend en dessous de 40.",
	sanity_message = "Vous allez devenir fou !",

	weakened = "Étourdi",
	weakened_desc = "Prévient quand Yogg-Saron est étourdi.",
	weakened_message = "%s est étourdi !",
	weakened_trigger = "L'illusion se brise et un chemin s'ouvre vers la salle centrale !",

	madness = "Susciter la folie",
	madness_desc = "Affiche le délai avant la fin de l'incantation de Susciter la folie.",
	madness_warning = "Susciter la folie dans 5 sec. !",

	malady = "Mal de la raison",
	malady_desc = "Prévient quand un joueur subit les effets d'un Mal de la raison.",
	malady_message = "Mal : %s",

	tentacle = "Tentacule écraseur",
	tentacle_desc = "Prévient quand un Tentacule écraseur apparaît.",
	tentacle_message = "Écraseur %d !",

	squeeze = squeezeName,
	squeeze_desc = "Prévient quand un joueur subit les effets d'un Ecrasement.",
	squeeze_message = squeezeName .. " : %s",

	link = linkedName,
	link_desc = "Indique quels joueurs sont liées.",
	link_warning = "Votre cerveau est lié !",

	gaze = "Regard lunatique",
	gaze_desc = "Prévient quand Yogg-Saron incante un Regard lunatique.",
	gaze_bar = "~Recharge Regard",

	empower = "Renforcement des ombres",
	empower_desc = "Prévient de l'arrivée des Renforcements des ombres.",
	empower_message = "Renforcement des ombres !",
	empower_bar = "~Recharge Renforcement",

	mindcontrol = "Emprise",
	mindcontrol_desc = "Prévient quand un joueur subit les effets d'une Emprise.",
	mindcontrol_message = "Emprise : %s",

	guardian = "Apparition des gardiens", --phase 1
	guardian_desc = "Prévient quand un Gardien de Yogg-Saron apparaît.",
	guardian_message = "Gardien %d !",

	icon = "Icône",
	icon_desc = "Place une icône de raid sur le dernier joueur affecté par un Mal de la raison (nécessite d'être assistant ou mieux).",
} end )

L:RegisterTranslations("deDE", function() return {
	["Crusher Tentacle"] = "Schmettertentakel", -- needs verification!
	["Brain of Yogg-Saron"] = "Yogg-Sarons Gehirn", -- needs verification!

	phase = "Phasen",
	phase_desc = "Warnt bei Phasenwechsel.",
	engage_warning = "Phase 1",
	engage_trigger = "^Bald ist die Zeit", -- needs verification!
	phase2_warning = "Phase 2",
	phase2_trigger = "^Ich bin der strahlende Traum", -- needs verification!
	phase3_warning = "Phase 3",
	phase3_trigger = "^Erblicket das wahre Antlitz des Todes", -- needs verification!

	portal = "Portale",
	portal_desc = "Warnt, wenn Portale erscheinen.",
	portal_trigger = "Portale öffnen sich im Geist von %s!",
	portal_message = "Portale offen!",
	portal_bar = "Nächsten Portale",

	weakened = "Geschwächt",
	weakened_desc = "Warnt, wenn Yogg-Saron geschwächt ist.",
	weakened_message = "%s ist geschwächt!",
	--weakened_trigger = "The Illusion shatters and a path to the central chamber opens!", -- NEED!

	madness = "Wahnsinn hervorrufen",
	madness_desc = "Warnung und Timer für Wahnsinn hervorrufen.",
	madness_warning = "Wahnsinn in 5 sek!",

	malady = "Geisteskrankheit",
	malady_desc = "Warnung und Timer für Geisteskrankheit.",
	malady_message = "Geisteskrank: %s!",

	tentacle = "Schmettertentakel", --right?
	tentacle_desc = "Warnung und Timer für das Auftauchen der Schmettertentakel.",
	tentacle_message = "Schmettertentakel (%d)!",

	squeeze = squeezeName,
	squeeze_desc = "Warnt, welcher Spieler von Quetschen betroffen ist.",
	squeeze_message = squeezeName .. ": %s!",

	link = linkedName,
	link_desc = "Warnt, welche Spieler gehirnverbunden sind.",
	link_warning = "DU bist verbunden!",

	gaze = "Wahnsinniger Blick",
	gaze_desc = "Warnung und Timer für Wahnsinniger Blick.",
	gaze_bar = "~Wahnsinniger Blick",

	empower = "Machtvolle Schatten",
	empower_desc = "Warnung und Timer für Machtvolle Schatten.",
	empower_message = "Machtvolle Schatten!",
	empower_bar = "~Machtvolle Schatten",

	mindcontrol = "Gedanken beherrschen",
	mindcontrol_desc = "Warnt, wer mit Gedanken beherrschen übernommen wurde.",
	mindcontrol_message = "Gedankenkontrolle: %s!",

	guardian = "Wächter beschwören", --phase 1
	guardian_desc = "Warnt, wenn ein Wächter von Yogg-Saron beschwört wird.",
	guardian_message = "Wächter (%d)!",

	icon = "Schlachtzugs-Symbol",
	icon_desc = "Platziert ein Schlachtzugs-Symbol auf Spielern, die von Geisteskrankheit oder Gedanken beherrschen betroffen sind (benötigt Assistent oder höher).",
} end )

L:RegisterTranslations("zhCN", function() return {
--	["Crusher Tentacle"] = true,
--	["Brain of Yogg-Saron"] = true,

	phase = "阶段",
	phase_desc = "当阶段改变发出警报。",
	engage_warning = "第一阶段！",
--	engage_trigger = "^The time to",
	phase2_warning = "第二阶段！",
--	phase2_trigger = "^I am the lucid dream",
	phase3_warning = "第三阶段！",
--	phase3_trigger = "^Look upon the true face",

	portal = "传送门",
	portal_desc = "当传送门时发出警报。",
--	portal_trigger = "Portals open into Yogg-Saron's mind!",
	portal_message = "开启传送门！",
	portal_bar = "<下一传送门>",

	weakened = "昏迷",
	weakened_desc = "当尤格-萨隆昏迷时发出警报。",
	weakened_message = "昏迷：>%s<！",
--	weakened_trigger = "The Illusion shatters and a path to the central chamber opens!",

	madness = "Induce Madness",
	madness_desc = "显示Induce Madness计时器。",
	madness_warning = "5秒后，Induce Madness！",

	malady = "Malady of the Mind",
	malady_desc = "当玩家中了Malady of the Mind时发出警报。",
	malady_message = "Malady of the Mind：>%s<！",

	tentacle = "Crusher Tentacle",
	tentacle_desc = "当Crusher Tentacle出现时发出警报。",
	tentacle_message = "Crusher Tentacle：>%d<！",

	squeeze = squeezeName,
	squeeze_desc = "当玩家中了Squeeze时发出警报。",
	squeeze_message = squeezeName .. "：>%s<！",

	link = linkedName,
	link_desc = "当你被Brain Link时发出警报。",
	link_warning = ">你< Brain Link！",

	gaze = "疯乱凝视",
	gaze_desc = "当尤格-萨隆获得疯乱凝视时发出警报。",
	gaze_bar = "<疯乱凝视 冷却>",

	empower = "Empowering Shadows",
	empower_desc = "当Empowering Shadows时发出警报。",
	empower_message = "Empowering Shadows！",
	empower_bar = "<Empower Shadows 冷却>",

	mindcontrol = "统御意志",
	mindcontrol_desc = "当玩家中了统御意志时发出警报。",
	mindcontrol_message = "统御意志：>%s<！",

	guardian = "召唤守卫者出现", --phase 1
	guardian_desc = "当尤格-萨隆召唤守卫者出现时发出警报。",
	guardian_message = "召唤守卫者：>%d<！",

	icon_desc = "为中了Malady of the Mind的队员打上团队标记。（需要权限）",
} end )

L:RegisterTranslations("zhTW", function() return {
	["Crusher Tentacle"] = "粉碎觸手",
	["Brain of Yogg-Saron"] = "尤格薩倫的腦部",

	phase = "階段",
	phase_desc = "當階段改變發出警報。",
	engage_warning = "第一階段",
	engage_trigger = "我們即將有機會打擊怪物的首腦!現在將你的憤怒與仇恨貫注在他的爪牙上!",
	phase2_warning = "第二階段！",
	phase2_trigger = "我是清醒的夢境。",
	phase3_warning = "第三階段！",
	phase3_trigger = "在我的真身面前顫抖吧。", --看看死亡的真實面貌，瞭解你們的末日降臨了!

	portal = "傳送門",
	portal_desc = "當傳送門時發出警報。",
	portal_trigger = "傳送門開啟進入%s的心靈!",
	portal_message = "開啟傳送門！",
	portal_bar = "<下一傳送門>",

	weakened = "昏迷",
	weakened_desc = "當尤格薩倫昏迷時發出警報。",
	weakened_message = "昏迷：>%s<！",
	weakened_trigger = "幻影粉碎，然後中央房間的道路就打開了!",

	madness = "瘋狂誘陷",
	madness_desc = "顯示瘋狂誘陷計時條。",
	madness_warning = "5秒後，瘋狂誘陷！",

	malady = "心靈缺陷",
	malady_desc = "當玩家中了心靈缺陷時發出警報。",
	malady_message = "心靈缺陷：>%s<！",

	tentacle = "粉碎觸手",
	tentacle_desc = "當粉碎觸手出現時發出警報。",
	tentacle_message = "粉碎觸手：>%d<！",

	squeeze = squeezeName,
	squeeze_desc = "當玩家中了壓榨時發出警報。",
	squeeze_message = squeezeName .. "：>%s<！",

	link = linkedName,
	link_desc = "當你被腦波連結時發出警報。",
	link_warning = ">你< 腦波連結！",

	gaze = "癡狂凝視",
	gaze_desc = "當尤格薩倫獲得癡狂凝視時發出警報。",
	gaze_bar = "<癡狂凝視 冷卻>",

	empower = "暗影信標",
	empower_desc = "當暗影信標時發出警報。",
	empower_message = "暗影信標！",
	empower_bar = "<暗影信標 冷卻>",

	mindcontrol = "支配心靈",
	mindcontrol_desc = "當玩家中了支配心靈時發出警報。",
	mindcontrol_message = "支配心靈：>%s<！",

	guardian = "召喚守護者出現", --phase 1
	guardian_desc = "當尤格薩倫守護者出現時發出警報。",
	guardian_message = "尤格薩倫守護者：>%d<！ ",

	icon_desc = "為中了心靈缺陷的隊員打上團隊標記。（需要權限）",
} end )

mod.enabletrigger = {boss, sara, L["Brain of Yogg-Saron"]}

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	self:AddCombatListener("SPELL_CAST_START", "Madness", 64059)
	self:AddCombatListener("SPELL_CAST_SUCCESS", "Empower", 64465)
	self:AddCombatListener("SPELL_CAST_SUCCESS", "Tentacle", 64144)
	self:AddCombatListener("SPELL_AURA_APPLIED", "Squeeze", 64125, 64126)
	self:AddCombatListener("SPELL_AURA_APPLIED", "Linked", 63802)
	self:AddCombatListener("SPELL_AURA_APPLIED", "Gaze", 64163)
	self:AddCombatListener("SPELL_AURA_APPLIED", "Malady", 63830)
	-- 63042 is the add MC during p1, 63120 is the MC when you go insane in p2/3.
	self:AddCombatListener("SPELL_AURA_APPLIED", "MControl", 63042, 63120)
	self:AddCombatListener("SPELL_AURA_REMOVED_DOSE", "SanityDecrease", 63050)
	self:AddCombatListener("SPELL_AURA_APPLIED_DOSE", "SanityIncrease", 63050)
	self:AddCombatListener("SPELL_SUMMON", "Guardian", 62979)
	self:AddCombatListener("UNIT_DIED", "BossDeath")

	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	db = self.db.profile
	count = 1
end

------------------------------
--      Event Handlers      --
------------------------------

--[[
-- XXX This function should work if we passed the whole tuple to combat listeners :(
function mod:Sanity(...)
	if not db.sanity then return end
	local player, _, spellId = select(4, ...)
	local amount = select(10, ...)
	if player == pName then
		if amount > 40 or not db.sanity then return end
		-- If it's less than 40, warn
		self:IfMessage(L["sanity_message"], "Personal", spellId)
	elseif amount < 21 then
		-- If it's less than 20, send them a whisper
		self:Whisper(player, L["sanity_message"])
	end
end]]

do
	local warned = {}
	local function getSanity(player)
		local sanity = nil
		for i = 1, 9 do
			local name, _, icon, stack = UnitDebuff(player, i)
			if not name then break end
			if icon == "Interface\\Icons\\Spell_Arcane_MindMastery" then
				sanity = stack
				break
			end
		end
		return sanity
	end
	function mod:SanityIncrease(player, spellId)
		if not db.sanity or not warned[player] then return end
		local sanity = getSanity(player)
		if sanity > 70 then warned[player] = nil end
	end
	function mod:SanityDecrease(player, spellId)
		if not db.sanity or warned[player] then return end
		local sanity = getSanity(player)
		if player == pName then
			if sanity > 40 then return end
			self:IfMessage(L["sanity_message"], "Personal", spellId)
			warned[player] = true
		elseif sanity < 31 then
			self:Whisper(player, L["sanity_message"])
			warned[player] = true
		end
	end
end

function mod:Guardian(_, spellID)
	if db.guardian then
		self:IfMessage(L["guardian_message"]:format(count), "Positive", spellID)
		count = count + 1
	end
end

function mod:MControl(player, spellId)
	if db.mindcontrol then
		self:IfMessage(L["mindcontrol_message"]:format(player), "Attention", spellId)
		self:Icon(player, "icon")
	end
end

function mod:Tentacle(_, spellID, source)
	-- Crusher Tentacle (33966) 50 sec
	-- Corruptor Tentacle (33985) 25 sec
	-- Constrictor Tentacle (33983) 20 sec
	if source == L["Crusher Tentacle"] and db.tentacle then
		self:IfMessage(L["tentacle_message"]:format(count), "Important", 64139)
		count = count + 1
		self:Bar(L["tentacle_message"]:format(count), 50, 64139)
	end
end

function mod:Malady(player, spellID)
	if db.malady then
		self:IfMessage(L["malady_message"]:format(player), "Attention", spellID)
		self:Icon(player, "icon")
	end
end

function mod:Squeeze(player, spellID)
	if db.squeeze then
		self:IfMessage(L["squeeze_message"]:format(player), "Positive", spellID)
	end
end

function mod:Linked(player, spellID)
	if db.link and player == pName then
		self:LocalMessage(L["link_warning"], "Personal", spellID, "Alarm")
	end
end

function mod:Gaze(_, spellID)
	if db.gaze then
		self:Bar(L["gaze_bar"], 13, spellID)
	end
end

function mod:Madness()
	if db.madness then
		self:Bar(L["madness"], 60, 64059)
		self:ScheduleEvent("MadnessWarning", "BigWigs_Message", 55, L["madness_warning"], "Urgent")
	end
end

function mod:Empower()
	if db.empower then
		self:IfMessage(L["empower_message"], "Attention", 64465)
		self:Bar(L["empower_bar"], 46, 64465)
	end
end

function mod:CHAT_MSG_RAID_BOSS_EMOTE(msg)
	if msg == L["portal_trigger"] and db.portal then
		self:IfMessage(L["portal_message"], "Positive", 35717)
		self:Bar(L["portal_bar"], 90, 35717)
	elseif msg == L["weakened_trigger"] and db.weakened then
		self:IfMessage(L["weakened_message"]:format(boss), "Positive", 50661) --50661, looks like a weakened :)
	end
end

function mod:CHAT_MSG_MONSTER_YELL(msg)
	if msg:find(L["engage_trigger"]) then
		phase = 1
		count = 1
		if db.phase then
			self:IfMessage(L["engage_warning"], "Attention")
		end
		if db.berserk then
			self:Enrage(900, true, true)
		end
	elseif msg:find(L["phase2_trigger"]) then
		phase = 2
		count = 1
		if db.phase then
			self:IfMessage(L["phase2_warning"], "Attention")
		end
		if db.portal then
			self:Bar(L["portal_bar"], 78, 35717)
		end
	elseif msg:find(L["phase3_trigger"]) then
		phase = 3
		self:CancelAllScheduledEvents()
		self:TriggerEvent("BigWigs_StopBar", self, L["tentacle_message"])
		self:TriggerEvent("BigWigs_StopBar", self, L["portal_bar"])
		self:TriggerEvent("BigWigs_StopBar", self, L["madness"])
		if db.phase then
			self:IfMessage(L["phase3_warning"], "Important", nil, "Alarm")
		end
		if db.empower then
			self:Bar(L["empower"], 46, 64486)
		end
	end
end

