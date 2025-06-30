extends Node

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	'''MoneyPerDayDetailed['AllIncome'] = 0
	MoneyPerDayDetailed['AllExpense'] = 0 '''
	if Data.income_status:
		$MarginContainer2/Panel/HBoxContainer/VBoxContainer/HBoxHappy/work/work_lbl.text = Data.format_money(int(Data.Game.Player.MoneyPerDayDetailed['Work']), 3)
		$MarginContainer2/Panel/HBoxContainer/VBoxContainer/HBoxHappy/study/study_lbl.text = Data.format_money(int(Data.Game.Player.MoneyPerDayDetailed['Study']), 3)
		$MarginContainer2/Panel/HBoxContainer/VBoxContainer/HBoxHappy/food/food_lbl.text = Data.format_money(int(Data.Game.Player.MoneyPerDayDetailed['Food']), 3)
		$MarginContainer2/Panel/HBoxContainer/VBoxContainer/HBoxHappy/cloth/cloth_lbl.text = Data.format_money(int(Data.Game.Player.MoneyPerDayDetailed['Cloth']), 3)
		$MarginContainer2/Panel/HBoxContainer/VBoxContainer/HBoxHappy2/house/house_lbl.text = Data.format_money(int(Data.Game.Player.MoneyPerDayDetailed['Houses']), 3)
		$MarginContainer2/Panel/HBoxContainer/VBoxContainer/HBoxHappy2/business/business_lbl.text = Data.format_money(int(Data.Game.Player.MoneyPerDayDetailed['Business']), 3)
		$MarginContainer2/Panel/HBoxContainer/VBoxContainer/HBoxHappy2/cashback/cashback_lbl.text = Data.format_money(int(Data.Game.Player.MoneyPerDayDetailed['Cashback']), 3)
		$MarginContainer2/Panel/HBoxContainer/VBoxContainer/HBoxHappy2/investment/investment_lbl.text = Data.format_money(int(Data.Game.Player.MoneyPerDayDetailed['Investment']), 3)
		$MarginContainer2/Panel/HBoxContainer/moneyperday_lbl.text = Data.format_money(int(Data.Game.Player.MoneyPerDay))
	
