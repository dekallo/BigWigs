local L = BigWigs:NewBossLocale("Ulgrax the Devourer", "zhCN")
if not L then return end
if L then
	L.chunky_viscera_message = "喂食首领！（额外快捷键）"
end

L = BigWigs:NewBossLocale("The Bloodbound Horror", "zhCN")
if L then
	L.grasp_from_beyond = "触手"
	L.grasp_from_beyond_say = "触手"
	L.bloodcurdle = "分散"
	L.bloodcurdle_on_you = "分散" -- Singular of Spread
	L.goresplatter = "跑开"
end

L = BigWigs:NewBossLocale("Rasha'nan", "zhCN")
if L then
	--L.rolling_acid = "Waves"
	L.spinnerets_strands = "丝线"
	L.enveloping_webs = "蛛网"
	L.enveloping_web_say = "蛛网" -- Singular of Webs
	L.erosive_spray = "喷涌"
	L.caustic_hail = "下一个位置"
end

L = BigWigs:NewBossLocale("Broodtwister Ovi'nax", "zhCN")
if L then
	L.sticky_web_say = "蛛网"
	L.infest_message = "对你施放感染！"
	L.infest_say = "寄生"
	L.experimental_dosage_say = "烧蛋"
	--L.unstable_infusion = "Swirls"
	--L.custom_on_experimental_dosage_marks = "Experimental Dosage assignments"
	--L.custom_on_experimental_dosage_marks_desc = "Assign players affected by 'Experimental Dosage' to {rt6}{rt4}{rt3}{rt7} with a melee > ranged > healer priority. Affects Say and Target messages."
end

L = BigWigs:NewBossLocale("Nexus-Princess Ky'veza", "zhCN")
if L then
	L.assasination = "幻影"
	L.twiligt_massacre = "冲锋"
	L.nexus_daggers = "匕首"
end
