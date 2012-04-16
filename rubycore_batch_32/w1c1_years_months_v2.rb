def age_in_seconds(all_years_seconds)
	seconds = 60
	minutes = 60
	hours = 24

  seconds_in_a_day = seconds * minutes * hours
	seconds_in_a_month = seconds_in_a_day * 30
	seconds_in_a_year = seconds_in_a_day * 365

	year_residual = all_years_seconds % seconds_in_a_year
	days_residual = year_residual % seconds_in_a_month

	years = (all_years_seconds - year_residual) / seconds_in_a_year
	months = (year_residual - days_residual) / seconds_in_a_month
  
	return  years, months
 
end

ages = [979000000, 2158493738, 246144023, 1270166272, 1025600095]

ages.each do |all_year_seconds|
	puts "You are %s and %s months old" % age_in_seconds(all_year_seconds)
end

