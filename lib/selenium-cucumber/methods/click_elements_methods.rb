require_relative 'required_files'


def click(access_type, access_name, visible_flag = true)
	# expect(page).not_to have_xpath("//html[@class='progressDot']")
	using_wait_time 15 do
		expect(page).to have_css("#{access_name}", visible: visible_flag)
	end
	# puts ("----------------#{access_name}--------------------")
	find(:"#{access_type}", "#{access_name}", visible: visible_flag).hover unless visible_flag
	find(:"#{access_type}", "#{access_name}", visible: visible_flag).click

	expect(page).not_to have_xpath("//html[@class='progressDot']")
	# using_wait_time 15 do
	# 	expect(page).to have_css("#{access_name}", visible: visible_flag)
	# end
end

def context_click(access_type, access_name)
	expect(page).not_to have_xpath("//html[@class='progressDot']")
	using_wait_time 15 do
		expect(page).to have_xpath("#{access_name}")
	end
	find(:"#{access_type}", "#{access_name}").right_click
end