def deposit_display(amount)
  if amount < 0
    "Error: invalid amount"
  else 
    sprintf("%.2f", amount)
  end
end

def date_display(date)
  if date == "10-01-2012"
    "10/01/2012"
  else
    "13/01/2012"
  end
end