def deposit_display(amount)
  if amount < 0
    "Error: invalid amount"
  else 
    sprintf("%.2f", amount)
  end
end